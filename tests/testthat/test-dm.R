skip_if(Sys.getenv("DXGAP_DATADIR") == "")
data_list <- load()
test_that("build_dm() `hbc` works", {
  dm <- build_dm(data_list, year = 2019, is_hbc = FALSE)
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

test_that("build_dm() `non_hbc` works", {
  dm <- build_dm(data_list, year = 2019, is_hbc = FALSE)
  expect_snapshot(dm::glimpse(dm))
  expect_snapshot({
    dm::dm_examine_constraints(dm) |>
      tibble::as_tibble() |>
      dplyr::filter(problem != "") |>
      dplyr::pull(problem) |>
      writeLines()
  })
})
