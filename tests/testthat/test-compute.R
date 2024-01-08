test_that("compute_completion_rate() works", {
  testdata_path <- testthat::test_path("testdata", "tb_tbl_ts.rds")
  tb_tbl <- readr::read_rds(testdata_path)
  complete_rate_df_country <- compute_completion_rate(tb_tbl, id_vars = "year")
  expect_snapshot(constructive::construct(
    dplyr::arrange(complete_rate_df_country, year, var_name)
  ))
  complete_rate_df_is_hbc <- compute_completion_rate(
    tb_tbl,
    id_vars = c("year", "is_hbc")
  )
  expect_snapshot(constructive::construct(
    dplyr::arrange(complete_rate_df_is_hbc, year, var_name)
  ))
  cars_df <- tibble::as_tibble(mtcars, rownames = "car_name")
  complete_rate_df_cars <- compute_completion_rate(cars_df, id_vars = NULL)
  expect_snapshot(constructive::construct(
    dplyr::arrange(complete_rate_df_cars, var_name)
  ))
})

test_that("compute_correlation() works", {
  testdata_path <- testthat::test_path("testdata", "tb_tbl_ts.rds")
  tb_tbl <- readr::read_rds(testdata_path)
  tbl_dxgap <- compute_dx_gap(tb_tbl, e_inc_num, c_newinc)
  corr_df <- compute_correlation(tbl_dxgap, dx_gap)
  expect_snapshot(constructive::construct(dplyr::arrange(corr_df, term)))
  corr_df_by <- compute_correlation(tbl_dxgap, dx_gap, by = "year")
  expect_snapshot(constructive::construct(
    dplyr::arrange(corr_df_by, year, term)
  ))
  corr_df_by2 <- compute_correlation(tbl_dxgap, dx_gap, by = c("year", "is_hbc"))
  expect_snapshot(constructive::construct(
    dplyr::arrange(corr_df_by2, year, term, is_hbc)
  ))
  expect_error(compute_correlation(tbl_dxgap), regexp = "absent")
})

test_that("compute_dx_gap() works", {
  tbl <- tibble::tibble(
    country_code = c("EGY", "PLW", "MHL"),
    year = c(2001, 2021, 2007),
    e_inc_num = c(18000, 9, 190),
    c_newinc = c(10549, 8, 158),
  )
  tbl_gap <- compute_dx_gap(tbl, e_inc_num, c_newinc)
  expect_s3_class(tbl_gap, "data.frame")
  expect_equal(ncol(tbl_gap), 5)
})

test_that("compute_dx_gap() fails correctly", {
  tbl <- tibble::tibble(
    country_code = c("EGY", "PLW", "MHL"),
    year = c(2001, 2021, 2007),
    e_inc_num = c(18000, 0, 190),
    c_newinc = c(10549, 8, 158),
  )
  expect_snapshot(compute_dx_gap(tbl, e_inc_num), error = TRUE)
  expect_snapshot(compute_dx_gap(tbl, c_newinc), error = TRUE)
  expect_snapshot(compute_dx_gap(tbl, e_inc_num, c_newinc), error = TRUE)
  expect_snapshot({
    tbl |>
      dplyr::mutate(e_inc_num = dplyr::na_if(e_inc_num, 0)) |>
      compute_dx_gap(e_inc_num, c_newinc)
  }, error = TRUE)
})



