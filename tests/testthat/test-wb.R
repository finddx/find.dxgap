skip_if(Sys.getenv("FINDTB_DATADIR") == "")
skip_if_offline()
skip_if_not_available("https://api.worldbank.org/v2/country/all/indicator")
path <- download_wb(range_years = "2021:2022")
on.exit(file.remove(path))
raw <- read_wb_pop_density(path)
tidy <- tidy_wb_pop_density(raw)
test_that("World Bank data is downloaded correctly", {
  expect_true(file.exists(path))
})

test_that("World Bank data is read and tidied correctly", {
  expect_snapshot({
    constructive::construct(vctrs::vec_ptype(raw))
    constructive::construct(vctrs::vec_ptype(tidy))
  })
})
