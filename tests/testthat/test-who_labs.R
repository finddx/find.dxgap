test_that("WHO labs data is downloaded, read and tidied correctly", {
  skip_if(Sys.getenv("FINDTB_DATADIR") == "")
  skip_if_offline()
  skip_if_not_available("https://extranet.who.int/tme/generateCSV.asp?ds=labs")
  path <- download_who(dataset = "laboratories")
  expect_true(file.exists(path))
  on.exit(file.remove(path))
  expect_snapshot({
    raw <- read_who(path)
    constructive::construct(vctrs::vec_ptype(raw))
    tidy <- tidy_who(raw)
    constructive::construct(vctrs::vec_ptype(tidy))
  })
})