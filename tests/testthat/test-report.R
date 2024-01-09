test_that("render_report() works", {
  skip("Move test.Rmd in a suitable dir for testing")
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  path <- render_report(
    "test.Rmd",
    disease = "tb",
    year = 2019,
    interactive = FALSE
  )
  expect_true(file.exists(path))
  on.exit(unlink(path))
})
