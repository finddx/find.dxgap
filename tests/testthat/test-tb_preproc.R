test_that("recipe is as expected", {
  testdata_path <- testthat::test_path("testdata", "tb_tbl.rds")
  tb_tbl <- readr::read_rds(testdata_path)
  tb_tbl_prep <- prep_tb_data(tb_tbl, e_inc_num, c_newinc)
  recipe_tb <- tb_tbl_prep |>
    get_recipe_tb(5,.25, extract_vars("tb")) |>
    get_log_recipe_tb()
  expect_snapshot(recipe_tb)
})

test_that("log transformation works for all the variables", {
  testdata_path <- testthat::test_path("testdata", "tb_tbl.rds")
  tb_tbl <- readr::read_rds(testdata_path)
  tb_tbl_prep <- prep_tb_data(tb_tbl, e_inc_num, c_newinc)
  out_log <- tb_tbl_prep |>
    dplyr::filter(country_code %in% c("AGO", "BRA", "IND")) |>
    get_recipe_tb(5,.25, extract_vars("tb")) |>
    get_log_recipe_tb() |>
    cook() |>
    dplyr::select(tidyselect::where(is.double)) |>
    dplyr::mutate(dplyr::across(tidyselect::everything(), ~ round(.x, 2))) |>
    constructive::construct(constructive::opts_tbl_df(constructor = "tibble"))
  expect_snapshot(out_log)
})
