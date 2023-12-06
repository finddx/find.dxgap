test_that("import_tbl() works with any table", {
  skip_on_ci()
  tbl <- import_tbl("gf_procurement_2023-07-26.csv")
  expect_s3_class(tbl, "data.frame")

  tbl <- import_tbl("wb_pop_urban_2023-07-28.csv")
  expect_s3_class(tbl, "data.frame")

  tbl <- import_tbl("wb_pop_total_2023-08-31.csv")
  expect_s3_class(tbl, "data.frame")

  tbl <- import_tbl("wb_gdp_2023-09-07.csv")
  expect_s3_class(tbl, "data.frame")

  tbl <- import_tbl("wb_pop_density_2023-10-04.csv")
  expect_s3_class(tbl, "data.frame")

  tbl <- import_tbl("who_budget_2023-07-28.csv")
  expect_s3_class(tbl, "data.frame")

  tbl <- import_tbl("who_community_2023-07-28.csv")
  expect_s3_class(tbl, "data.frame")

  tbl <- import_tbl("who_estimates_2023-07-28.csv")
  expect_s3_class(tbl, "data.frame")

  tbl <- import_tbl("who_expenditures_2023-07-28.csv")
  expect_s3_class(tbl, "data.frame")

  tbl <- import_tbl("who_hbc_2023-07-28.csv")
  expect_s3_class(tbl, "data.frame")

  tbl <- import_tbl("who_laboratories_2023-08-30.csv")
  expect_s3_class(tbl, "data.frame")

  tbl <- import_tbl("who_notifications_2023-11-28.csv")
  expect_s3_class(tbl, "data.frame")
})

test_that("extract_name strips any file extension", {
  expect_equal(extract_name("who_estimates_2023-07-28.csv"), "who_estimates")
  expect_equal(extract_name("who_2023-07-28_estimates.xlsx"), "who_estimates")
})