skip_on_ci()
skip_if(Sys.getenv("DXGAP_DATADIR") == "")
file_name <- "gf_procurement_2023-07-26.csv"
data <- read_gf_procurement(file_name)
test_that("a tibble is returned", {
  skip_if_no_data(file_name)
  expect_true(tibble::is_tibble(data))
})

test_that("the tibble dimensions are as expected", {
  skip_if_no_data(file_name)
  expect_equal(nrow(data), 1677)
  expect_equal(ncol(data), 22)
})

test_that("a tibble is returned", {
  skip_if_no_data(file_name)
  expect_true(tibble::is_tibble(tidy_gf_procurement(data)))
})

test_that("the tibble dimensions are as expected", {
  skip_if_no_data(file_name)
  expect_equal(nrow(tidy_gf_procurement(data)), 199)
  expect_equal(ncol(tidy_gf_procurement(data)), 3)
})

test_that("primary keys match across time series and fixed data", {
  skip_if_no_data(file_name)
  expect_equal(
    unique(tidy_gf_procurement(data)$country_code),
    unique(tidy_gf_procurement(data)$country_code)
  )
})

test_that("`country_code` entries are not missing", {
  skip_if_no_data(file_name)
  expect_snapshot(
    tidy_gf_procurement(data) |>
      dplyr::distinct(country_code, year) |>
      dplyr::filter(is.na(country_code))
  )
})

