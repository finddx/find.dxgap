skip_if(Sys.getenv("DXGAP_DATADIR") == "")
data_list <- load_dx("tb")
dm <- build_dm(data_list, year = 2019)
data_tbl <- build_tbl(dm, vars = dxgap_const$tb_vars)
tbl <-
  data_tbl |>
  compute_dx_gap() |>
  dplyr::mutate(is_hbc = forcats::as_factor(is_hbc)) |>
  dplyr::select(-any_of(c("year", "country")))

test_that("recipe is as expected", {
  recipe_tb <- tbl |>
    get_recipe_tb(5,.25, dxgap_const$tb_vars) |>
    get_log_recipe_tb()
  expect_snapshot(recipe_tb)
})

test_that("log transformation works for all the variables", {
  out_log <- tbl |>
    dplyr::filter(country_code %in% c("AGO", "BRA", "IND")) |>
    get_recipe_tb(5,.25, dxgap_const$tb_vars) |>
    get_log_recipe_tb() |>
    cook() |>
    dplyr::select(tidyselect::where(is.double)) |>
    dplyr::mutate(dplyr::across(tidyselect::everything(), ~ round(.x, 2))) |>
    constructive::construct(constructive::opts_tbl_df(constructor = "tibble"))
  expect_snapshot(out_log)
})
