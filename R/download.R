download_hbc <- function(file_name = tempfile("who_hbc_list", fileext = ".pdf"),
                         url = "https://cdn.who.int/media/docs/default-source/hq-tuberculosis/who_globalhbcliststb_2021-2025_backgrounddocument.pdf?sfvrsn=f6b854c2_9",
                         data_dir = Sys.getenv("FINDTB_DATADIR")) {
  file_path <- if (fs::is_absolute_path(file_name)) {
    file_name
  } else {
    file.path(data_dir, file_name)
  }
  download.file(url, file_path)
  invisible(normalizePath(file_path))
}


download_who <- function(file_name = tempfile(compose_file_name("who", download_date, dataset), fileext = ".csv"),
                         dataset = "notification",
                         download_date = as.character(Sys.Date()),
                         data_dir = Sys.getenv("FINDTB_DATADIR")) {
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
    findtb_master_list |>
    dplyr::filter(data_source == "who") |>
    dplyr::filter(dataset == !!dataset) |>
    dplyr::pull(variable_name)
  relevant_cols <- c("country", "year", subset_cols)
  data_subset <-
    data |>
    dplyr::select(tidyselect::all_of(relevant_cols)) |>
    dplyr::mutate(download_date = download_date)

  readr::write_csv(data_subset, file_path)
  invisible(normalizePath(file_path))
}

# https://datahelpdesk.worldbank.org/knowledgebase/articles/898581
download_wb <- function(file_name = tempfile(compose_file_name("wb", download_date, indicator), fileext = ".csv"),
                        indicator = "SP.URB.TOTL.IN.ZS", # TODO: use me
                        range_years = "2020:2023",
                        download_date = as.character(Sys.Date()),
                        data_dir = Sys.getenv("FINDTB_DATADIR")) {
  base_url <- "https://api.worldbank.org/v2/country/all/indicator"
  req <-
    httr2::request(base_url) |>
    httr2::req_url_path_append(indicator) |>
    httr2::req_url_query(format = "json", date = range_years)

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
    unnest_wb_resp(nested_out) |>
    dplyr::mutate(download_date = download_date)

  file_path <- compose_file_path(file_name, data_dir)
  readr::write_csv(out, file_path)
  invisible(normalizePath(file_path))
}

unnest_wb_resp <- function(data) {
  data |>
    tidyr::unnest_wider(data, names_sep = "_") |>
    select(page, data_2) |>
    tidyr::unnest_longer(data_2) |>
    tidyr::unnest_wider(data_2) |>
    tidyr::unnest_wider(country, names_sep = "_") |>
    tidyr::unnest_wider(indicator, names_sep = "_")
}

req_perform_lazy <- function(req) {
  stopifnot(inherits(req, "httr2_request"))
  Sys.sleep(3)
  httr2::req_perform(req = req)
}




