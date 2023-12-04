#' Data from WHO
#'
#' These help pages document the lower-level API to individually download, read,
#' and tidy data. For a higher-level API that works across all data sets,
#' see:
#' * [import_tbl()] to download all data
#'
#' The data sets currently available from WHO in this package are:
#' * notifications
#' * estimates
#' * budget
#' * community
#' * expenditures
#' * laboratories
#' * hbc
#'
#' @name who
NULL

#' Download data sets from the WHO
#'
#' @param file_name A path to the file. By default, the file is downloaded into
#'   a temporary location (useful when running unit tests). Instead, a custom
#'   target directory can be set using an absolute path, for instance,
#'   "~/path_to/my_file.ext". In both cases the path specified in `data_dir`
#'   does not play a role. Alternatively, if a relative path is provided,
#'   function downloads the data into the the default folder "find.dxgap.data".
#'   Please, make sure the environment variable "DXGAP_DATADIR" is set in your
#'   .Renviron.
#' @param url_endpoint A string indicating the name of the data set to be
#'   downloaded. One of the following:
#'   * budget
#'   * community
#'   * estimates
#'   * expenditure_utilisation
#'   * labs
#'   * notifications
#'
#' @return `download_who()` returns invisibly the file path in which data are
#'   stored.
#'
#' @rdname who
#'
#' @export
#'
#' @examples
#' \dontrun{
#' notification <- download_who(
#'   file_name = paste_dataset_name_date("who", dataset = "notifications", file_ext = ".csv"),
#'   url_endpoint = "notifications"
#' )
#' estimates <- download_who(
#'   file_name = paste_dataset_name_date("who", dataset = "estimates", file_ext = ".csv"),
#'   url_endpoint = "estimates"
#' )
#' budget <- download_who(
#'   file_name = paste_dataset_name_date("who", dataset = "budget", file_ext = ".csv"),
#'   url_endpoint = "budget"
#' )
#' community_engagement <- download_who(
#'   file_name = paste_dataset_name_date("who", dataset = "community", file_ext = ".csv"),
#'   url_endpoint = "community"
#' )
#' expenditure_and_utilisation <- download_who(
#'   file_name = paste_dataset_name_date("who", dataset = "expenditures", file_ext = ".csv"),
#'   url_endpoint = "expenditure_utilisation"
#' )
#' laboratories <- download_who(
#'   file_name = paste_dataset_name_date("who", dataset = "laboratories", file_ext = ".csv"),
#'   url_endpoint = "labs"
#' )
#' }
download_who <- function(file_name, url_endpoint) {
  download_who_impl(
    .file_name = file_name,
    .url_endpoint = url_endpoint
  )
}

download_who_impl <- function(.file_name = tempfile(compose_file_name("who", .download_date, url_endpoint), fileext = ".csv"),
                              .url_endpoint = "notification",
                              .url = "https://extranet.who.int/tme/generateCSV.asp?ds=",
                              .download_date = as.character(Sys.Date()),
                              .data_dir = Sys.getenv("DXGAP_DATADIR"),
                              .dxgap_master_list = dxgap_master_list,
                              .who_url_endpoints = who_url_endpoints) {
  url_endpoint <- rlang::arg_match(.url_endpoint, .who_url_endpoints$url_endpoint)
  url_topic <- paste0(.url, url_endpoint)
  file_path <- compose_file_path(.file_name, .data_dir)

  data <- readr::read_csv(url_topic, show_col_types = FALSE)
  subset_cols <-
    .dxgap_master_list |>
    dplyr::filter(data_source == "who") |>
    dplyr::filter(url_endpoint == !!url_endpoint) |>
    dplyr::pull(variable_name)
  relevant_cols <- c("country", "iso3", "g_whoregion", "year", subset_cols)
  data_subset <-
    data |>
    dplyr::select(tidyselect::all_of(relevant_cols)) |>
    dplyr::mutate(download_date = .download_date)

  readr::write_csv(data_subset, file_path)
  invisible(normalizePath(file_path))
}

who_url_endpoints <- tibble::tribble(
  ~dataset,                   ~url_endpoint,
  "budget",                       "budget",
  "community_engagement",         "community",
  "estimates",                    "estimates",
  "expenditure_and_utilisation",  "expenditure_utilisation",
  "laboratories",                 "labs",
  "notification",                 "notifications"
)

