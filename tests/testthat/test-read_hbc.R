file_name <- "high_tb_burden_countries_2021.docx"
data <- read_hbc(file_name)
test_that("a tibble is returned", {
  skip_if_no_data(file_name)
  expect_true(tibble::is_tibble(data))
})

test_that("the tibble dimensions are as expected", {
  skip_if_no_data(file_name)
  expect_equal(nrow(data), 34)
  expect_equal(ncol(data), 6)
})
