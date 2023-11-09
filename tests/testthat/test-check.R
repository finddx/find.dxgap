test_that("check_clean_data_dir() works", {
  data_files <- c(
    "gf_2023-07-26_procurement.csv",
    "gf_2024-07-26_procurement.csv"
  )
  expect_error(check_clean_data_dir(data_files, "\\d{4}-\\d{2}-\\d{2}"))
  data_files <- c(
    "gf_2023-07-26_procurement.csv",
    "gf_2023-07-26_procurement.parquet"
  )
  expect_error(check_clean_data_dir(data_files, "\\d{4}-\\d{2}-\\d{2}"))
})
