test_that("data can be loaded from inst/extdata", {
  test_file <- system.file(
    "extdata",
    "wb_2023-07-28_pop_urban.csv",
    package = "find.dxgap"
  )
  expect_true(file.exists(test_file))
})
