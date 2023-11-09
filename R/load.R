list_dxgap_datadir <- function(.pattern, .data_dir = Sys.getenv("DXGAP_DATADIR")) {
  list.files(path = .data_dir, pattern = .pattern)
}

load_dx <- function(disease, data_dir = Sys.getenv("DXGAP_DATADIR")) {
  check_supported_disease(disease)
  disease_df <-
    dxgap_diseases |>
    dplyr::filter(disease == !!disease) |>
    tidyr::unnest(tables) |>
    dplyr::mutate(date_pattern = "\\d{4}-\\d{2}-\\d{2}") |>
    dplyr::mutate(
      pattern = stringr::str_c(provider_id, date_pattern, dataset_type, sep = "_")
    )
  regex_pattern <- paste(disease_df$pattern, collapse = "|")
  data_dir_list <- list_dxgap_datadir(.data_dir = data_dir, .pattern = regex_pattern)
  lst_df <- import_bulk(lst_df, data_name = data_dir_list)

  tbl_list <- switch(disease,
    tb = tb_load(lst_df)
  )

  tbl_list
}

generate_disease_pattern <- function(dxgap_diseases, disease) {
  dxgap_diseases |>
    dplyr::filter(disease == !!disease) |>
    tidyr::unnest(tables) |>
    dplyr::mutate(date_pattern = "\\d{4}-\\d{2}-\\d{2}") |>
    dplyr::mutate(
      pattern = stringr::str_c(
        provider_id,
        date_pattern,
        dataset_type,
        sep = "_"
      )
    )
}
