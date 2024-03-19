test_that("get_cc_var_always_given_acrs_yrs() works", {
  df1 <-
    tibble::tibble(
      country_code = rep(c("FRA", "ITA", "CHE"), 3),
      year = c(2016, 2016, 2016, 2017, 2017, 2017, 2018, 2018, 2018),
      var = rep(1, 3 * 3)
    )
  out <- get_cc_var_always_given_acrs_yrs(df1, var, year_range = 2016:2018)
  expect_equal(out$country_code, c("FRA", "ITA", "CHE"))

  df2 <-
    tibble::tibble(
      country_code = rep(c("FRA", "ITA", "CHE"), 3),
      year = c(2016, 2016, 2016, 2017, 2017, 2017, 2018, 2018, 2018),
      var = c(NA, 1, 1, 1, 1, 1, 1, 1, 1)
    )
  out <- get_cc_var_always_given_acrs_yrs(df2, var, year_range = 2016:2018)
  expect_equal(out$country_code, c("ITA", "CHE"))

  df3 <-
    tibble::tibble(
      country_code = rep(c("FRA", "ITA", "CHE"), 3),
      year = c(2016, 2016, 2016, 2017, 2017, 2017, 2018, 2018, 2018),
      var = c(NA, 1, 1, 1, NA, 1, 1, 1, NA)
    )
  out <- get_cc_var_always_given_acrs_yrs(df3, var, year_range = 2016:2018)
  expect_equal(out$country_code, character(0))

  df4 <-
    tibble::tibble(
      country_code = rep(c("FRA", "ITA", "CHE"), 3),
      year = c(2016, 2016, 2016, 2017, 2017, 2017, 2018, 2018, 2018),
      var = c(NA, NA, NA, 1, 1, 1, 1, 1, 1)
    )
  out <- get_cc_var_always_given_acrs_yrs(df4, var, year_range = 2016:2018)
  expect_equal(out$country_code, character(0))

  df5 <-
    tibble::tibble(
      country_code = rep(c("FRA", "ITA", "CHE"), 3),
      year = c(2016, 2016, 2016, 2017, 2017, 2017, 2018, 2018, 2018),
      var = c(NA, NA, NA, 1, 1, 1, 1, 1, 1)
    )
  out <- get_cc_var_always_given_acrs_yrs(df5, var, year_range = 2017:2018)
  expect_equal(out$country_code, c("FRA", "ITA", "CHE"))

  df6 <-
    tibble::tibble(
      country_code = rep(c("FRA", "ITA", "CHE"), 3),
      year = c(2016, 2016, 2016, 2017, 2017, 2017, 2018, 2018, 2018),
      var = c(1, 1, 1, 1, NA, 1, 1, 1, 1)
    )
  out <- get_cc_var_always_given_acrs_yrs(df6, var, year_range = 2016:2018)
  expect_equal(out$country_code, c("FRA", "CHE"))

  df7 <-
    tibble::tibble(
      country_code = rep(c("FRA", "ITA", "CHE"), 3),
      year = c(2016, 2016, 2016, 2017, 2017, 2017, 2018, 2018, 2018),
      var = c(1, 1, 1, 1, NA, 1, 1, 1, 1)
    )
  out <- get_cc_var_always_given_acrs_yrs(df7, var, year_range = 2018)
  expect_equal(out$country_code, c("FRA", "ITA", "CHE"))

  df8 <-
    tibble::tibble(
      country_code = rep(c("FRA", "ITA", "CHE"), 4),
      year = c(rep(2016, 3), rep(2017, 3), rep(2018, 3), rep(2019, 3)),
      var = c(1, 1, 1, 1, NA, 1, 1, 1, 1, 1, 1, 1)
    )
  out <- get_cc_var_always_given_acrs_yrs(df8, var, year_range = 2018:2019)
  expect_equal(out$country_code, c("FRA", "ITA", "CHE"))

  df9 <-
    tibble::tibble(
      country_code = rep(c("FRA", "ITA", "CHE"), 4),
      year = c(rep(2016, 3), rep(2017, 3), rep(2018, 3), rep(2019, 3)),
      var = c(1, 1, 1, 1, NA, 1, 1, 1, 1, 1, 1, 1)
    )
  out <- get_cc_var_always_given_acrs_yrs(df8, var, year_range = 2017:2019)
  expect_equal(out$country_code, c("FRA", "CHE"))
})

test_that("get_cc_var_always_given_acrs_yrs() works", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  data_list <- build_lst("tb")
  who_notifications <- data_list$who_notifications
  core_df <-
    who_notifications |>
    get_cc_var_always_given_acrs_yrs(c_newinc, year_range = extract_supported_year("tb"))
  year_range <- extract_supported_year("tb")
  numb_na <-
    who_notifications |>
    dplyr::filter(dplyr::between(year, min(year_range), max(year_range))) |>
    dplyr::semi_join(core_df, dplyr::join_by(country_code)) |>
    dplyr::filter(is.na(c_newinc)) |>
    dplyr::count() |>
    dplyr::pull()
  expect_equal(numb_na, 0)
})

test_that("get_core() works", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  data_list <- build_lst("tb")
  expect_type(
    get_core(
      data_list,
      estimated = "who_estimates.e_inc_num",
      notified = "who_notifications.c_newinc",
      year = NULL
    ),
    "list"
  )
})
