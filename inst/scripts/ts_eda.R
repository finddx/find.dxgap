# ---- Load libs and data ----
library(tidyverse)
pkgload::load_all()
df_lst <- load()

# ---- Build dm ----
dm <- build_dm(df_lst, year = NULL)
data_tbl <- build_tbl(dm, vars = dxgap_constants$tb_vars)

# ---- Prep data ----
tbl <-
  data_tbl |>
  compute_dx_gap() |>
  mutate(is_hbc = forcats::as_factor(is_hbc)) |>
  select(-any_of(c("country"))) |>
  mutate(xpert = coalesce(xpert, m_wrd)) |>
  select(-c(m_wrd, c_newinc, e_inc_num, country_code))

all_indicators_df <-
  data_tbl |>
  compute_dx_gap() |>
  mutate(is_hbc = forcats::as_factor(is_hbc)) |>
  mutate(xpert = coalesce(xpert, m_wrd)) |>
  select(-m_wrd)

# ---- EDA ----
# Q: how does dx gap vary over time for each hb country?
all_indicators_df |>
  filter(is_hbc == 1) |>
  select(country, who_dx_gap, year) |>
  ggplot(aes(x = year, y = who_dx_gap)) +
  geom_line(colour = "#1f65b7", linewidth = 1) +
  facet_wrap(vars(country)) +
  scale_x_continuous(breaks = seq(min(all_indicators_df$year), max(all_indicators_df$year), by = 2)) +
  theme_minimal() +
  labs(
    title = "The DX Gaps in high burden countries vary differently over time",
    x = NULL, y = "DX Gap"
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
  map(~ select(.x, term, who_dx_gap)) |>
  map(~ filter(.x, term != "who_dx_gap")) |>
  list_rbind(names_to = "year")

corr_df <-
  tbl |>
  group_split(is_hbc, .keep = FALSE) |>
  set_names(nm = c(0, 1)) |>
  map(~ group_split(.x, year, .keep = FALSE)) |>
  map(~ set_names(.x, nm = sort(unique(tbl$year)))) |>
  map(~ map(.x, ~ corrr::correlate(.x))) |>
  map(~ map(.x, ~ select(.x, term, who_dx_gap))) |>
  map(~ map(.x, ~ filter(.x, term != "who_dx_gap"))) |>
  map(~ list_rbind(.x, names_to = "year")) |>
  list_rbind(names_to = "is_hbc")

corr_df |>
  ggplot(aes(year, who_dx_gap, group = term, color = term)) +
  geom_line() +
  scale_y_continuous(limits = c(-1, 1)) +
  theme_minimal() +
  labs(y = "corr. with `dxgap`") +
  facet_wrap(vars(is_hbc))

corr_df |>
  pivot_wider(names_from = year, values_from = who_dx_gap) |>
  gt::gt(groupname_col = "is_hbc") |>
  gt::data_color(
    columns = dplyr::where(is.numeric),
    method = "numeric",
    palette = "Greys",
    na_color = "#ffcccb"
  )
  
# ---- Models ----
# Q: does adding year as a predictor come out as signficant?

# Q: If fitting a more complex time series model (e.g., ARIMA) what time series
#    features should be checked:
#    - Lag/autocorrelation
#    - Stationarity
#    - Seasonality

# Q: does a simple ARIMA model outperform the simple regression previously
#    fitted? (Indicating that dynamics within countries are a significant
#    factor)
