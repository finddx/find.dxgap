file_name <- "global_fund_procurement_tidy_20230726.csv"
data <- read_gf_procurement(file_name)
test_that("a tibble is returned", {
  skip_if_no_data(file_name)
  expect_true(tibble::is_tibble(tidy_gf_procurement(data)))
})

test_that("the tibble dimensions are as expected", {
  skip_if_no_data(file_name)
  expect_equal(nrow(tidy_gf_procurement(data)), 1677)
  expect_equal(ncol(tidy_gf_procurement(data)), 25)
})

test_that("primary keys match across time series and fixed data", {
  skip_if_no_data(file_name)
  expect_equal(
    unique(tidy_gf_procurement(data)$country_territory),
    unique(tidy_gf_procurement(data)$country_territory)
  )
})
