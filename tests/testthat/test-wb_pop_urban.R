test_that("World Bank urban population data is downloaded correctly", {
  skip_on_ci()
  skip_if_not_installed("curl")
  skip_if_offline()
  skip_if_not_available("https://api.worldbank.org/v2/country/all/.indicator")
  path <- download_wb_impl(.indicator = "SP.URB.TOTL.IN.ZS", .range_years = "2021:2022")
  on.exit(file.remove(path), add = TRUE)
  expect_true(file.exists(path))
})

test_that("World Bank urban population data is read and tidied correctly", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  path <- file.path(Sys.getenv("DXGAP_DATADIR"), "wb_2023-07-28_pop_urban.csv")
  skip_if(!file.exists(path))
  raw <- read_wb(path)
  tidy <- tidy_wb(raw)
  expect_snapshot({
    constructive::construct(vctrs::vec_ptype(raw))
    constructive::construct(vctrs::vec_ptype(tidy))
  })
  expect_snapshot(
    tidy |>
      dplyr::distinct(country_code, country_value) |>
      dplyr::filter(is.na(country_code))
  )
})

