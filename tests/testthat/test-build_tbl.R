test_that("build_tbl() works with non-NULL args.", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  tbl <- build_tbl(
    "tb",
    year = 2019,
    estimated = "who_estimates.e_inc_num",
    notified = "who_notifications.c_newinc",
    vars = c("year", "country", "pop_density", "e_inc_num", "c_newinc")
  )
  expect_s3_class(tbl, "data.frame")
  expect_in("dx_gap", names(tbl))
})

test_that("build_tbl() works with `NULL` args.", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  tbl <- build_tbl(
    "tb",
    year = 2019,
    estimated = NULL,
    notified = NULL,
    vars = c("year", "country", "pop_density", "e_inc_num", "c_newinc")
  )
  expect_s3_class(tbl, "data.frame")
  expect_in("dx_gap", names(tbl))
})
