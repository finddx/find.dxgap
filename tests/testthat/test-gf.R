skip_if(Sys.getenv("FINDTB_DATADIR") == "")
file_name <- "gf_2023-07-26_procurement.csv"
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
  expect_equal(nrow(tidy_gf_procurement(data)), 1677)
  expect_equal(ncol(tidy_gf_procurement(data)), 27)
})

test_that("primary keys match across time series and fixed data", {
  skip_if_no_data(file_name)
  expect_equal(
    unique(tidy_gf_procurement(data)$country_territory),
    unique(tidy_gf_procurement(data)$country_territory)
  )
})

test_that("`country_code` entries are not missing", {
  skip_if_no_data(file_name)
  expect_snapshot(
    tidy_gf_procurement(data) |>
      dplyr::distinct(country_code, country_territory) |>
      dplyr::filter(is.na(country_code))
  )
})
