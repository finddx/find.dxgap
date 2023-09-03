findtb_load <- function(.year = 2019, data_dir = Sys.getenv("FINDTB_DATADIR")) {

  # HBC countries --------------------------------------------------------------

  hbc_df <-
    read_hbc(file.path(data_dir, "who_hbc.csv")) |>
    tidy_hbc(.year = .year) |>
    dplyr::filter(share_global_inc > 50) |> # restrict subset due to low complete_rate in some data
    dplyr::select(country_code) |>
    dplyr::mutate(country = countrycode::countrycode(
      country_code,
      origin = "iso3c",
      dest = "country.name"
    ))

  # World Bank Population ------------------------------------------------------

  wb_tot_pop_df <-
    read_wb(file.path(data_dir, "wb_2023-08-31_SP.POP.TOTL.csv")) |>
    tidy_wb(years = .year) |>
    dplyr::select(country_code, year, pop_total = value) |>
    dplyr::semi_join(hbc_df, by = dplyr::join_by(country_code))

  # World Bank Urban Pop. ------------------------------------------------------

  wb_urb_pop_df <-
    read_wb(file.path(data_dir, "wb_2023-07-28_SP.URB.TOTL.IN.ZS.csv")) |>
    tidy_wb(years = .year) |>
    dplyr::select(country_code, year, pop_urban_perc = value) |>
    dplyr::semi_join(hbc_df, by = dplyr::join_by(country_code))

  # World Bank Density ---------------------------------------------------------

  wb_density_pop_df <-
    read_wb(file.path(data_dir, "wb_2023-08-31_EN.POP.DNST.csv")) |>
    tidy_wb(years = .year) |>
    dplyr::select(country_code, year, pop_density = value) |>
    dplyr::semi_join(hbc_df, by = dplyr::join_by(country_code))

  # WHO notifications ----------------------------------------------------------

  who_notifications_df <-
    read_who(file.path(data_dir, "who_2023-07-28_notifications.csv")) |>
    tidy_who(years = .year, .shape = "wide") |>
    dplyr::semi_join(hbc_df, by = dplyr::join_by(country_code))

  # WHO estimates --------------------------------------------------------------

  who_estimates_df <-
    read_who(file.path(data_dir,"who_2023-07-28_estimates.csv")) |>
    tidy_who(years = .year, .shape = "wide") |>
    dplyr::semi_join(hbc_df, by = dplyr::join_by(country_code))

  # WHO budget -----------------------------------------------------------------

  who_budget_df <-
    read_who(file.path(data_dir, "who_2023-07-28_budget.csv")) |>
    tidy_who(years = .year, .shape = "wide") |>
    dplyr::semi_join(hbc_df, by = dplyr::join_by(country_code))

  # WHO community --------------------------------------------------------------

  who_community_df <-
    read_who(file.path(data_dir, "who_2023-07-28_community.csv")) |>
    tidy_who(years = .year, .shape = "wide") |>
    dplyr::semi_join(hbc_df, by = dplyr::join_by(country_code))

  # WHO Sites ------------------------------------------------------------------

  who_sites_df <-
    read_who(file.path(data_dir, "who_2023-08-30_laboratories.csv")) |>
    tidy_who(years = .year, .shape = "wide") |>
    dplyr::semi_join(hbc_df, by = dplyr::join_by(country_code))

  # Global Fund Procurement ----------------------------------------------------

  gf_procurement_df <-
    read_gf_procurement(file.path(data_dir, "gf_2023-07-26_procurement.csv")) |>
    tidy_gf_procurement(years = .year) |>
    dplyr::semi_join(hbc_df, by = dplyr::join_by(country_code)) |>
    dplyr::group_by(country_code) |>
    dplyr::summarise(total_numb_device = sum(total_numb_device, na.rm = TRUE)) |>
    dplyr::ungroup()

  tibble::lst(
    hbc = hbc_df,
    wb_tot_pop = wb_tot_pop_df,
    wb_urb_pop = wb_urb_pop_df,
    wb_density_pop = wb_density_pop_df,
    who_notifications = who_notifications_df,
    who_estimates = who_estimates_df,
    who_budget = who_budget_df,
    who_community = who_community_df,
    who_sites = who_sites_df,
    gf_procurement = gf_procurement_df
  )
}
