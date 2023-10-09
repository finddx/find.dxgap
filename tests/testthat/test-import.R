test_that("extract_name strips any file extension", {
  expect_equal(extract_name("who_2023-07-28_estimates.csv"), "who_estimates")
  expect_equal(extract_name("who_2023-07-28_estimates.xlsx"), "who_estimates")
})