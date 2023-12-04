test_that("check_clean_data_dir() works", {
  data_files <- c(
    "gf_procurement_2023-07-26.csv",
    "gf_procurement_2024-07-26.csv"
  )
  expect_error(check_clean_data_dir(data_files, "\\d{4}-\\d{2}-\\d{2}"))
  data_files <- c(
    "gf_procurement_2023-07-26.csv",
    "gf_procurement_2023-07-26.parquet"
  )
  expect_error(check_clean_data_dir(data_files, "\\d{4}-\\d{2}-\\d{2}"))
})
