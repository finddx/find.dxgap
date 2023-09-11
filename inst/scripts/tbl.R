library(tidyverse)
pkgload::load_all()
df_lst <- findtb_load(.year = 2019)
dm_hbc <- findtb_build_dm(df_lst)
dm_non_hbc <- findtb_build_dm(df_lst, hbc = FALSE)

dm::dm_draw(dm_hbc)
dm::dm_draw(dm_non_hbc)

tbl_hbc <-
  dm_hbc |>
  dm::dm_flatten_to_tbl(.start = hbc)

tbl_non_hbc <-
  dm_non_hbc |>
  dm::dm_flatten_to_tbl(.start = non_hbc)

