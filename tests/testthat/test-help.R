test_that("compose_file_path() works", {
  path <- compose_file_path("my_file.csv", "my_data_dir/data")
  expect_identical(path, "my_data_dir/data/my_file.csv")
  expect_error(compose_file_path("my_file.csv", c("my_data_dir/data", "b")))
  expect_error(compose_file_path(c("my_file.csv", "a"), "my_data_dir/data"))
})
