test_that("a tibble is returned", {
  expect_true(tibble::is_tibble(read_tb_dashboard()))
})

test_that("the tibble dimensions are as expected", {
  expect_equal(nrow(read_tb_dashboard()), 44)
  expect_equal(ncol(read_tb_dashboard()), 89)
})
