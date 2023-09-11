skip_if(Sys.getenv("FINDTB_DATADIR") == "")
data_list <- findtb_load(.year = 2019)
test_that("findtb_build_dm() `hbc` works", {
  dm <- findtb_build_dm(data_list)
  expect_snapshot(dm::glimpse(dm))
  expect_snapshot(dm::dm_examine_constraints(dm))
  expect_snapshot({
    dm::dm_examine_constraints(dm) |>
      tibble::as_tibble() |>
      dplyr::filter(problem != "") |>
      print(n = Inf)
  })
})

test_that("findtb_build_dm() `non_hbc` works", {
  dm <- findtb_build_dm(data_list, hbc = FALSE)
  expect_snapshot(dm::glimpse(dm))
  expect_snapshot({
    dm::dm_examine_constraints(dm) |>
      tibble::as_tibble() |>
      dplyr::filter(problem != "") |>
      print(n = Inf)
  })
})
