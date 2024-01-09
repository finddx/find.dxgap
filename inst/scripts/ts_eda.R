# ---- Load libs and data ----
library(tidyverse)
pkgload::load_all()
df_lst <- load_dx("tb")

# ---- Build dm ----
dm <- build_dm(
  df_lst,
  estimated = "who_estimates.e_inc_num",
  notified = "who_notifications.c_newinc",
  year = NULL,
)
data_tbl <- build_tbl_impl(dm, vars = dxgap_const$tb_vars)

# ---- Prep data ----
tbl <-
  data_tbl |>
  mutate(is_hbc = forcats::as_factor(is_hbc)) |>
  mutate(xpert = coalesce(xpert, m_wrd)) |>
  select(-c(m_wrd, c_newinc, e_inc_num, country_code))

all_indicators_df <-
  data_tbl |>
  mutate(is_hbc = forcats::as_factor(is_hbc)) |>
  mutate(xpert = coalesce(xpert, m_wrd)) |>
  select(-m_wrd)

# ---- EDA ----
# Q: how does dx gap vary over time for each hb country?
all_indicators_df |>
  filter(is_hbc == 1) |>
  select(country, dx_gap, year) |>
  ggplot(aes(x = year, y = dx_gap)) +
  geom_line(colour = "#1f65b7", linewidth = 1) +
  facet_wrap(vars(country)) +
  scale_x_continuous(breaks = seq(min(all_indicators_df$year), max(all_indicators_df$year), by = 2)) +
  theme_minimal() +
  labs(
    title = "The DX Gaps in high burden countries vary differently over time",
    x = NULL, y = "DX Gap"
  )

# Q: how does dx gap vary over time on average?
all_indicators_df |>
  summarise(mean_dx_gap = mean(dx_gap), .by = c(is_hbc, year)) |>
  ggplot(aes(x = year, y = mean_dx_gap, colour = is_hbc)) +
  geom_line(linewidth = 1) +
  geom_text(data = . %>% filter(year == max(year)), aes(label = ifelse(is_hbc == 1, "High burden", "Low burden")), hjust = -0.1) +
  theme_minimal() +
  theme(legend.position = "none") +
  labs(
    title = "The DX Gap over time demonstrates no seasonality/stationarity",
    subtitle = "A simple time series model should be tested",
    x = NULL,
    y = "Mean TB DX Gap"
  ) +
  scale_colour_viridis_d(
    alpha = 1,
    begin = .2,
    end = .8,
    direction = -1,
    option = "A",
    aesthetics = "colour"
  ) +
  xlim(min(all_indicators_df$year), max(all_indicators_df$year) + .25) +
  ylim(0, NA) # Set to zero show magnitude of relevant difference

# Q: how do the predictor variables vary over time on average for HBC?
all_indicators_df |>
  filter(is_hbc == 1) |>
  select(-c(is_hbc, country_code, dx_gap, country)) |>
  pivot_longer(!year) |>
  summarise(mean_value = mean(value, na.rm = TRUE), .by = c(year, name)) |>
  ggplot(aes(x = year, y = mean_value)) +
  facet_wrap(vars(name), scales = "free") +
  geom_line(linewidth = 1, colour = "#1f65b7") +
  theme_minimal() +
  labs(
    title = "The DX Gap over time demonstrates no seasonality/stationarity",
    subtitle = "A simple time series model should be tested",
    x = NULL,
    y = "Mean"
  )

# Q: how does each test type vary over time for each hb country?
all_indicators_df |>
  filter(is_hbc == 1) |>
  select(country, year, culture, smear, xpert) |>
  pivot_longer(!c(country, year)) |>
  ggplot(aes(x = year, y = value, colour = name)) +
  geom_line(linewidth = 1) +
  facet_wrap(vars(country), scales = "free") +
  scale_x_continuous(breaks = seq(min(all_indicators_df$year), max(all_indicators_df$year), by = 2)) +
  theme_minimal() +
  scale_colour_viridis_d(
    alpha = 1,
    begin = .2,
    end = .8,
    direction = 1,
    option = "A",
    aesthetics = "colour"
  ) +
  labs(
    title = "Test types in most high burden countries have remained largely constant, with a few notable exceptions such as China and Zambia",
    x = NULL, y = "DX Gap"
  )

# Q: How does test type correlate with dx gap across all time points?
corr_df <-
  tbl |>
  select(-is_hbc) |>
  group_split(year, .keep = FALSE) |>
  set_names(nm = sort(unique(tbl$year))) |>
  map(~ corrr::correlate(.x)) |>
  map(~ select(.x, term, dx_gap)) |>
  map(~ filter(.x, term != "dx_gap")) |>
  list_rbind(names_to = "year")

corr_df <-
  tbl |>
  group_split(is_hbc, .keep = FALSE) |>
  set_names(nm = c(0, 1)) |>
  map(~ group_split(.x, year, .keep = FALSE)) |>
  map(~ set_names(.x, nm = sort(unique(tbl$year)))) |>
  map(~ map(.x, ~ corrr::correlate(.x))) |>
  map(~ map(.x, ~ select(.x, term, dx_gap))) |>
  map(~ map(.x, ~ filter(.x, term != "dx_gap"))) |>
  map(~ list_rbind(.x, names_to = "year")) |>
  list_rbind(names_to = "is_hbc")

corr_df |>
  ggplot(aes(year, dx_gap, group = term, color = term)) +
  geom_line() +
  scale_y_continuous(limits = c(-1, 1)) +
  theme_minimal() +
  labs(y = "corr. with `dxgap`") +
  facet_wrap(vars(is_hbc))

corr_df |>
  pivot_wider(names_from = year, values_from = dx_gap) |>
  gt::gt(groupname_col = "is_hbc") |>
  gt::data_color(
    columns = dplyr::where(is.numeric),
    method = "numeric",
    palette = "Greys",
    na_color = "#ffcccb"
  )

# Is time a signficant predictor of DX Gap in HBC?
# dx_gap = (tb_estimated_cases - tb_notified_cases) / tb_estimated_cases
# As estimated and notified cases are included as part of the calculation of
# the dx gap, the following variable are removed:
#   - c_newinc = Total of new and relapse cases and cases with unknown previous TB treatment history
#   - e_inc_num = Estimated number of incident cases
ts_model_prep <-
  all_indicators_df |>
  filter(is_hbc == 1) |>
  select(-is_hbc, -country_code, -country, -c_newinc, -e_inc_num,) |>
  mutate(dummy = 1) %>%
  pivot_wider(names_from = year, values_from = dummy, values_fill = 0) |>
  select(-`2016`) # create reference category

ts_model_lm <-
  ts_model_prep |>
  lm(formula = dx_gap ~ .)

# Result: no determinants detected
ts_model_lm |>
  summary()

# Check for multicollinearity (VIF)
# Result: there is high multicollinearity across many predictors that would need
# resolving
ts_model_lm |>
  performance::check_collinearity()

# Stepwise regression to optimise model (is this valid for statistical
# inference? Are assumptions not violated?)
# https://otexts.com/fpp3/selecting-predictors.html#beware-of-inference-after-selecting-predictors
step(ts_model_lm)
