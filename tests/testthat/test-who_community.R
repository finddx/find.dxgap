test_that("WHO community data is downloaded correctly", {
  skip_on_ci()
  skip_if_not_installed("curl")
  skip_if_offline()
  skip_if_not_available("https://extranet.who.int/tme/generateCSV.asp?ds=community")
  path <- download_who_impl(.url_endpoint = "community")
  on.exit(file.remove(path), add = TRUE)
  expect_true(file.exists(path))
})

test_that("WHO community data is read and tidied correctly", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  path <- file.path(Sys.getenv("DXGAP_DATADIR"), "who_community_2023-07-28.csv")
  skip_if(!file.exists(path))
  raw <- read_who(path)
  tidy <- tidy_who(raw)
  expect_snapshot({
    constructive::construct(vctrs::vec_ptype(raw))
    constructive::construct(vctrs::vec_ptype(tidy))
  })

  expect_snapshot(
    tidy |>
      dplyr::distinct(country_code) |>
      dplyr::filter(is.na(country_code))
  )
})
