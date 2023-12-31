#' Import tables in bulk
#' @noRd
#' @examples \dontrun{
#' tbl_lst <- import_tbls(
#'   c("gf_procurement_2023-07-26.csv", "wb_pop_urban_2023-07-28.csv")
#' )
#' }
import_tbls <- function(data_names) {
  stopifnot(is.character(data_names) && length(data_names) >= 1)
  names(data_names) <- extract_name(data_names)
  lst_df <- purrr::map(data_names, ~ import_tbl_impl(.file_name = .x))
  lst_df
}

#' Read and tidy any individual table
#'
#' @param file_name A string containing the name of the file to be read.
#'
#' @export
#' @examples \dontrun{
#' tbl <- import_tbl("gf_procurement_2023-07-26.csv")
#' tbl <- import_tbl("wb_pop_urban_2023-07-28.csv")
#' tbl <- import_tbl("wb_pop_total_2023-08-31.csv")
#' tbl <- import_tbl("wb_gdp_2023-09-07.csv")
#' tbl <- import_tbl("wb_pop_density_2023-10-04.csv")
#' tbl <- import_tbl("who_budget_2023-07-28.csv")
#' tbl <- import_tbl("who_community_2023-07-28.csv")
#' tbl <- import_tbl("who_estimates_2023-07-28.csv")
#' tbl <- import_tbl("who_expenditures_2023-07-28.csv")
#' tbl <- import_tbl("who_hbc_2023-07-28.csv")
#' tbl <- import_tbl("who_laboratories_2023-08-30.csv")
#' tbl <- import_tbl("who_notifications_2023-11-28.csv")
#' }
import_tbl <- function(file_name) {
  import_tbl_impl(.file_name = file_name)
}

import_tbl_impl <- function(.file_name, .data_dir = Sys.getenv("DXGAP_DATADIR")) {

  # Extract file name ----------------------------------------------------------
  data_name <- extract_name(.file_name)

  data_summary <-
    data_summary |>
    dplyr::mutate(data_name = stringr::str_c(provider, dataset, sep = "_")) |>
    dplyr::filter(data_name == !!data_name)

  provider <-
    data_summary |>
    dplyr::pull(provider)

  dataset <-
    data_summary |>
    dplyr::pull(dataset)

  # Read -----------------------------------------------------------------------

  path_file <- compose_file_path(file_name = .file_name, data_dir = .data_dir)

  read_raw <- switch(
    data_name,
    who_budget = read_who,
    who_community = read_who,
    who_estimates = read_who,
    who_expenditures = read_who,
    who_laboratories = read_who,
    who_notifications = read_who,
    who_hbc = read_who,
    gf_procurement = read_gf_procurement,
    wb_pop_total = read_wb,
    wb_pop_density = read_wb,
    wb_pop_urban = read_wb,
    wb_gdp = read_wb
  )

  data_raw <- read_raw(path_file)

  # Tidy -----------------------------------------------------------------------

  tidy_data <- switch(
    data_name,
    who_budget = tidy_who,
    who_community = tidy_who,
    who_estimates = tidy_who,
    who_expenditures = tidy_who,
    who_laboratories = tidy_who,
    who_notifications = tidy_who,
    who_hbc = tidy_who,
    gf_procurement = tidy_gf_procurement,
    wb_pop_total = tidy_wb,
    wb_pop_density = tidy_wb,
    wb_pop_urban = tidy_wb,
    wb_gdp = tidy_wb
  )

  if (provider %in% c("who") && dataset != "hbc") {
    data_tidy <- tidy_data(data_raw, .shape = "wide")
  } else {
    data_tidy <- tidy_data(data_raw)
  }

  data_tidy
}
