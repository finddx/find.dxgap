skip_if(Sys.getenv("FINDTB_DATADIR") == "")
file_name <- "who_hbc.csv"
data <- read_hbc(file_name)
test_that("a tibble is returned", {
  skip_if_no_data(file_name)
  expect_true(tibble::is_tibble(data))
})

test_that("the tibble dimensions are as expected", {
  skip_if_no_data(file_name)
  expect_equal(nrow(data), 60)
  expect_equal(ncol(data), 3)
})

test_that("a tibble is returned", {
  skip_if_no_data(file_name)
  expect_true(tibble::is_tibble(tidy_hbc(data)))
})

test_that("the tibble dimensions are as expected", {
  skip_if_no_data(file_name)
  expect_equal(nrow(tidy_hbc(data)), 60)
  expect_equal(ncol(tidy_hbc(data)), 4)
})

test_that("primary keys match across time series and fixed data", {
  skip_if_no_data(file_name)
  expect_equal(
    unique(tidy_hbc(data)$country),
    unique(tidy_hbc(data)$country)
  )
})

test_that("`country_code` entries are not missing", {
  skip_if_no_data(file_name)
  expect_snapshot(
    tidy_hbc(data) |>
      dplyr::distinct(country_code, country) |>
      dplyr::filter(is.na(country_code))
  )
})
