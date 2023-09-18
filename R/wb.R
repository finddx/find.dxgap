# https://datahelpdesk.worldbank.org/knowledgebase/articles/898581
download_wb <- function(file_name = tempfile(compose_file_name("wb", download_date, indicator), fileext = ".csv"),
                        indicator = "SP.URB.TOTL.IN.ZS",
                        range_years = "2015:2023",
                        download_date = as.character(Sys.Date()),
                        data_dir = Sys.getenv("DXGAP_DATADIR")) {
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
    nested_out |>
    dplyr::select(page, json) |>
    unnest_wb_resp() |>
    dplyr::mutate(download_date = download_date)

  file_path <- compose_file_path(file_name, data_dir)
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

read_wb <- function(...) {
  findtb_read_csv(...) |>
    tibble::as_tibble()
}

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
