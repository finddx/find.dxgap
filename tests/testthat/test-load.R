test_that("load() works", {
  lst_df <- load()
  expect_type(lst_df, "list")
  expect_equal(length(lst_df), 12)
  expect_true(all(purrr::map_int(lst_df, nrow) > 0))
})
