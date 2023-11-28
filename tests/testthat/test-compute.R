skip_if(Sys.getenv("DXGAP_DATADIR") == "")
data_list <- load_dx("tb")
dm <- build_dm(data_list, year = NULL)
tbl <- build_tbl(dm, vars = dxgap_const$tb_vars)
test_that("compute_completion_rate() works", {
  complete_rate_df_country <- compute_completion_rate(tbl, id_vars = "year")
  expect_snapshot(constructive::construct(complete_rate_df_country))
  complete_rate_df_is_hbc <- compute_completion_rate(tbl, id_vars = c("year", "is_hbc"))
  expect_snapshot(constructive::construct(complete_rate_df_is_hbc))
  cars_df <- tibble::as_tibble(mtcars, rownames = "car_name")
  complete_rate_df_cars <- compute_completion_rate(cars_df, id_vars = NULL)
  expect_snapshot(constructive::construct(complete_rate_df_cars))
})

test_that("compute_correlation() works", {
  tbl_dxgap <- compute_dx_gap(tbl)
  expect_error(compute_correlation(tbl_dxgap, who_dx_gap), regexp = "numeric")
  corr_df <-
    tbl_dxgap |>
    dplyr::select(-tidyselect::all_of(c("year", "country", "country_code"))) |>
    compute_correlation(who_dx_gap)
  expect_snapshot(constructive::construct(corr_df))
  corr_df_by <- compute_correlation(tbl_dxgap, who_dx_gap, by = "year")
  expect_snapshot(constructive::construct(corr_df_by))
  corr_df_by2 <- compute_correlation(tbl_dxgap, who_dx_gap, by = c("year", "is_hbc"))
  expect_snapshot(constructive::construct(corr_df_by2))
  expect_error(compute_correlation(tbl_dxgap), regexp = "absent")
})
