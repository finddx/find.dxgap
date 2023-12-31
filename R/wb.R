#' Data from World Bank
#'
#' These help pages document the lower-level API to individually download, read,
#' and tidy data. For a higher-level API that works across all data sets,
#' see:
#' * [import_tbl()] to import any data
#'
#' The data sets currently available from World Bank in this package are:
#' * urban population
#' * total population
#' * population density
#' * gdp
#'
#' @section Source:
#' The World Bank API is documented at \url{https://datahelpdesk.worldbank.org/knowledgebase/articles/898581}.
#'
#' @name wb
NULL


#' Download data sets from the World Bank
#'
#' @param indicator A string indicating the label of the data set as documented
#'   in the World Bank API. For instance, "SP.POP.TOTL".
#' @param range_years The range of the years to be downloaded as a string.
#'
#' @return `download_wb()` returns invisibly the file path in which data are
#'   stored.
#'
#' @rdname wb
#'
#' @export
#'
#' @examples
#' \dontrun{
#' pop_urban <- download_wb(
#'   file_name = paste_dataset_name_date("wb", dataset = "pop_urban", file_ext = ".csv"),
#'   indicator = "SP.URB.TOTL.IN.ZS",
#'   range_years = "2015:2023"
#' )
#' pop_density <-
#'   download_wb(
#'     file_name = paste_dataset_name_date("wb", dataset = "pop_density", file_ext = ".csv"),
#'     indicator = "EN.POP.DNST",
#'     range_years = "2015:2023"
#'   )
#' pop_total <- download_wb(
#'   file_name = paste_dataset_name_date("wb", dataset = "pop_total", file_ext = ".csv"),
#'   indicator = "SP.POP.TOTL",
#'   range_years = "2015:2023"
#' )
#' gdp <- download_wb(
#'   file_name = paste_dataset_name_date("wb", dataset = "gdp", file_ext = ".csv"),
#'   indicator = "NY.GDP.MKTP.CD",
#'   range_years = "2015:2023"
#' )
#' }
download_wb <- function(file_name, indicator, range_years) {
  download_wb_impl(
    .file_name = file_name,
    .indicator = indicator,
    .range_years = range_years
  )
}

download_wb_impl <- function(.file_name = tempfile(compose_file_name("wb", .download_date, .indicator), fileext = ".csv"),
                             .indicator,
                             .range_years,
                             .url = "https://api.worldbank.org/v2/country/all/indicator",
                             .download_date = as.character(Sys.Date()),
                             .data_dir = Sys.getenv("DXGAP_DATADIR")) {
  req <-
    httr2::request(.url) |>
    httr2::req_url_path_append(.indicator) |>
    httr2::req_url_query(format = "json", date = .range_years)

  resp <- httr2::req_perform(req)
  page_one <- httr2::resp_body_json(resp)
  total_numb_pages <- page_one[[1]]$pages

  page_df <- tibble::tibble(
    page = seq_len(total_numb_pages),
    req = list(req)
  )

  nested_out <-
    page_df |>
    dplyr:::mutate(
      req_mod = purrr::map2(req, page, ~ httr2::req_url_query(.x, page = .y)),
      resp = purrr::map(req_mod, ~ req_perform_lazy(.x)),
      json = purrr::map(resp, ~ httr2::resp_body_json(.x)),
    )

  out <-
    nested_out |>
    dplyr::select(page, json) |>
    unnest_wb_resp() |>
    dplyr::mutate(download_date = .download_date)

  file_path <- compose_file_path(.file_name, .data_dir)
  readr::write_csv(out, file_path)
  invisible(normalizePath(file_path))
}

unnest_wb_resp <- function(data) {
  data |>
    tidyr::unnest_wider(json, names_sep = "_") |>
    dplyr::select(page, json_2) |>
    tidyr::unnest_longer(json_2) |>
    tidyr::unnest_wider(json_2) |>
    tidyr::unnest_wider(country, names_sep = "_") |>
    tidyr::unnest_wider(indicator, names_sep = "_")
}

#' Read World Bank data sets
#'
#' @param file_name A string containing the name of the file to be read.
#' @param data_dir Path containing the directory to read the data from. Defaults
#' to the path set by the environment variable `"DXGAP_DATADIR"`.
#'
#' @return `read_wb()` a tibble containing the data set.
#'
#' @seealso [import_tbl()]
#'
#' @rdname wb
#'
#' @export
#'
#' @examples
#' \dontrun{
#' read_wb("wb_pop_urban_2023-07-28.csv")
#' }
read_wb <- function(file_name, data_dir = Sys.getenv("DXGAP_DATADIR")) {
  dxgap_read_csv(file_name = file_name, data_dir = data_dir) |>
    tibble::as_tibble()
}

#' Tidy World Bank data sets
#'
#' @param data A tibble returned from the corresponding `read_()` function.
#' @param year A year to filter the data by. Defaults to `NULL`, returning data
#'   for all years.
#'
#' @return `tidy_wb()` a tibble. This is a tidied version of the input tibble.
#'
#' @seealso [import_tbl()]
#'
#' @rdname wb
#'
#' @export
#'
#' @examples
#' \dontrun{
#' read_wb("wb_pop_urban_2023-07-28.csv") |>
#'   tidy_wb()
#' }
tidy_wb <- function(data, year = NULL) {
  var_to <- get_wb_var_to(data, indicator_id)
  df <-
    data |>
    dplyr::transmute(
      year = date,
      country_code = countryiso3code,
      value
    ) |>
    dplyr::rename("{var_to}" := value) |>
    dplyr::filter(!is.na(country_code))
  if (!is.null(year)) {
    df_subset <-
      df |>
      dplyr::filter(year == !!year)
    return(df_subset)
  }

  check_any_na(df, country_code)
  check_any_na(df, year)

  df
}

get_wb_var_to <- function(data, .indicator_var, .indicator_df = wb_indicator_df) {
  rlang::check_required(.indicator_var)
  stopifnot(is.data.frame(.indicator_df))
  id <- get_distinct(data, !!rlang::enquo(.indicator_var))
  var_to <-
    .indicator_df |>
    dplyr::filter(indicator == id) |>
    dplyr::pull(var_to)
  stopifnot(length(var_to) == 1)
  return(var_to)
}

wb_indicator_df <-
  tibble::tribble(
             ~indicator,          ~var_to,
    "SP.URB.TOTL.IN.ZS", "pop_urban_perc",
          "EN.POP.DNST",    "pop_density",
          "SP.POP.TOTL",      "pop_total",
       "NY.GDP.MKTP.CD",            "gdp"
  )
