test_that("get_cc_var_always_given_acrs_yrs() works", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  data_list <- load_dx("tb")
  who_notifications <- data_list$who_notifications
  core_df <-
    who_notifications |>
    get_cc_var_always_given_acrs_yrs(c_newinc)
  numb_na <-
    who_notifications |>
    dplyr::filter(year >= dxgap_const$start_year) |>
    dplyr::semi_join(core_df, dplyr::join_by(country_code)) |>
    dplyr::filter(is.na(c_newinc)) |>
    dplyr::count() |>
    dplyr::pull()
  expect_equal(numb_na, 0)
})

test_that("get_core() works", {
  skip_on_ci()
  skip_if(Sys.getenv("DXGAP_DATADIR") == "")
  data_list <- load_dx("tb")
  expect_type(
    get_core(
      data_list,
      estimated = "who_estimates.e_inc_num",
      notified = "who_notifications.c_newinc"
    ),
    "list"
  )
})
