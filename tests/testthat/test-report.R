test_that("render_report() works", {
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  path <- render_report(
    "test.Rmd",
    .disease = "tb",
    .year = 2019,
    interactive = FALSE,
    template_dir = here::here("inst/template")
  )
  expect_true(file.exists(path))
  on.exit(unlink(path))
})
