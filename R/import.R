#' Import tables in bulk
#' @noRd
#' @examples \dontrun{
#' tbl_lst <- import_bulk(
#'   c("gf_2023-07-26_procurement.csv", "wb_2023-07-28_pop_urban.csv")
#' )
#' }
import_bulk <- function(data_name) {
  names(data_name) <- extract_name(data_name)
  lst_df <- purrr::map(data_name, ~ import_tbl(.file_name = .x))
  lst_df
}

#' Import table
#' @noRd
#' @examples \dontrun{
#' tbl <- import_tbl("who_2023-07-28_hbc.csv")
#' }
import_tbl <- function(.file_name, .data_dir = Sys.getenv("DXGAP_DATADIR")) {

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
    who_hbc = read_hbc,
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
    who_hbc = tidy_hbc,
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
