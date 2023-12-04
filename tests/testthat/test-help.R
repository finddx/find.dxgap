test_that("compose_file_path() works", {
  path <- compose_file_path("my_file.csv", "my_data_dir/data")
  expect_identical(path, "my_data_dir/data/my_file.csv")
  expect_error(compose_file_path("my_file.csv", c("my_data_dir/data", "b")))
  expect_error(compose_file_path(c("my_file.csv", "a"), "my_data_dir/data"))
})

test_that("extract_name() works", {
  path_a <- "/Users/a_user/find.dxgap.data/who_hbc_2023-07-28.csv"
  expect_identical(extract_name(path_a), "who_hbc")
  path_b <- "/Users/a_user/find.dxgap.data/wb_pop_total_2023-08-31.csv"
  expect_identical(extract_name(path_b), "wb_pop_total")
  file_name <- "wb_pop_total_2023-08-31.csv"
  expect_identical(extract_name(file_name), "wb_pop_total")
})

test_that("is_significant() works", {
  withr::with_seed(
    2023,
    code = {
      p_value_df <- tibble::tibble(
        p.value = round(rnorm(10, mean = 0.5, sd = 1), 3)
      )
      expect_snapshot(
        constructive::construct(
          mutate_is_significant(p_value_df, 0.25),
          constructive::opts_tbl_df(constructor = "tribble")
        )
      )
      expect_snapshot(
        constructive::construct(
          mutate_is_significant(p_value_df, 0.5),
          constructive::opts_tbl_df(constructor = "tribble"))
      )
    }
  )
})
