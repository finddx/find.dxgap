test_that("build_dm()", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  data_list <- build_lst("tb")
  dm <- build_dm(
    data_list,
    year = 2019,
    estimated = "who_estimates.e_inc_num",
    notified = "who_notifications.c_newinc"
  )
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
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  data_list <- build_lst("tb")
  dm <- build_dm(
    data_list,
    estimated = "who_estimates.e_inc_num",
    notified = "who_notifications.c_newinc"
  )
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

test_that("build_dm() with `NULL` args.", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  data_list <- build_lst("tb")
  dm <- build_dm(
    data_list,
    year = 2019,
    estimated = NULL,
    notified = NULL
  )
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

test_that("build_dm() works and returns a time series with `NULL` args.", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  data_list <- build_lst("tb")
  dm <- build_dm(
    data_list,
    estimated = NULL,
    notified = NULL
  )
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
