skip_if(Sys.getenv("FINDTB_DATADIR") == "")
file_name <- "high_tb_burden_countries_2021.docx"
data <- read_hbc(file_name)
test_that("a tibble is returned", {
  skip_if_no_data(file_name)
  expect_true(tibble::is_tibble(tidy_hbc(data)))
})

test_that("the tibble dimensions are as expected", {
  skip_if_no_data(file_name)
  expect_equal(nrow(tidy_hbc(data)), 30)
  expect_equal(ncol(tidy_hbc(data)), 3)
})

test_that("primary keys match across time series and fixed data", {
  skip_if_no_data(file_name)
  expect_equal(
    unique(tidy_hbc(data)$country),
    unique(tidy_hbc(data)$country)
  )
})
