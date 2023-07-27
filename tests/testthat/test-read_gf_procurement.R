skip_if(Sys.getenv("FINDTB_DATADIR") == "")
file_name <- "global_fund_procurement_tidy_20230726.csv"
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
