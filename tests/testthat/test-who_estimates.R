skip_if(Sys.getenv("FINDTB_DATADIR") == "")
skip_if_offline()
skip_if_not_available("https://extranet.who.int/tme/generateCSV.asp?ds=estimates")
path <- download_who(dataset = "estimates")
on.exit(file.remove(path), add = TRUE)
raw <- read_who(path)
tidy <- tidy_who(raw)
test_that("WHO estimates data is downloaded correctly", {
  expect_true(file.exists(path))
})

test_that("WHO estimates data is read and tidied correctly", {
  expect_snapshot({
    constructive::construct(vctrs::vec_ptype(raw))
    constructive::construct(vctrs::vec_ptype(tidy))
  })
})

test_that("`country_code` entries are not missing", {
  expect_snapshot(
    tidy |>
      dplyr::distinct(country_code, country) |>
      dplyr::filter(is.na(country_code))
  )
})