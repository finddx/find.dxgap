library(tidyverse)
library(corrr) # Note: there is currently issues with renv installing corrr
pkgload::load_all()

# HBC countries ----------------------------------------------------------------

hbc_df <-
  read_hbc("who_hbc.csv") |>
  tidy_hbc(years = 2015) |> # 2015 - 2020
  filter(share_global_inc > 50) |> # restrict subset due to low complete_rate in some data
  select(country_code) |>
  mutate(country = countrycode::countrycode(
    country_code,
    origin = "iso3c",
    dest = "country.name"
  ))

# World Bank Population --------------------------------------------------------

wb_tot_pop_df <-
  read_wb("wb_2023-08-31_SP.POP.TOTL.csv") |>
  tidy_wb(years = 2019) |>
  mutate(value = value / 1e5) |>
  select(country_code, country_value, year, pop_100k = value) |>
  semi_join(hbc_df, by = join_by(country_code))

# World Bank Urban Pop. --------------------------------------------------------

wb_urb_pop_df <-
  read_wb("wb_2023-07-28_SP.URB.TOTL.IN.ZS.csv") |>
  tidy_wb(years = 2019) |>
  select(country_code, year, pop_urban_perc = value) |>
  semi_join(hbc_df, by = join_by(country_code))

# World Bank Density -----------------------------------------------------------

wb_density_pop_df <-
  read_wb("wb_2023-08-31_EN.POP.DNST.csv") |>
  tidy_wb(years = 2019) |>
  select(country_code, year, pop_density = value) |>
  semi_join(hbc_df, by = join_by(country_code))

# WHO notifications ------------------------------------------------------------

who_notifications <-
  read_who("who_2023-07-28_notifications.csv") |>
  tidy_who(years = 2019) |>
  semi_join(hbc_df, by = join_by(country_code)) |>
  filter(variable == "c_newinc") |>
  select(country_code, year, tb_notified_cases = value)

# WHO estimates ----------------------------------------------------------------

who_estimates <-
  read_who("who_2023-07-28_estimates.csv") |>
  tidy_who(years = 2019) |>
  semi_join(hbc_df, by = join_by(country_code)) |>
  filter(variable == "e_inc_num") |>
  select(country_code, year, tb_estimated_cases = value)

# Dx Gap -----------------------------------------------------------------------

dx_gap_df <-
  who_notifications |>
  inner_join(who_estimates, by = join_by(country_code, year)) |>
  mutate(
    who_dx_gap = (tb_estimated_cases - tb_notified_cases) / tb_estimated_cases
  ) |>
  select(country_code, year, who_dx_gap)

# WHO budget -------------------------------------------------------------------

who_budget_df <-
  read_who("who_2023-07-28_budget.csv") |>
  tidy_who(years = 2019) |>
  semi_join(hbc_df, by = join_by(country_code)) |>
  select(
    country_code,
    year,
    budget_type = variable,
    budget_value = value
  )

# WHO community ----------------------------------------------------------------

who_community <-
  read_who("who_2023-07-28_community.csv") |>
  tidy_who(years = 2019) |>
  semi_join(hbc_df, by = join_by(country_code)) |>
  select(country_code, year, comm_type = variable, comm_value = value)

# WHO Sites --------------------------------------------------------------------

who_sites <-
  read_who("who_2023-08-30_laboratories.csv") |>
  tidy_who(years = 2019) |>
  semi_join(hbc_df, by = join_by(country_code)) |>
  select(country_code, year, site_type = variable, site_count = value)

who_sites <-
  who_sites |>
  semi_join(sites_complete_df, by = join_by(site_type, year)) |>
  left_join(wb_tot_pop_df, by = join_by(country_code, year)) |>
  transmute(
    country_code,
    country,
    year,
    site_type,
    sites_per_100k = site_count / pop_100k
  )

# Global Fund Procurement ------------------------------------------------------

gf_procurement <-
  read_gf_procurement("global_fund_procurement_tidy_20230726.csv") |>
  tidy_gf_procurement(years = 2019) |>
  semi_join(hbc_df, by = join_by(country_code)) |>
  select(country_code, year, product, total_numb_device)
  # group_by(country_code, year, product) |>
  # summarise(
  #   total_numb_device = sum(total_numb_device, na.rm = TRUE),
  #   .groups = "drop"
  # ) |>
  # arrange(country_code, product, total_numb_device)

# All --------------------------------------------------------------------------