#' Read WHO data sets
#'
#' @param file_name A string containing the name of the file to be read.
#' @param data_dir Path containing the directory to read the data from. Defaults
#' to the path set by the environment variable `"DXGAP_DATADIR"`.
#'
#' @return `read_who()` returns a tibble containing the data set.
#'
#' @rdname who
#'
#' @noRd
#'
#' @examples
#' \dontrun{
#' read_who("who_laboratories_2023-08-30.csv")
#' read_who("who_hbc_2023-07-28.csv")
#' }
read_who <- function(file_name, data_dir = Sys.getenv("DXGAP_DATADIR")) {
  is_who_hbc <- stringr::str_detect(file_name, "hbc")
  if (is_who_hbc) {
    who_hbc_df <- read_who_hbc(file_name, data_dir = data_dir)
    return(who_hbc_df)
  }
  dxgap_read_csv(file_name, col_types = readr::cols("download_date" = "c")) |>
    tibble::as_tibble()
}

#' Tidy WHO data sets
#'
#' @param data A tibble returned from the corresponding `read_()` function.
#' @param year A year to filter the data by. Defaults to `NULL`, returning data
#'   for all years.
#' @param .shape A string indicating if the data should be in "wide", or "long"
#'   format. Defaults to "long".
#'
#' @return `tidy_who()` returns s tibble. This is a tidied version of the input
#'   tibble.
#'
#' @rdname who
#'
#' @noRd
#'
#' @examples
#' \dontrun{
#' read_who("who_laboratories_2023-08-30.csv") |>
#'   tidy_who()
#' }
tidy_who <- function(data, year = NULL, .shape = "long") {
  is_notifications <- is_ptype(data, ptype_who_notifications)
  is_community <- is_ptype(data, ptype_who_community)
  is_budget <- is_ptype(data, ptype_who_budget)
  is_estimates <- is_ptype(data, ptype_who_estimates)
  is_expenditure <- is_ptype(data, ptype_who_expenditures)
  is_labs <- is_ptype(data, ptype_who_labs)
  is_hbc <- is_ptype(data, ptype_who_hbc)
  check_unique_ptype(
    c(
      is_notifications,
      is_community,
      is_budget,
      is_estimates,
      is_expenditure,
      is_labs,
      is_hbc
    )
  )

  if (is_notifications) {
    tidy_who_notifications(data, .year = year, shape = .shape)
  } else if (is_budget) {
    tidy_who_budget(data, .year = year, shape = .shape)
  } else if (is_community) {
    tidy_who_community(data, .year = year, shape = .shape)
  } else if (is_estimates) {
    tidy_who_estimates(data, .year = year, shape = .shape)
  } else if (is_expenditure) {
    tidy_who_expenditures(data, .year = year, shape = .shape)
  } else if (is_labs) {
    tidy_who_labs(data, .year = year, shape = .shape)
  } else if (is_hbc) {
    tidy_who_hbc(data, .year = year)
  } else {
    rlang::abort(
      c("Cannot find a footprint for this data.", i = "Is this a new dataset?")
    )
  }
}

# TODO: understandable renaming
tidy_who_notifications <- function(data, .year = NULL, shape = "long") {
  tidy_who_impl(data = data, .year = .year, shape = shape)
}

tidy_who_budget <- function(data, .year = NULL, shape = "long") {
  tidy_who_impl(data = data, .year = .year, shape = shape)
}

tidy_who_community <- function(data, .year = NULL, shape = "long") {
  tidy_who_impl(data = data, .year = .year, shape = shape)
}

tidy_who_estimates <- function(data, .year = NULL, shape = "long") {
  tidy_who_impl(data = data, .year = .year, shape = shape)
}

tidy_who_expenditures <- function(data, .year = NULL, shape = "long") {
  tidy_who_impl(data = data, .year = .year, shape = shape)
}

tidy_who_labs <- function(data, .year = NULL, shape = "long") {
  tidy_who_impl(data = data, .year = .year, shape = shape)
}

tidy_who_impl <- function(data, .year = NULL, shape = "long") {
  shape <- rlang::arg_match(shape, values = c("long", "wide"))
  tidy_who_core(data, year = .year, shape = shape)
}

tidy_who_core <- function(data, year, shape) {
  data |>
    tidy_who_rename() |>
    tidy_who_year(.year = year) |>
    tidy_who_shape(.shape = shape)
}

tidy_who_rename <- function(data) {
  data |>
    dplyr::select(-download_date) |>
    dplyr::rename(country_code = iso3)
}

tidy_who_year <- function(data, .year) {
  if (!is.null(.year)) {
    df <-
      data |>
      dplyr::filter(year == !!.year)
    return(df)
  }
  data
}

tidy_who_shape <- function(data, .shape) {
  if (.shape == "long") {
    df <-
      data |>
      tidyr::pivot_longer(
        cols = -c(country, country_code, g_whoregion, year),
        names_to = "variable"
    )
    return(df)
  }
  data
}
