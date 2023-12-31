test_that("load_dx() works", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  lst_df <- load_dx(disease = "tb")
  expect_type(lst_df, "list")
  expect_equal(length(lst_df), 12)
  expect_true(all(purrr::map_int(lst_df, nrow) > 0))
  expect_error(load_dx(disease = "covid"))
})
