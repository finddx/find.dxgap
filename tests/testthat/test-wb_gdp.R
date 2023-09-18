skip_if(Sys.getenv("DXGAP_DATADIR") == "")
skip_if_offline()
skip_if_not_available("https://api.worldbank.org/v2/country/all/indicator")
path <- download_wb(indicator = "NY.GDP.MKTP.CD", range_years = "2021:2022")
on.exit(file.remove(path))
raw <- read_wb(path)
tidy <- tidy_wb(raw)
test_that("World Bank data is downloaded correctly", {
  expect_true(file.exists(path))
})

test_that("World Bank data is read and tidied correctly", {
  expect_snapshot({
    constructive::construct(vctrs::vec_ptype(raw))
    constructive::construct(vctrs::vec_ptype(tidy))
  })
})

test_that("`country_code` entries are not missing", {
  expect_snapshot(
    tidy |>
      dplyr::distinct(country_code, country_value) |>
      dplyr::filter(is.na(country_code))
  )
})
