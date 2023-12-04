skip_on_ci()
skip_if(Sys.getenv("DXGAP_DATADIR") == "")
file_name <- "who_hbc_2023-07-28.csv"
data <- read_who_hbc(file_name)
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
  expect_true(tibble::is_tibble(tidy_who_hbc(data)))
})

test_that("the tibble dimensions are as expected", {
  skip_if_no_data(file_name)
  expect_equal(nrow(tidy_who_hbc(data)), 300)
  expect_equal(ncol(tidy_who_hbc(data)), 4)
})

test_that("primary key", {
  skip_if_no_data(file_name)
  df <- tidy_who_hbc(data)
  expect_null(dm::check_key(df, country_code, year))
})

test_that("`country_code` entries are not missing", {
  skip_if_no_data(file_name)
  expect_snapshot(
    tidy_who_hbc(data) |>
      dplyr::distinct(country_code, country) |>
      dplyr::filter(is.na(country_code))
  )
})

test_that("primary key for given year", {
  skip_if_no_data(file_name)
  df_lst <- purrr::map(2018:2023, ~ tidy_who_hbc(data, .year = .x))
  check_pk <- purrr::map(df_lst, ~ dm::check_key(.x, country_code, year))
  expect_null(unlist(check_pk))
})
