library(tidyverse)

# Dictionary -------------------------------------------------------------------

who_dict <- read_csv(
  "https://extranet.who.int/tme/generateCSV.asp?ds=dictionary"
)

# Estimates --------------------------------------------------------------------

who_estimates <- read_csv(
  "https://extranet.who.int/tme/generateCSV.asp?ds=estimates"
)

est_df <-
  who_estimates |>
  select(iso3, year, starts_with("e_"), starts_with("cfr"), starts_with("c_")) |>
  pivot_longer(cols = -c(iso3, year)) |>
  transmute(
    iso3,
    year,
    name,
    is_na = if_else(is.na(value), 0, 1)
  ) |>
  arrange(iso3, name, year)

est_df |>
  filter(iso3=="ABW", name=="c_cdr") |>
  pull(is_na)

est_df |>
  group_by(name, iso3) |>
  summarise(rle = list(rle(is_na))) |>
  ungroup() |>
  mutate(seq_len = map(rle, ~ tapply(.x$lengths, .x$values, max))) |>
  unnest_longer(col = seq_len) |>
  select(-rle) |>
  mutate(seq_len = as.integer(seq_len))


# Notifications ----------------------------------------------------------------

who_notifications <- read_csv(
  "https://extranet.who.int/tme/generateCSV.asp?ds=notifications"
)

n_col <- ncol(who_notifications)
who_notifications |>
  select(iso3, year, all_of(7:n_col)) |>
  pivot_longer(cols = -c(iso3, year)) |>
  transmute(
    iso3,
    # year = paste0("yr_", year),
    name,
    is_na = if_else(is.na(value), 0, 1)
  ) |>
  group_by(name, iso3) |>
  summarise(n_complete = sum(is_na)) |>
  ungroup() |>
  arrange(desc(n_complete)) |>
  print(n = 100)

