skip_if(Sys.getenv("FINDTB_DATADIR") == "")
file_name <- "tb_find_variable_masterlist.csv"
data <- read_masterlist(file_name)
test_that("a tibble is returned", {
  skip_if_no_data(file_name)
  expect_true(tibble::is_tibble(data))
})

test_that("the tibble dimensions are as expected", {
  skip_if_no_data(file_name)
  expect_equal(nrow(data), 51)
  expect_equal(ncol(data), 6)
})
