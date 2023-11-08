download_who <- function(file_name = tempfile(compose_file_name("who", download_date, url_endpoint), fileext = ".csv"),
                         url_endpoint = "notification",
                         download_date = as.character(Sys.Date()),
                         data_dir = Sys.getenv("DXGAP_DATADIR")) {
  url_endpoint <- rlang::arg_match(url_endpoint, who_url_endpoints$url_endpoint)
  url <-  "https://extranet.who.int/tme/generateCSV.asp?ds="
  url_topic <- paste0(url, url_endpoint)
  file_path <- compose_file_path(file_name, data_dir)

  data <- readr::read_csv(url_topic, show_col_types = FALSE)
  subset_cols <-
    dxgap_master_list |>
    dplyr::filter(data_source == "who") |>
    dplyr::filter(url_endpoint == !!url_endpoint) |>
    dplyr::pull(variable_name)
  relevant_cols <- c("country", "iso3", "g_whoregion", "year", subset_cols)
  data_subset <-
    data |>
    dplyr::select(tidyselect::all_of(relevant_cols)) |>
    dplyr::mutate(download_date = download_date)

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

read_who <- function(...) {
  dxgap_read_csv(..., col_types = readr::cols("download_date" = "c")) |>
    tibble::as_tibble()
}

tidy_who <- function(data, year = NULL, .shape = "long") {
  is_notifications <- is_ptype(data, ptype_who_notifications)
  is_community <- is_ptype(data, ptype_who_community)
  is_budget <- is_ptype(data, ptype_who_budget)
  is_estimates <- is_ptype(data, ptype_who_estimates)
  is_expenditure <- is_ptype(data, ptype_who_expenditures)
  is_labs <- is_ptype(data, ptype_who_labs)

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
  } else {
    rlang::abort(
      c("Cannot find a footprint for this data.", i = "Is this a new dataset?")
    )
  }
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

# TODO: understandable renaming
tidy_who_notifications <- function(data, .year = NULL, shape = "long") {
  shape <- rlang::arg_match(shape, values = c("long", "wide"))
  tidy_who_core(data, year = .year, shape = shape)
}

tidy_who_budget <- function(data, .year = NULL, shape = "long") {
  shape <- rlang::arg_match(shape, values = c("long", "wide"))
  tidy_who_core(data, year = .year, shape = shape)
}

tidy_who_community <- function(data, .year = NULL, shape = "long") {
  shape <- rlang::arg_match(shape, values = c("long", "wide"))
  tidy_who_core(data, year = .year, shape = shape)
}

tidy_who_estimates <- function(data, .year = NULL, shape = "long") {
  shape <- rlang::arg_match(shape, values = c("long", "wide"))
  tidy_who_core(data, year = .year, shape = shape)
}

tidy_who_expenditures <- function(data, .year = NULL, shape = "long") {
  shape <- rlang::arg_match(shape, values = c("long", "wide"))
  tidy_who_core(data, year = .year, shape = shape)
}

tidy_who_labs <- function(data, .year = NULL, shape = "long") {
  shape <- rlang::arg_match(shape, values = c("long", "wide"))
  tidy_who_core(data, year = .year, shape = shape)
}
