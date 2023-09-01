skip_if(Sys.getenv("FINDTB_DATADIR") == "")
test_that("findtb_build_dm() works", {
  data_list <- findtb_load(.year = 2019)
  dm <- findtb_build_dm(data_list)
  expect_snapshot(dm::glimpse(dm))
})
