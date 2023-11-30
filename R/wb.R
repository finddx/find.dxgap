#' Data from World Bank
#'
#' These help pages document the lower-level API to individually download, read,
#' and tidy data. For a higher-level API that works across all data sets,
#' see:
#' * [write_data_dir()] to download all data
#' * [load_dx()] to load all data
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
#'   file_name = compose_date_dataset_file_name("wb", dataset = "pop_urban", file_ext = ".csv"),
#'   indicator = "SP.URB.TOTL.IN.ZS",
#'   range_years = "2015:2023"
#' )
#' pop_density <-
#'   download_wb(
#'     file_name = compose_date_dataset_file_name("wb", dataset = "pop_density", file_ext = ".csv"),
#'     indicator = "EN.POP.DNST",
#'     range_years = "2015:2023"
#'   )
#' pop_total <- download_wb(
#'   file_name = compose_date_dataset_file_name("wb", dataset = "pop_total", file_ext = ".csv"),
#'   indicator = "SP.POP.TOTL",
#'   range_years = "2015:2023"
#' )
#' gdp <- download_wb(
#'   file_name = compose_date_dataset_file_name("wb", dataset = "gdp", file_ext = ".csv"),
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
#' @rdname wb
#'
#' @export
#'
#' @examples
#' \dontrun{
#' read_wb("wb_2023-07-28_pop_urban.csv")
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
#' @rdname wb
#'
#' @export
#'
#' @examples
#' \dontrun{
#' read_wb("wb_2023-07-28_pop_urban.csv") |>
#'   tidy_wb()
#' }
tidy_wb <- function(data, year = NULL) {
  df <-
    data |>
    dplyr::transmute(
      indicator_value,
      country_code = countryiso3code,
      country_value,
      year = date,
      value
    ) |>
    dplyr::filter(!is.na(country_code))
  if (!is.null(year)) {
    df_subset <-
      df |>
      dplyr::filter(year == !!year)
    return(df_subset)
  }
  df
}
