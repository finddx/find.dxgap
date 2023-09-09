skip_if(Sys.getenv("FINDTB_DATADIR") == "")
data_list <- findtb_load(.year = 2019)
test_that("findtb_build_dm() `hbc` works", {
  dm <- findtb_build_dm(data_list)
  expect_snapshot(dm::glimpse(dm))
})

test_that("findtb_build_dm() `non_hbc` works", {
  dm <- findtb_build_dm(data_list, hbc = FALSE)
  expect_snapshot(dm::glimpse(dm))
})
