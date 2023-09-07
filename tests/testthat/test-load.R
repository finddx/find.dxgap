test_that("findtb_load() works", {
  lst_df <- findtb_load()
  expect_type(lst_df, "list")
  expect_equal(length(lst_df), 10)
  expect_true(all(purrr::map_int(lst_df, nrow) > 0))
})
