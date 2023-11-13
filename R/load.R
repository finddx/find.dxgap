list_dx <- function(pattern = "csv", data_dir = Sys.getenv("DXGAP_DATADIR")) {
  list.files(data_dir, pattern = pattern) |>
    stringr::str_subset("masterlist", negate = TRUE)
}

#' Load diagnostic gap data
#'
#' `load_dx()` loads a list of data frames created by
#' [write_data_dir()]
#'
#' @param data_files
#'
#' @return
#' @export
#'
#' @examples
load_dx <- function(data_files = list_dx()) {

  lst_df <- import_bulk(lst_df, data_name = data_files)

  # HBC countries --------------------------------------------------------------

  hbc_df <-
    lst_df$who_hbc |>
    dplyr::select(country_code, year) |>
    dplyr::mutate(country = countrycode::countrycode(
      country_code,
      origin = "iso3c",
      dest = "country.name"
    ))

  # World Bank Population ------------------------------------------------------

  wb_tot_pop_df <-
    lst_df$wb_pop_total |>
    dplyr::select(country_code, year, pop_total = value)

  # World Bank Urban Pop. ------------------------------------------------------

  wb_urb_pop_df <-
    lst_df$wb_pop_urban |>
    dplyr::select(country_code, year, pop_urban_perc = value)

  # World Bank Density ---------------------------------------------------------

  wb_density_pop_df <-
    lst_df$wb_pop_density |>
    dplyr::select(country_code, year, pop_density = value)

  # World Bank GDP ------------------------------------------------------------

  wb_gdp_df <-
    lst_df$wb_gdp |>
    dplyr::select(country_code, year, gdp = value)

  # WHO notifications ----------------------------------------------------------

  who_notifications_df <- lst_df$who_notifications

  # WHO estimates --------------------------------------------------------------

  who_estimates_df <- lst_df$who_estimates

  # WHO budget -----------------------------------------------------------------

  who_budget_df <- lst_df$who_budget

  # WHO community --------------------------------------------------------------

  who_community_df <- lst_df$who_community

  # WHO Sites ------------------------------------------------------------------

  who_sites_df <- lst_df$who_laboratories

  # WHO Expenditures -----------------------------------------------------------

  who_expenditures_df <- lst_df$who_expenditures

  # Global Fund Procurement ----------------------------------------------------

  gf_procurement_df_ungrouped <- lst_df$gf_procurement
  gf_procurement_df <- compute_gf_tot_devices(gf_procurement_df_ungrouped)

  tibble::lst(
    hbc = hbc_df,
    wb_tot_pop = wb_tot_pop_df,
    wb_urb_pop = wb_urb_pop_df,
    wb_density_pop = wb_density_pop_df,
    wb_gdp = wb_gdp_df,
    who_notifications = who_notifications_df,
    who_estimates = who_estimates_df,
    who_budget = who_budget_df,
    who_community = who_community_df,
    who_sites = who_sites_df,
    who_expenditures = who_expenditures_df,
    gf_procurement = gf_procurement_df
  )
}
