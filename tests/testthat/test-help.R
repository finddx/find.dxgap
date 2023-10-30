test_that("compose_file_path() works", {
  path <- compose_file_path("my_file.csv", "my_data_dir/data")
  expect_identical(path, "my_data_dir/data/my_file.csv")
  expect_error(compose_file_path("my_file.csv", c("my_data_dir/data", "b")))
  expect_error(compose_file_path(c("my_file.csv", "a"), "my_data_dir/data"))
})

test_that("extract_name() works", {
  path_a <- "/Users/a_user/find.dxgap.data/who_hbc.csv"
  expect_identical(extract_name(path_a), "who_hbc")
  path_b <- "/Users/a_user/find.dxgap.data/wb_2023-08-31_pop_total.csv"
  expect_identical(extract_name(path_b), "wb_pop_total")
  file_name <- "wb_2023-08-31_pop_total.csv"
  expect_identical(extract_name(file_name), "wb_pop_total")
})
