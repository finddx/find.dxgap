skip_if(Sys.getenv("FINDTB_DATADIR") == "")
file_name <- "tb_policy_dashboard_final_v1_14Nov22.xlsx"
data <- read_tb_dashboard(file_name)
test_that("a tibble is returned", {
  skip_if_no_data(file_name)
  expect_true(tibble::is_tibble(data))
})

test_that("the tibble dimensions are as expected", {
  skip_if_no_data(file_name)
  expect_equal(nrow(data), 44)
  expect_equal(ncol(data), 89)
})

test_that("a tibble is returned", {
  skip_if_no_data(file_name)
  expect_true(tibble::is_tibble(tidy_tb_dashboard(data)))
  expect_true(tibble::is_tibble(tidy_tb_dashboard(data, type = "fixed")))
})

test_that("the tibble dimensions are as expected", {
  skip_if_no_data(file_name)
  expect_equal(nrow(tidy_tb_dashboard(data, type = "time_series")), 1440)
  expect_equal(ncol(tidy_tb_dashboard(data, type = "time_series")), 4)
  expect_equal(nrow(tidy_tb_dashboard(data, type = "fixed")), 30)
  expect_equal(ncol(tidy_tb_dashboard(data, type = "fixed")), 14)
})

test_that("primary keys match across time series and fixed data", {
  skip_if_no_data(file_name)
  expect_equal(
    unique(tidy_tb_dashboard(data, type = "time_series")$country),
    unique(tidy_tb_dashboard(data, type = "fixed")$country)
  )
})

