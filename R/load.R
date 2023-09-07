findtb_load <- function(.year = 2019, data_dir = Sys.getenv("FINDTB_DATADIR")) {

  data_files <-
    list.files(here::here("inst/extdata"), pattern = "csv") |>
    stringr::str_subset("masterlist", negate = TRUE)

  lst <- findtb_import_bulk(lst, data_files, year = .year)

  # HBC countries --------------------------------------------------------------

  hbc_df <-
    lst$who_hbc |>
    dplyr::select(country_code) |>
    dplyr::mutate(country = countrycode::countrycode(
      country_code,
      origin = "iso3c",
      dest = "country.name"
    ))

  hbc_lst <- purrr::map(
    lst,
    ~ dplyr::semi_join(.x, hbc_df, by = dplyr::join_by(country_code))
  )

  # World Bank Population ------------------------------------------------------

  wb_tot_pop_df <-
    hbc_lst$wb_pop_total |>
    dplyr::select(country_code, year, pop_total = value)

  # World Bank Urban Pop. ------------------------------------------------------

  wb_urb_pop_df <-
    hbc_lst$wb_pop_urban |>
    dplyr::select(country_code, year, pop_urban_perc = value)

  # World Bank Density ---------------------------------------------------------

  wb_density_pop_df <-
    hbc_lst$wb_pop_density |>
    dplyr::select(country_code, year, pop_density = value)

  # World Bank GDP ------------------------------------------------------------

  wb_gdp_df <-
    hbc_lst$wb_gdp |>
    dplyr::select(country_code, year, gdp = value)

  # WHO notifications ----------------------------------------------------------

  who_notifications_df <- hbc_lst$who_notifications

  # WHO estimates --------------------------------------------------------------

  who_estimates_df <- hbc_lst$who_estimates

  # WHO budget -----------------------------------------------------------------

  who_budget_df <- hbc_lst$who_budget

  # WHO community --------------------------------------------------------------

  who_community_df <- hbc_lst$who_community

  # WHO Sites ------------------------------------------------------------------

  who_sites_df <- hbc_lst$who_laboratories

  # Global Fund Procurement ----------------------------------------------------

  gf_procurement_df <-
    hbc_lst$gf_procurement |>
    dplyr::group_by(country_code) |>
    dplyr::summarise(total_numb_device = sum(total_numb_device, na.rm = TRUE)) |>
    dplyr::ungroup()

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
    gf_procurement = gf_procurement_df
  )
}
