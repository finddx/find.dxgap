library(tidyverse)
library(corrr) # Note: there is currently issues with renv installing corrr
pkgload::load_all()

# Year 2021 since the HBC lists is for 2021. Not 2019 anymore.
# Compute:
# - dxgap
# - Corr. dxgap with:
#   - population
#   - budget
#   - community
#   - expenditures
#   - laboratories
#   - notifications
#   - funds


# HBC countries -----------------------------------------------------------

hbc_df <-
  read_hbc("who_hbc.csv") |>
  tidy_hbc(years = 2015) |> # 2015 - 2020
  filter(share_global_inc > 50) |> # restrict subset due to low complete_rate in some data
  select(country_code)

# World Bank Population ---------------------------------------------------

wb_tot_pop_df <-
  read_wb("wb_2023-08-31_SP.POP.TOTL.csv") |>
  tidy_wb(years = 2019) |>
  mutate(value = value / 1e5) |>
  select(country_code, country_value, year, pop_100k = value) |>
  semi_join(hbc_df, by = join_by(country_code))

wb_tot_pop_df |>
  ggplot(aes(pop_100k)) +
  geom_density(fill = "steelblue", alpha = .5) +
  theme_minimal() +
  labs(
    x = "Total population in 2019",
    caption = "Source: World Bank"
  )

# World Bank Urban Pop. ---------------------------------------------------

wb_urb_pop_df <-
  read_wb("wb_2023-07-28_SP.URB.TOTL.IN.ZS.csv") |>
  tidy_wb(years = 2019) |>
  select(country_code, country_value, year, pop_urban_perc = value) |>
  semi_join(hbc_df, by = join_by(country_code))

# World Bank Density ------------------------------------------------------

wb_density_pop_df <-
  read_wb("wb_2023-08-31_EN.POP.DNST.csv") |>
  tidy_wb(years = 2019) |>
  select(country_code, country_value, year, pop_density = value) |>
  semi_join(hbc_df, by = join_by(country_code))

wb_density_pop_df |>
  ggplot(aes(pop_density)) +
  geom_density(fill = "steelblue", alpha = .5) +
  theme_minimal() +
  labs(
    x = "Population density (people per sq. km of land area) in 2019",
    caption = "Source: World Bank"
  )

# WHO notifications -------------------------------------------------------

who_notifications <-
  read_who("who_2023-07-28_notifications.csv") |>
  tidy_who(years = 2019) |>
  semi_join(hbc_df, by = join_by(country_code)) |>
  filter(variable == "c_newinc") |>
  select(country_code, country, year, tb_notified_cases = value)

# WHO estimates -----------------------------------------------------------

who_estimates <-
  read_who("who_2023-07-28_estimates.csv") |>
  tidy_who(years = 2019) |>
  semi_join(hbc_df, by = join_by(country_code)) |>
  filter(variable == "e_inc_num") |>
  select(country_code, country, year, tb_estimated_cases = value)

# Dx Gap ------------------------------------------------------------------

dx_gap_df <-
  who_notifications |>
  select(-country) |>
  inner_join(who_estimates, by = join_by(country_code, year)) |>
  mutate(
    who_dx_gap = (tb_estimated_cases - tb_notified_cases) / tb_estimated_cases
  ) |>
  select(country, country_code, year, who_dx_gap)

dx_gap_df |>
  ggplot(aes(who_dx_gap)) +
  geom_density(fill = "steelblue", alpha = .5) +
  theme_minimal() +
  labs(x = "WHO's Dx Gap in 2019")

# WHO budget --------------------------------------------------------------

who_budget_df <-
  read_who("who_2023-07-28_budget.csv") |>
  tidy_who(years = 2019) |>
  semi_join(hbc_df, by = join_by(country_code)) |>
  left_join(findtb_master_list, join_by(variable == variable_name)) |>
  select(
    country_code,
    country,
    year,
    budget_type = variable,
    definition,
    budget_value = value
  ) |>
  mutate(definition = str_squish(str_remove_all(definition, "\\(.+\\)"))) |>
  filter(!is.na(budget_value) & budget_value > 0)

who_budget_df |>
  ggplot(aes(budget_value)) +
  geom_density(fill = "steelblue", alpha = .5) +
  facet_wrap(vars(definition), ncol = 2, scales = "free") +
  theme_minimal()

