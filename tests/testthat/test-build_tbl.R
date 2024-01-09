test_that("build_tbl_impl() works", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  data_list <- build_lst("tb")
  dm <- build_dm(
    data_list,
    estimated = "who_estimates.e_inc_num",
    notified = "who_notifications.c_newinc"
  )
  tbl <- build_tbl_impl(
    dm,
    estimated = "who_estimates.e_inc_num",
    notified = "who_notifications.c_newinc"
  )
  expect_s3_class(tbl, "data.frame")
})

test_that("build_tbl_impl() returns accurate results", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  data_list <- build_lst("tb")
  dm <- build_dm(
    data_list,
    estimated = "who_estimates.e_inc_num",
    notified = "who_notifications.c_newinc"
  )
  tbl <- build_tbl_impl(
    dm,
    estimated = "who_estimates.e_inc_num",
    notified = "who_notifications.c_newinc"
  )

  # consistent subset of countries per year
  n_distinct_years <-
    tbl |>
    dplyr::group_by(country_code) |>
    dplyr::summarise(ndist = dplyr::n_distinct(year), .groups = "drop") |>
    dplyr::pull(ndist) |>
    unique()
  expect_equal(length(n_distinct_years), 1)

  # vars to compute dxgap are always given
  any_na_dxgap <-
    tbl |>
    dplyr::filter(dplyr::if_any(c("c_newinc", "e_inc_num"), is.na)) |>
    dplyr::count() |>
    dplyr::pull()

  expect_equal(any_na_dxgap, 0)
})

test_that("build_tbl() works with non-NULL args.", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  tbl <- build_tbl(
    "tb",
    year = 2019,
    estimated = "who_estimates.e_inc_num",
    notified = "who_notifications.c_newinc",
    vars = c("year", "country_code", "pop_density", "e_inc_num", "c_newinc")
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
    vars = c("year", "country_code", "pop_density", "e_inc_num", "c_newinc")
  )
  expect_s3_class(tbl, "data.frame")
  expect_in("dx_gap", names(tbl))
})
