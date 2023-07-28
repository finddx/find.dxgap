test_that("World Bank data is downloaded, read and tidied correctly", {
  skip_if(Sys.getenv("FINDTB_DATADIR") == "")
  skip_if_offline()
  skip_if_not_available("https://api.worldbank.org/v2/country/all/indicator")
  path <- download_wb(range_years = "2021:2022")
  expect_true(file.exists(path))
  on.exit(file.remove(path))
  expect_snapshot({
    raw <- read_wb_pop_density(path)
    constructive::construct(vctrs::vec_ptype(raw))
    tidy <- tidy_wb_pop_density(raw)
    constructive::construct(vctrs::vec_ptype(tidy))
  })
})
