file_name <- "tb_policy_dashboard_final_v1_14Nov22.xlsx"
data <- read_tb_dashboard(file_name)
test_that("a tibble is returned", {
  skip_if_no_file(file_name)
  expect_true(tibble::is_tibble(data))
})

test_that("the tibble dimensions are as expected", {
  skip_if_no_file(file_name)
  expect_equal(nrow(data), 44)
  expect_equal(ncol(data), 89)
})
