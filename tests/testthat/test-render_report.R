test_that("render_report_impl() works", {
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  render_report_impl_local <- function() {
    path <- render_report_impl(
      "test.Rmd",
      disease = "tb",
      year = 2019,
      estimated = NULL,
      notified = NULL,
      interactive = FALSE,
      vars = c("country_code", "year", "pop_density", "c_newinc", "e_inc_num"),
      template_dir = testthat::test_path("testdata"),
      override_vars_check = TRUE
    )
    withr::defer_parent(unlink(path))
    invisible(path)
  }
  path <- render_report_impl_local()
  expect_true(file.exists(path))
})
