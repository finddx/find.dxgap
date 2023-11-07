skip_if(Sys.getenv("DXGAP_DATADIR") == "")
df_lst <- load_dx()
dm <- build_dm(df_lst, year = 2019)
data_tbl <- build_tbl(dm, vars = dxgap_constants$tb_vars)
tbl <-
  data_tbl |>
  compute_dx_gap() |>
  dplyr::mutate(is_hbc = forcats::as_factor(is_hbc)) |>
  dplyr::select(-any_of(c("year", "country")))
test_that("run_mod() works", {
  withr::local_seed(2023)
  preproc_list <- get_mod_preproc(
    .tbl = tbl,
    .neighbors = tb_mod_const$neighbors,
    .threshold = tb_mod_const$threshold,
    .impute_vars = tb_mod_const$impute_vars
  )
  mod_list <- get_mod_mod(tb_mod_const$mode, tb_mod_const$engine)
  mod_objects <- run_mod(tbl, preproc = preproc_list, mod = mod_list)
  expect_snapshot(mod_objects)
})
