library(tidyverse)
pkgload::load_all()

data_tbl <- build_tbl(
  "tb",
  year = 2019,
  estimated = "who_estimates.e_inc_num",
  notified = "who_notifications.c_newinc",
  vars = dxgap_const$tb_vars
)
readr::write_rds(data_tbl, "tests/testthat/testdata/tb_tbl.rds")

data_tbl_ts <- build_tbl(
  "tb",
  year = NULL,
  estimated = "who_estimates.e_inc_num",
  notified = "who_notifications.c_newinc",
  vars = dxgap_const$tb_vars
)
readr::write_rds(data_tbl_ts, "tests/testthat/testdata/tb_tbl_ts.rds")
