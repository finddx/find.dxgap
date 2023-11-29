list_dxgap_datadir <- function(.pattern, .data_dir = Sys.getenv("DXGAP_DATADIR")) {
  list.files(path = .data_dir, pattern = .pattern)
}

#' Load diagnostic gap data for given disease
#'
#' `load_dx()` loads all files for given disease into a
#' list of tibbles.
#'
#' @param disease A character of lenght one identifying the disease for which
#'   the user wants to build a wide table. The tibble `dxgap_diseases` shows the
#'   diseases that are currently supported.
#' @seealso [build_dm()]
#' @seealso [build_tbl()]
#'
#' @return A list of tibbles.
#'
#' @export
#'
#' @examples \dontrun{
#' load_dx("tb")
#' }
load_dx <- function(disease) {
  load_dx_impl(.disease = disease)
}

load_dx_impl <- function(.disease, .dxgap_diseases = dxgap_diseases, data_dir = Sys.getenv("DXGAP_DATADIR")) {
  check_supported_disease(.disease, .dxgap_diseases)
  pattern <- "\\d{4}-\\d{2}-\\d{2}"
  disease_df <- generate_disease_pattern(.dxgap_diseases, .disease, pattern)
  regex_pattern <- paste(disease_df$pattern, collapse = "|")
  # TODO: listing files is not optimal. It might be as long as the data dir is kept clean.
  data_files <- list_dxgap_datadir(.data_dir = data_dir, .pattern = regex_pattern)
  check_clean_data_dir(data_files, .pattern = pattern)
  lst_df <- import_bulk(lst_df, data_name = data_files)

  tbl_list <- switch(.disease,
    tb = tb_load(lst_df)
  )
  tbl_list
}

generate_disease_pattern <- function(dxgap_diseases, disease, pattern) {
  dxgap_diseases |>
    dplyr::filter(disease == !!disease) |>
    tidyr::unnest(tables) |>
    dplyr::mutate(date_pattern = pattern) |>
    dplyr::mutate(
      pattern = stringr::str_c(
        provider_id,
        date_pattern,
        dataset_type,
        sep = "_"
      )
    )
}
