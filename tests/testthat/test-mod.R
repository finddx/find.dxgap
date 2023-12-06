test_that("run_mod() works", {
  skip_on_ci()
  withr::local_seed(2023)
  testdata_path <- testthat::test_path("testdata", "tb_tbl.rds")
  tb_tbl <- readr::read_rds(testdata_path)
  tb_tbl_prep <- prep_tb_data(tb_tbl)
  preproc_list <- get_mod_preproc(
    .tbl = tb_tbl_prep,
    .neighbors = tb_mod_const$neighbors,
    .threshold = tb_mod_const$threshold,
    .impute_with = tb_mod_const$impute_vars
  )
  mod_list <- get_mod_mod(tb_mod_const$mode, tb_mod_const$engine)
  mod_objects <- run_mod(
    tb_tbl_prep,
    preproc = preproc_list,
    mod = mod_list,
    folds = tb_mod_const$folds,
    metrics = tb_mod_const$metrics,
    rank_metric = tb_mod_const$rank_metric,
  )
  expect_snapshot(mod_objects)
})
