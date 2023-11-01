library(tidyverse)
pkgload::load_all()
df_lst <- load_dx()

dm <- build_dm(df_lst, year = 2019)
data_tbl <- build_tbl(dm)

dm::dm_draw(dm)
dm::dm_examine_constraints(dm)

