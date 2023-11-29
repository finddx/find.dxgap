skip_if(Sys.getenv("DXGAP_DATADIR") == "")
data_list <- load_dx("tb")
test_that("build_dm()", {
  dm <- build_dm(data_list, year = 2019)
  expect_snapshot(dm::glimpse(dm))
  expect_snapshot(dm::dm_examine_constraints(dm))
  expect_snapshot({
    dm::dm_examine_constraints(dm) |>
      tibble::as_tibble() |>
      dplyr::filter(problem != "") |>
      dplyr::pull(problem) |>
      writeLines()
  })
})

test_that("build_dm() works and returns a time series", {
  dm <- build_dm(data_list)
  expect_snapshot(dm::glimpse(dm))
  expect_snapshot(dm::dm_examine_constraints(dm))
  expect_snapshot({
    dm::dm_examine_constraints(dm) |>
      tibble::as_tibble() |>
      dplyr::filter(problem != "") |>
      dplyr::pull(problem) |>
      writeLines()
  })
})

test_that("build_tbl_impl() works", {
  dm <- build_dm(data_list)
  tbl <- build_tbl_impl(dm)
  expect_s3_class(tbl, "data.frame")
})

test_that("build_tbl_impl() returns accurate results", {
  dm <- build_dm(data_list)
  tbl <- build_tbl_impl(dm)

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
