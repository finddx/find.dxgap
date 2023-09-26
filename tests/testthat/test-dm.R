skip_if(Sys.getenv("DXGAP_DATADIR") == "")
data_list <- load()
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
