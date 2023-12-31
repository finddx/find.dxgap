library(tidyverse)
pkgload::load_all()
df_lst <- load_dx("tb")

dm <- build_dm(df_lst, year = 2019)
data_tbl <- build_tbl_impl(dm, vars = dxgap_const$tb_vars)
readr::write_rds(data_tbl, "tests/testthat/testdata/tb_tbl.rds")

dm::dm_draw(dm)
dm::dm_examine_constraints(dm)


dm_ts <- build_dm(df_lst, year = NULL)
data_tbl_ts <- build_tbl_impl(dm_ts, vars = dxgap_const$tb_vars)
readr::write_rds(data_tbl_ts, "tests/testthat/testdata/tb_tbl_ts.rds")

dm::dm_draw(dm_ts)
dm::dm_examine_constraints(dm_ts)

