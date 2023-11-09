library(tidyverse)
pkgload::load_all()
df_lst <- load_dx("tb")

dm <- build_dm(df_lst, year = 2019)
data_tbl <- build_tbl(dm)

dm::dm_draw(dm)
dm::dm_examine_constraints(dm)


dm_ts <- build_dm(df_lst, year = NULL)
data_tbl_ts <- build_tbl(dm_ts)

dm::dm_draw(dm_ts)
dm::dm_examine_constraints(dm_ts)

