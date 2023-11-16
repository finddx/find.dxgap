read_masterlist <- function(file_name, data_dir = Sys.getenv("DXGAP_DATADIR")) {
  dxgap_read_csv(file_name = file_name, data_dir = data_dir)
}

tidy_masterlist <- function(data) {
  data |>
    dplyr::mutate(
      dataset = stringr::str_to_lower(dataset),
      dataset = stringr::str_replace_all(dataset, "\\s", "_"),
      data_source = stringr::str_to_lower(data_source),
      data_source = stringr::str_replace(data_source, "\\s|\\\\", "_"),
      variable_name = stringr::str_to_lower(variable_name),
      variable_name = stringr::str_remove_all(variable_name, "\\(|\\)"),
      variable_name = stringr::str_replace_all(variable_name, "\\s|\\/", "_"),
    ) |>
    dplyr::left_join(
      who_url_endpoints,
      dplyr::join_by(dataset)
    ) |>
    dplyr::mutate(url = dplyr::if_else(
      data_source == "who",
      stringr::str_c("https://extranet.who.int/tme/generateCSV.asp?ds=", url_endpoint),
      url
    )) |>
    dplyr::relocate(url_endpoint, .after = dataset)
}
