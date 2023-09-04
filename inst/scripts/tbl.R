library(tidyverse)
pkgload::load_all()
df_lst <- findtb_load(.year = 2021)
dm <- findtb_build_dm(df_lst)
tbl <-
  dm |>
  dm::dm_flatten_to_tbl(.start = hbc)

