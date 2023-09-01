findtb_load <- function(.years = 2019) {

  # HBC countries --------------------------------------------------------------

  hbc_df <-
    read_hbc("who_hbc.csv") |>
    tidy_hbc(years = 2015) |> # 2015 - 2020
    dplyr::filter(share_global_inc > 50) |> # restrict subset due to low complete_rate in some data
    dplyr::select(country_code) |>
    dplyr::mutate(country = countrycode::countrycode(
      country_code,
      origin = "iso3c",
      dest = "country.name"
    ))

  # World Bank Population ------------------------------------------------------

  wb_tot_pop_df <-
    read_wb("wb_2023-08-31_SP.POP.TOTL.csv") |>
    tidy_wb(!!.years) |>
    # dplyr::mutate(value = value / 1e5) |>
    # dplyr::select(country_code, country_value, year, pop_100k = value) |>
    dplyr::semi_join(hbc_df, by = join_by(country_code))

  # World Bank Urban Pop. ------------------------------------------------------

  wb_urb_pop_df <-
    read_wb("wb_2023-07-28_SP.URB.TOTL.IN.ZS.csv") |>
    tidy_wb(!!.years) |>
    dplyr::select(country_code, year, pop_urban_perc = value) |>
    dplyr::semi_join(hbc_df, by = join_by(country_code))

  # World Bank Density ---------------------------------------------------------

  wb_density_pop_df <-
    read_wb("wb_2023-08-31_EN.POP.DNST.csv") |>
    tidy_wb(!!.years) |>
    dplyr::select(country_code, year, pop_density = value) |>
    dplyr::semi_join(hbc_df, by = join_by(country_code))

  # WHO notifications ----------------------------------------------------------

  who_notifications_df <-
    read_who("who_2023-07-28_notifications.csv") |>
    tidy_who(!!.years) |>
    dplyr::semi_join(hbc_df, by = join_by(country_code)) |>
    dplyr::filter(variable == "c_newinc") |>
    dplyr::select(country_code, year, tb_notified_cases = value)

  # WHO estimates --------------------------------------------------------------

  who_estimates_df <-
    read_who("who_2023-07-28_estimates.csv") |>
    tidy_who(!!.years) |>
    semi_join(hbc_df, by = join_by(country_code)) |>
    dplyr::filter(variable == "e_inc_num") |>
    dplyr::select(country_code, year, tb_estimated_cases = value)

  # Dx Gap ---------------------------------------------------------------------

  dx_gap_df <-
    who_notifications |>
    dplyr::inner_join(who_estimates, by = join_by(country_code, year)) |>
    dplyr::mutate(
      who_dx_gap = (tb_estimated_cases - tb_notified_cases) / tb_estimated_cases
    ) |>
    dplyr::select(country_code, year, who_dx_gap)

  # WHO budget -----------------------------------------------------------------

  who_budget_df <-
    read_who("who_2023-07-28_budget.csv") |>
    tidy_who(!!.years) |>
    semi_join(hbc_df, by = join_by(country_code)) |>
    dplyr::select(
      country_code,
      year,
      budget_type = variable,
      budget_value = value
    )

  # WHO community --------------------------------------------------------------

  who_community_df <-
    read_who("who_2023-07-28_community.csv") |>
    tidy_who(!!.years) |>
    dplyr::semi_join(hbc_df, by = join_by(country_code)) |>
    dplyr::select(country_code, year, comm_type = variable, comm_value = value)

  # WHO Sites ------------------------------------------------------------------

  who_sites_df <-
    read_who("who_2023-08-30_laboratories.csv") |>
    tidy_who(!!.years) |>
    dplyr::semi_join(hbc_df, by = join_by(country_code)) |>
    dplyr::select(country_code, year, site_type = variable, site_count = value)


  # Global Fund Procurement ----------------------------------------------------

  gf_procurement_df <-
    read_gf_procurement("gf_2023-07-26_procurement.csv") |>
    tidy_gf_procurement(!!.years) |>
    dplyr::semi_join(hbc_df, by = join_by(country_code)) |>
    dplyr::select(country_code, year, product, total_numb_device)
}
