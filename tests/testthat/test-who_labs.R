test_that("WHO labs data is downloaded correctly", {
  skip_on_ci()
  skip_if_not_installed("curl")
  skip_if_offline()
  skip_if_not_available("https://extranet.who.int/tme/generateCSV.asp?ds=labs")
  path <- download_who_impl(.url_endpoint = "labs")
  on.exit(file.remove(path), add = TRUE)
  expect_true(file.exists(path))
})

test_that("WHO labs data is read and tidied correctly", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  path <- file.path(Sys.getenv("DXGAP_DATADIR"), "who_laboratories_2023-08-30.csv")
  skip_if(!file.exists(path))
  raw <- read_who(path)
  tidy <- tidy_who(raw)
  expect_snapshot({
    constructive::construct(vctrs::vec_ptype(raw))
    constructive::construct(vctrs::vec_ptype(tidy))
  })
  
  expect_snapshot(
    tidy |>
      dplyr::distinct(country_code, country) |>
      dplyr::filter(is.na(country_code))
  )
})
