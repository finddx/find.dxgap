test_that("WHO notifications data is downloaded, read and tidied correctly", {
  skip_if(Sys.getenv("FINDTB_DATADIR") == "")
  skip_if_offline()
  skip_if_not_available("https://extranet.who.int/tme/generateCSV.asp?ds=notifications")
  path <- download_who(dataset = "notification")
  expect_true(file.exists(path))
  on.exit(file.remove(path))
  expect_snapshot({
    raw <- read_who(path)
    constructive::construct(vctrs::vec_ptype(raw))
    tidy <- tidy_who(raw)
    constructive::construct(vctrs::vec_ptype(tidy))
  })
})

test_that("WHO estimates data is downloaded, read and tidied correctly", {
  skip_if(Sys.getenv("FINDTB_DATADIR") == "")
  skip_if_offline()
  skip_if_not_available("https://extranet.who.int/tme/generateCSV.asp?ds=estimates")
  path <- download_who(dataset = "estimates")
  expect_true(file.exists(path))
  on.exit(file.remove(path))
  expect_snapshot({
    raw <- read_who(path)
    constructive::construct(vctrs::vec_ptype(raw))
    tidy <- tidy_who(raw)
    constructive::construct(vctrs::vec_ptype(tidy))
  })
})

test_that("WHO budget data is downloaded, read and tidied correctly", {
  skip_if(Sys.getenv("FINDTB_DATADIR") == "")
  skip_if_offline()
  skip_if_not_available("https://extranet.who.int/tme/generateCSV.asp?ds=budget")
  path <- download_who(dataset = "budget")
  expect_true(file.exists(path))
  on.exit(file.remove(path))
  expect_snapshot({
    raw <- read_who(path)
    constructive::construct(vctrs::vec_ptype(raw))
    tidy <- tidy_who(raw)
    constructive::construct(vctrs::vec_ptype(tidy))
  })
})

test_that("WHO community data is downloaded, read and tidied correctly", {
  skip_if(Sys.getenv("FINDTB_DATADIR") == "")
  skip_if_offline()
  skip_if_not_available("https://extranet.who.int/tme/generateCSV.asp?ds=community")
  path <- download_who(dataset = "community_engagement")
  expect_true(file.exists(path))
  on.exit(file.remove(path))
  expect_snapshot({
    raw <- read_who(path)
    constructive::construct(vctrs::vec_ptype(raw))
    tidy <- tidy_who(raw)
    constructive::construct(vctrs::vec_ptype(tidy))
  })
})

test_that("WHO expenditures data is downloaded, read and tidied correctly", {
  skip_if(Sys.getenv("FINDTB_DATADIR") == "")
  skip_if_offline()
  skip_if_not_available("https://extranet.who.int/tme/generateCSV.asp?ds=expenditure_utilisation")
  path <- download_who(dataset = "expenditure_and_utilisation")
  expect_true(file.exists(path))
  on.exit(file.remove(path))
  expect_snapshot({
    raw <- read_who(path)
    constructive::construct(vctrs::vec_ptype(raw))
    tidy <- tidy_who(raw)
    constructive::construct(vctrs::vec_ptype(tidy))
  })
})

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
