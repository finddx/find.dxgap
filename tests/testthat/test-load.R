test_that("findtb_load() works", {
  lst <- findtb_load()
  expect_type(lst, "list")
  expect_equal(length(lst), 10)
  expect_true(all(purrr::map_int(lst, nrow) > 0))
})
