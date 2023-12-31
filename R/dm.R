#' Load all data for a disease into a single wide table
#'
#' `build_tbl()` loads all files for a given disease into a single dataframe. It
#' does this by flattening all of the tables into a single wide table by
#' performing a series of cascading joins on matching keys.
#'
#' @param disease A character of length one identifying the disease for which
#'   the user wants to build a wide table. The tibble `dxgap_diseases` shows the
#'   diseases that are currently supported.
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
#' build_tbl("tb", 2019, c("year", "country", "pop_density"))
#' }
build_tbl <- function(disease, year = NULL, vars = NULL) {
  df_lst <- load_dx_impl(disease)
  dm <- build_dm(df_lst, year = year)
  build_tbl_impl(dm, vars)
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
#' dm_object <- load_dx("tb") |>
#'   build_dm()
#'
#' build_tbl_impl(dm_object) # All cols
#' build_tbl_impl(dm_object, vars = c("year", "country", "pop_density")) # select cols
#' }
build_tbl_impl <- function(dm, vars = NULL) {
  tbl <-
    dm |>
    dm::dm_flatten_to_tbl(.start = country) |>
    dplyr::filter(!dplyr::if_all(-c(country_code), is.na))

  tbl <- tbl |>
    dplyr::relocate(is_hbc, country_code, year, .before = everything())

  if (!is.null(vars)) {
    tbl <-
      tbl |>
      dplyr::select(tidyselect::any_of(vars))
  }

  return(tbl)
}

#' Build a dm model object
#'
#' `build_dm()` converts a list of tables into a dm object, extending the list
#' to include information on the relationship between the tables.
#'
#' @param data_list A list of tables, typically generated from [load_dx()].
#' @param year An integer indicating a year to filter the data on. Defaults to
#'   NULL, returning all years present in the data.
#'
#' @seealso [build_tbl()]
#'
#' @return An object of class dm, containing the same number of tables as in the
#' input `data_list`.
#'
#' @noRd
#'
#' @examples
#' \dontrun{
#' build_dm(load_dx("tb")) # all years
#' build_dm(load_dx("tb"), year = 2019) # only 2019
#' }
build_dm <- function(data_list, year = NULL) {
  # TODO: max year should be taken from dxgap_diseases
  max_year <- 2021
  if (!is.null(year) && year > max_year) {
    rlang::abort(sprintf("Data available up to %s.", max_year))
  }
  core_data <- get_core(data_list)
  core_list <- core_data$core_list
  can_compute_dxgap <- core_data$can_compute_dxgap

  hbc_df <-
    data_list$who_hbc |>
    dplyr::select(country_code, year) |>
    forget_year_hbc() |>
    dplyr::mutate(is_hbc = 1)

  non_hbc_df <-
    get_non_hbc_country_code(hbc_df) |>
    dplyr::semi_join(can_compute_dxgap, dplyr::join_by(country_code)) |>
    dplyr::mutate(is_hbc = 0)

  # estimates and notifications are available up to given year
  country_df <-
    hbc_df |>
    dplyr::bind_rows(non_hbc_df) |>
    dplyr::filter(year <= max_year)

  core_list$who_hbc <- NULL
  core_list$country <- country_df

  dm_no_rel <- dm::dm(!!!core_list)
  dm_col <- set_dm_colors(dm_no_rel)
  dm_ts <- set_dm_rels(dm_col)

  if (is.null(year)) {
    return(dm_ts)
  }

  dm::dm_filter(dm_ts, country = (year == !!year))

}

forget_year_hbc <- function(hbc_data) {
  hbc_data |>
    dplyr::select(-year) |>
    tidyr::crossing(year = 2016:2021) # TODO: use start_year and end_year in dxgap_diseases
}

get_non_hbc_country_code <- function(hbc_df) {
  countrycode::codelist |>
    dplyr::select(country_code = iso3c) |>
    dplyr::filter(!is.na(country_code)) |>
    dplyr::anti_join(hbc_df, by = dplyr::join_by(country_code)) |>
    dplyr::anti_join(country_exclude_df, by = dplyr::join_by(country_code)) |>
    tidyr::crossing(year = 2016:2099) # start from the min year available in hbc list
}

set_dm_rels <- function(dm) {
  dm |>
    set_dm_pk_parent() |>
    set_dm_pk() |>
    set_dm_fk()
}

set_dm_pk <- function(dm) {
  dm |>
    dm::dm_add_pk(wb_pop_total, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(wb_pop_urban, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(wb_pop_density, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(wb_gdp, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_notifications, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_estimates, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_budget, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_community, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_laboratories, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_expenditures, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(gf_procurement, c(year, country_code), check = TRUE)
}

set_dm_fk <- function(dm, parent_tbl) {
  dm |>
    dm::dm_add_fk(country, c(year, country_code), wb_pop_total) |>
    dm::dm_add_fk(country, c(year, country_code), wb_pop_urban) |>
    dm::dm_add_fk(country, c(year, country_code), wb_pop_density) |>
    dm::dm_add_fk(country, c(year, country_code), wb_gdp) |>
    dm::dm_add_fk(country, c(year, country_code), who_notifications) |>
    dm::dm_add_fk(country, c(year, country_code), who_estimates) |>
    dm::dm_add_fk(country, c(year, country_code), who_budget) |>
    dm::dm_add_fk(country, c(year, country_code), who_community) |>
    dm::dm_add_fk(country, c(year, country_code), who_laboratories) |>
    dm::dm_add_fk(country, c(year, country_code), who_expenditures) |>
    dm::dm_add_fk(country, c(year, country_code), gf_procurement)
}

set_dm_pk_parent <- function(dm) {
  dm |>
    dm::dm_add_pk(country, c(year, country_code), check = TRUE)
}

set_dm_colors <- function(dm) {
  dm |>
    dm::dm_set_colors(
      "#5986C4" = starts_with("who"),
      "#70AD47FF" = starts_with("wb"),
      "#ED7D31FF" = contains("country")
    )
}
