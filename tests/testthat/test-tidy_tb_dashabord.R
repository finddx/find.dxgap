data <- read_tb_dashboard()

test_that("a tibble is returned", {
  expect_true(tibble::is_tibble(tidy_tb_dashboard(data)))
  expect_true(tibble::is_tibble(tidy_tb_dashboard(data, type = "fixed")))
})

test_that("the tibble dimensions are as expected", {
  expect_equal(nrow(tidy_tb_dashboard(data, type = "time_series")), 1440)
  expect_equal(ncol(tidy_tb_dashboard(data, type = "time_series")), 4)
  expect_equal(nrow(tidy_tb_dashboard(data, type = "fixed")), 30)
  expect_equal(ncol(tidy_tb_dashboard(data, type = "fixed")), 14)
})

test_that("primary keys match across time series and fixed data", {
  expect_equal(
    unique(tidy_tb_dashboard(data, type = "time_series")$country),
    unique(tidy_tb_dashboard(data, type = "fixed")$country)
  )
})
