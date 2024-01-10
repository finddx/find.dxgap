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

test_that("build_dm()'s year arg. works", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  data_list <- build_lst("tb")
  dm <- build_dm(
    data_list,
    estimated = "who_estimates.e_inc_num",
    notified = "who_notifications.c_newinc",
    year = 2018:2021
  )
  years <- unique(dm$country$year)
  expect_length(years, 4)
  dm <- build_dm(
    data_list,
    estimated = "who_estimates.e_inc_num",
    notified = "who_notifications.c_newinc",
    year = 2021
  )
  years <- unique(dm$country$year)
  expect_length(years, 1)
  dm <- build_dm(
    data_list,
    estimated = "who_estimates.e_inc_num",
    notified = "who_notifications.c_newinc",
    year = NULL
  )
  years <- unique(dm$country$year)
  expect_true(length(years) > 0)
  expect_error(
    dm <- build_dm(
      data_list,
      estimated = "who_estimates.e_inc_num",
      notified = "who_notifications.c_newinc",
      year = 2014
    ),
    regexp = "not in",
    class = "dxgap_year_supported_range"
  )
  expect_message(
    dm <- build_dm(
      data_list,
      estimated = "who_estimates.e_inc_num",
      notified = "who_notifications.c_newinc",
      year = 2014:2017
    ),
    regexp = "Fallback",
    class = "dxgap_year_supported_range"
  )
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
