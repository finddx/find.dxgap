download_who <- function(file_name = tempfile(compose_file_name("who", download_date, dataset), fileext = ".csv"),
                         dataset = "notification",
                         download_date = as.character(Sys.Date()),
                         data_dir = Sys.getenv("DXGAP_DATADIR")) {
  dataset <- rlang::arg_match(dataset, who_url_endpoints$dataset)
  url <-  "https://extranet.who.int/tme/generateCSV.asp?ds="
  endpoint <-
    who_url_endpoints |>
    dplyr::filter(dataset == !!dataset) |>
    dplyr::pull(url_endpoint)
  url_topic <- paste0(url, endpoint)
  file_path <- compose_file_path(file_name, data_dir)

  data <- readr::read_csv(url_topic, show_col_types = FALSE)
  subset_cols <-
    dxgap_master_list |>
    dplyr::filter(data_source == "who") |>
    dplyr::filter(dataset == !!dataset) |>
    dplyr::pull(variable_name)
  relevant_cols <- c("country", "iso3", "g_whoregion", "year", subset_cols)
  data_subset <-
    data |>
    dplyr::select(tidyselect::all_of(relevant_cols)) |>
    dplyr::mutate(download_date = download_date)

  readr::write_csv(data_subset, file_path)
  invisible(normalizePath(file_path))
}

read_who <- function(...) {
  dxgap_read_csv(..., col_types = readr::cols("download_date" = "c")) |>
    tibble::as_tibble()
}

tidy_who <- function(data, year = NULL, .shape = "long") {
  cond_notifications <- is_ptype(data, ptype_who_notifications)
  cond_community <- is_ptype(data, ptype_who_community)
  cond_budget <- is_ptype(data, ptype_who_budget)
  cond_estimates <- is_ptype(data, ptype_who_estimates)
  cond_expenditure <- is_ptype(data, ptype_who_expenditures)
  cond_labs <- is_ptype(data, ptype_who_labs)

  if (cond_notifications) {
    tidy_who_notifications(data, .year = year, shape = .shape)
  } else if (cond_budget) {
    tidy_who_budget(data, .year = year, shape = .shape)
  } else if (cond_community) {
    tidy_who_community(data, .year = year, shape = .shape)
  } else if (cond_estimates) {
    tidy_who_estimates(data, .year = year, shape = .shape)
  } else if (cond_expenditure) {
    tidy_who_expenditures(data, .year = year, shape = .shape)
  } else if (cond_labs) {
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
