library(tidyverse)
pkgload::load_all()
df_lst <- load()

dm <- build_dm(df_lst, year = NULL)
data_tbl <- build_tbl(dm, vars = dxgap_constants$tb_vars)

tbl <-
  data_tbl |>
  compute_dx_gap() |>
  mutate(is_hbc = forcats::as_factor(is_hbc)) |>
  select(-any_of(c("country"))) |>
  mutate(xpert = coalesce(xpert, m_wrd)) |>
  select(-c(m_wrd, c_newinc, e_inc_num, country_code))

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
