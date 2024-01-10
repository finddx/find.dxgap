#' Load all data for a disease into a single wide table
#'
#' `build_tbl()` loads all files for a given disease into a single dataframe. It
#' does this by flattening all of the tables into a single wide table by
#' performing a series of cascading joins on matching keys.
#'
#' @param disease A character of length one identifying the disease for which
#'   the user wants to build a wide table. The tibble `dxgap_diseases` shows the
#'   diseases that are currently supported.
#' @param estimated Override the default `NULL` with a dot-separated character
#'   indicating which field from which table should be used as estimated cases
#'   for DX Gap computation. If kept to `NULL`, the function will use the value
#'   `estimates_table.estimates_field` from the `notified` column in the
#'   `dxgap_diseases` meta table.
#' @param notified Override the default `NULL` with a dot-separated character
#'   indicating which field from which table should be used as notified cases
#'   for DX Gap computation. If kept to `NULL`, the function will use the value
#'   `notifications_table.notifications_field` from the `notified` column in the
#'   `dxgap_diseases` meta table.
#' @param year An integer indicating a year to filter the data on. Defaults to
#'   NULL, returning all years present in the data.
#' @param vars A vector of strings naming columns to subset the data on.
#'  Defaults to NULL, indicating all variables should be used.
#'
#' @return A tibble.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' build_tbl(
#'   "tb",
#'   year = 2019,
#'   estimated = "who_estimates.e_inc_num",
#'   notified = "who_notifications.c_newinc",
#'   c("year", "country_code", "pop_density", "e_inc_num", "c_newinc")
#' )
#' build_tbl(
#'   "tb",
#'   year = 2019:2018,
#'   estimated = "who_estimates.e_inc_num",
#'   notified = "who_notifications.c_newinc",
#'   c("year", "country_code", "pop_density", "e_inc_num", "c_newinc")
#' )
#' }
build_tbl <- function(disease,
                      estimated = NULL,
                      notified = NULL,
                      year = NULL,
                      vars = NULL) {
  df_lst <- build_lst_impl(disease)

  dm <- build_dm(df_lst, year = year, estimated = estimated, notified = notified)

  # Here and not in `build_tbl_impl` since I don't have the disease there
  if (is.null(estimated)) {
    estimated <- extract_default_dxgap_tbl_field(
      disease = disease,
      dxgap_field = "estimated",
      output = "asis"
    )
  }

  if (is.null(notified)) {
    notified <- extract_default_dxgap_tbl_field(
      disease = disease,
      dxgap_field = "notified",
      output = "asis"
    )
  }

  build_tbl_impl(dm, vars, estimated = estimated, notified = notified)
}

#' Join all data into a big table
#'
#' `build_tbl_impl()` flattens all of the tables contained in a dm object
#' created by `build_dm()` into a single wide table by performing a series of
#' cascading joins.
#'
#' @param dm An object of class dm, created by `build_dm()`.
#' @param vars A vector of strings naming columns to subset the data on.
#'   Defaults to NULL, indicating all variables should be used.
#'
#'
#' @return A tibble.
#'
#' @noRd
#'
#' @examples
#' \dontrun{
#' dm_object <- build_lst("tb") |>
#'   build_dm(
#'     estimated = "who_estimates.e_inc_num",
#'     notified = "who_notifications.c_newinc"
#'   )
#'
#' build_tbl_impl(dm_object) # All cols
#' build_tbl_impl(dm_object, vars = c("year", "country_code", "pop_density")) # select cols
#' }
build_tbl_impl <- function(dm, estimated, notified, vars = NULL) {
  tbl <-
    dm |>
    dm::dm_flatten_to_tbl(.start = country) |>
    dplyr::filter(!dplyr::if_all(-c(country_code), is.na))

  estimated <- stringr::str_split_i(estimated, pattern = "\\.", i = 2)
  notified <- stringr::str_split_i(notified, pattern = "\\.", i = 2)
  tbl_dx_gap <- compute_dx_gap(
    tbl,
    estimated = !!rlang::sym(estimated),
    notified = !!rlang::sym(notified)
  )

  tbl <-
    tbl_dx_gap |>
    dplyr::relocate(is_hbc, country_code, year, .before = everything())

  if (!is.null(vars)) {
    vars_dx_gap <- c(vars, "dx_gap")
    tbl <-
      tbl |>
      dplyr::select(tidyselect::any_of(vars_dx_gap))
    return(relocate_dx_gap(tbl))
  }

  relocate_dx_gap(tbl)
}
