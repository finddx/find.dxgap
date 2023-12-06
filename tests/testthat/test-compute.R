test_that("compute_completion_rate() works", {
  testdata_path <- testthat::test_path("testdata", "tb_tbl_ts.rds")
  tb_tbl <- readr::read_rds(testdata_path)
  complete_rate_df_country <- compute_completion_rate(tb_tbl, id_vars = "year")
  expect_snapshot(constructive::construct(complete_rate_df_country))
  complete_rate_df_is_hbc <- compute_completion_rate(tb_tbl, id_vars = c("year", "is_hbc"))
  expect_snapshot(constructive::construct(complete_rate_df_is_hbc))
  cars_df <- tibble::as_tibble(mtcars, rownames = "car_name")
  complete_rate_df_cars <- compute_completion_rate(cars_df, id_vars = NULL)
  expect_snapshot(constructive::construct(complete_rate_df_cars))
})

test_that("compute_correlation() works", {
  testdata_path <- testthat::test_path("testdata", "tb_tbl_ts.rds")
  tb_tbl <- readr::read_rds(testdata_path)
  tbl_dxgap <- compute_dx_gap(tb_tbl, c_newinc, e_inc_num)
  corr_df <- compute_correlation(tbl_dxgap, who_dx_gap)
  expect_snapshot(constructive::construct(corr_df))
  corr_df_by <- compute_correlation(tbl_dxgap, who_dx_gap, by = "year")
  expect_snapshot(constructive::construct(corr_df_by))
  corr_df_by2 <- compute_correlation(tbl_dxgap, who_dx_gap, by = c("year", "is_hbc"))
  expect_snapshot(constructive::construct(corr_df_by2))
  expect_error(compute_correlation(tbl_dxgap), regexp = "absent")
})

test_that("compute_dx_gap_impl() works", {
  tbl <- tibble::tibble(
    country_code = c("EGY", "PLW", "MHL"),
    year = c(2001, 2021, 2007),
    e_inc_num = c(18000, 9, 190),
    c_newinc = c(10549, 8, 158),
  )
  tbl_gap <- compute_dx_gap_impl(tbl, c_newinc, e_inc_num)
  expect_s3_class(tbl_gap, "data.frame")
})
