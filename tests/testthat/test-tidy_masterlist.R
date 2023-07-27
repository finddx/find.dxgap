skip_if(Sys.getenv("FINDTB_DATADIR") == "")
file_name <- "tb_find_variable_masterlist.csv"
data <- read_masterlist(file_name)
test_that("a tibble is returned", {
  skip_if_no_data(file_name)
  expect_true(tibble::is_tibble(tidy_masterlist(data)))
})

test_that("the tibble dimensions are as expected", {
  skip_if_no_data(file_name)
  expect_equal(nrow(tidy_masterlist(data)), 40)
  expect_equal(ncol(tidy_masterlist(data)), 7)
})

test_that("primary keys match across time series and fixed data", {
  skip_if_no_data(file_name)
  expect_equal(
    unique(tidy_masterlist(data)$variable_name),
    unique(tidy_masterlist(data)$variable_name)
  )
})