who_budget_dx_df <-
  who_budget_df |>
  select(-country) |>
  inner_join(dx_gap_df, join_by(country_code, year)) |>
  select(-all_of(c("budget_type", "year")))

who_budget_dx_df |>
  ggplot(aes(budget_value, who_dx_gap)) +
  geom_point(colour = "steelblue", alpha = .8) +
  facet_wrap(vars(definition), ncol = 2, scales = "free") +
  theme_minimal()

who_budget_dx_df |>
  pivot_wider(names_from = definition, values_from = budget_value) |>
  correlate() |>
  select(term, who_dx_gap) |>
  arrange(who_dx_gap) |>
  filter(term != "who_dx_gap")

# log budget per 100k pop ----
who_log_budget_df <-
  who_budget_df |>
  select(-country) |>
  inner_join(wb_tot_pop_df, by = join_by(country_code, year)) |>
  mutate(budget_per_100k = budget_value / pop_100k) |>
  mutate(log_budget_per_100k = log(budget_per_100k)) |>
  inner_join(dx_gap_df, join_by(country_code, year)) |>
  select(-all_of(c("budget_type", "year")))


who_log_budget_df |>
  ggplot(aes(log_budget_per_100k)) +
  geom_density(fill = "steelblue", alpha = .5) +
  facet_wrap(vars(definition), ncol = 2, scales = "free") +
  theme_minimal()

who_log_budget_df |>
  select(country_code, who_dx_gap, log_budget_per_100k, definition) |>
  pivot_wider(names_from = definition, values_from = log_budget_per_100k) |>
  correlate() |>
  select(term, who_dx_gap) |>
  arrange(who_dx_gap) |>
  filter(term != "who_dx_gap")

who_log_budget_df |>
  ggplot(aes(log_budget_per_100k, who_dx_gap)) +
  geom_point(colour = "steelblue", alpha = .8) +
  facet_wrap(vars(definition), ncol = 2, scales = "free") +
  theme_minimal()


# WHO community -----------------------------------------------------------

who_community <-
  read_who("who_2023-07-28_community.csv") |>
  tidy_who(years = 2019) |>
  semi_join(hbc_df, by = join_by(country_code)) |>
  select(country_code, country, year, comm_type = variable, comm_value = value)

community_complete_df <-
  who_community |>
  group_by(comm_type) |>
  summarise(n = n(), complete_rate = sum(!is.na(comm_value)) / n, .groups = "drop") |>
  filter(complete_rate > 0.7)

who_community |>
  semi_join(community_complete_df, by = join_by(comm_type)) |>
  left_join(findtb_master_list, by = join_by(comm_type == variable_name)) |>
  select(country_code, comm_value, definition) |>


# WHO Sites ----------------------------------------------------------------

who_sites <-
  read_who("who_2023-08-30_laboratories.csv") |>
  tidy_who(years = 2019) |>
  semi_join(hbc_df, by = join_by(country_code)) |>
  select(country_code, country, year, site_type = variable, site_count = value)

sites_complete_df <-
  who_sites |>
  group_by(site_type, year) |>
  summarise(n = n(), complete_rate = sum(!is.na(site_count)) / n, .groups = "drop") |>
  arrange(year) |>
  select(-n) |>
  filter(complete_rate > 0)

findtb_master_list |>
  filter(variable_name %in% c("culture", "smear", "xpert")) |>
  select(variable_name, definition)

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

who_sites |>
  ggplot(aes(sites_per_100k)) +
  geom_density(fill = "steelblue", alpha = .5) +
  facet_wrap(vars(site_type), scales = "free") +
  theme_minimal()

# Global Fund Procurement -------------------------------------------------

gf_procurement <-
  read_gf_procurement("global_fund_procurement_tidy_20230726.csv") |>
  tidy_gf_procurement(years = 2019) |>
  semi_join(hbc_df, by = join_by(country_code)) |>
  select(country_code, country_territory, year, product, total_numb_device) |>
  group_by(country_code, country_territory, year, product) |>
  summarise(
    total_numb_device = sum(total_numb_device, na.rm = TRUE),
    .groups = "drop"
  ) |>
  arrange(country_code, product, total_numb_device)

gf_procurement |> glimpse()
