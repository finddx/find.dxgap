library(tidyverse)
pkgload::load_all()
df_lst <- load(.year = 2019)
dm_hbc <- build_dm(df_lst)
dm_non_hbc <- build_dm(df_lst, hbc = FALSE)
data_tbl <- build_tbl(dm_hbc, dm_non_hbc)


dm::dm_draw(dm_hbc)
dm::dm_examine_constraints(dm_hbc)
dm::dm_draw(dm_non_hbc)
dm::dm_examine_constraints(dm_non_hbc)



tbl_hbc <-
  dm_hbc |>
  dm::dm_flatten_to_tbl(.start = hbc)


tbl_hbc |>
  filter(if_all(-c(country_code), is.na)) |>
  distinct(country_code)

tbl_non_hbc <-
  dm_non_hbc |>
  dm::dm_flatten_to_tbl(.start = non_hbc)

tbl_non_hbc |>
  filter(if_all(-c(country_code), is.na)) |>
  distinct(country_code)

