library(tidyverse)
pkgload::load_all()
df_lst <- findtb_load(.year = 2021)
dm <- findtb_build_dm(df_lst)

dm::dm_draw(dm)

tbl <-
  dm |>
  dm::dm_flatten_to_tbl(.start = hbc)

