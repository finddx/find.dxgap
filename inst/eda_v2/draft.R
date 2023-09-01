wb_tot_pop_df |>
  ggplot(aes(pop_100k)) +
  geom_density(fill = "steelblue", alpha = .5) +
  theme_minimal() +
  labs(
    x = "Total population in 2019",
    caption = "Source: World Bank"
  )


wb_density_pop_df |>
  ggplot(aes(pop_density)) +
  geom_density(fill = "steelblue", alpha = .5) +
  theme_minimal() +
  labs(
    x = "Population density (people per sq. km of land area) in 2019",
    caption = "Source: World Bank"
  )

dx_gap_df |>
  ggplot(aes(who_dx_gap)) +
  geom_density(fill = "steelblue", alpha = .5) +
  theme_minimal() +
  labs(x = "WHO's Dx Gap in 2019")

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

community_complete_df <-
  who_community |>
  group_by(comm_type) |>
  summarise(n = n(), complete_rate = sum(!is.na(comm_value)) / n, .groups = "drop") |>
  filter(complete_rate > 0.7)

who_community |>
  semi_join(community_complete_df, by = join_by(comm_type)) |>
  left_join(findtb_master_list, by = join_by(comm_type == variable_name)) |>
  select(country_code, comm_value, definition)

who_sites |>
  ggplot(aes(sites_per_100k)) +
  geom_density(fill = "steelblue", alpha = .5) +
  facet_wrap(vars(site_type), scales = "free") +
  theme_minimal()

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

# group_by(country_code, year, product) |>
# summarise(
#   total_numb_device = sum(total_numb_device, na.rm = TRUE),
#   .groups = "drop"
# ) |>
# arrange(country_code, product, total_numb_device)
