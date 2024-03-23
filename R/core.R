#' Get core countries
#' @noRd
#' @param data_list A list of tibbles as returned by `build_lst()`.
#' @examples \dontrun{
#' get_core(
#'   build_lst("tb"),
#'   estimated = "who_estimates.e_inc_num",
#'   notified = "who_notifications.c_newinc",
#'   year = 2019
#' )
#' get_core(
#'   build_lst("tb"),
#'   estimated = "who_estimates.e_inc_num",
#'   notified = "who_notifications.c_newinc",
#'   year = NULL
#' )
#' get_core(
#'   build_lst("tb"),
#'   estimated = "who_estimates.e_inc_num",
#'   notified = "who_notifications.c_newinc",
#'   year = 2019:2021
#' )
#' get_core(
#'   build_lst("tb"),
#'   estimated = "who_estimates.e_inc_num",
#'   notified = "who_notifications.c_newinc",
#'   year = 2014:2017
#' )
#' get_core(
#'   build_lst("tb"),
#'   estimated = "who_estimates.e_inc_num",
#'   notified = "who_notifications.c_newinc",
#'   year = 2013:2014
#' )
#' }
get_core <- function(data_list, estimated, notified, year) {
  # "core countries" satisfy the followings at the same time:
  # * dx_gap can always be computed (we don't get NA, Inf)
  # * the high-burden countries is the common subset in case the year range
  # selected by the user spans across two 5-years period

  disease <- attr(data_list, "disease")
  if (is.null(year)) {
    year <- extract_supported_year(disease = disease)
  }
  year <- check_supported_year(year = year, disease = disease)

  dxgap_meta_df <- get_meta_dxgap(estimated = estimated, notified = notified)

  estimated_tbl_name <- extract_tbl_name(dxgap_meta_df, "estimated")
  estimated_field_name <- extract_field_name(dxgap_meta_df, "estimated")
  notified_tbl_name <- extract_tbl_name(dxgap_meta_df, "notified")
  notified_field_name <- extract_field_name(dxgap_meta_df, "notified")

  # Countries "can compute dx_gap" in given year range -------------------------

  cc_notification_df <-
    data_list |>
    purrr::pluck(notified_tbl_name) |>
    get_cc_var_always_given_acrs_yrs(
      !!rlang::ensym(notified_field_name),
      year_range = year
    )

  check_valid_core_subset(cc_notification_df, var = notified_field_name, year = year)

  cc_estimate_df <-
    data_list |>
    purrr::pluck(estimated_tbl_name) |>
    dplyr::filter(!!rlang::ensym(estimated_field_name) != 0) |> # avoid dividing by zero
    get_cc_var_always_given_acrs_yrs(
      !!rlang::ensym(estimated_field_name),
      year_range = year
    )

  check_valid_core_subset(cc_estimate_df, var = estimated_field_name, year = year)

  cc_can_compute_dxgap <-
    cc_notification_df |>
    dplyr::inner_join(cc_estimate_df, dplyr::join_by(country_code))

  # Countries consistently "HBC" in given year range ---------------------------

  cc_consistent_hbc <-
    data_list$who_hbc |>
    dplyr::filter(dplyr::between(year, min(!!year), max(!!year))) |>
    get_cc_always_given_acrs_yrs()

  core_hbc_df <-
    data_list$who_hbc |>
    dplyr::semi_join(cc_consistent_hbc, by = dplyr::join_by(country_code)) |>
    dplyr::semi_join(cc_can_compute_dxgap, by = dplyr::join_by(country_code)) |>
    dplyr::filter(dplyr::between(year, min(!!year), max(!!year))) |>
    dplyr::arrange(country_code, year) |>
    dplyr::transmute(
      year,
      country_code,
      is_hbc = 1
    )

  len_yr_range <-
    core_hbc_df |>
    dplyr::reframe(n_yr = dplyr::n_distinct(year), .by = country_code) |>
    dplyr::distinct(n_yr) |>
    dplyr::pull()

  stopifnot(length(len_yr_range) == 1)
  stopifnot(nrow(cc_consistent_hbc) * len_yr_range == nrow(core_hbc_df))

  data_list$who_hbc <- NULL

  # create parent table "country"
  cc_core_df <-
    cc_can_compute_dxgap |>
    dplyr::bind_rows(cc_consistent_hbc) |>
    tidyr::crossing(year = as.numeric(year))

  is_hbc <-
    cc_core_df |>
    dplyr::left_join(
      dplyr::distinct(core_hbc_df, country_code, is_hbc),
      by = dplyr::join_by(country_code)
    ) |>
    dplyr::mutate(is_hbc = dplyr::coalesce(is_hbc, 0)) |>
    dplyr::distinct(country_code, is_hbc)

  # Filter all tables to make them "core" --------------------------------------

  cc_core_df_filter <-
    cc_core_df |>
    dplyr::distinct(country_code)

  core_df <-
    data_list |>
    to_nest_df() |>
    dplyr::mutate(
      data_range_yr = purrr::map(
        data,
        ~ dplyr::filter(.x, dplyr::between(year, min(!!year), max(!!year)))
      )
    ) |>
    dplyr::mutate(
      data_core = purrr::map(
        data_range_yr,
        ~ dplyr::semi_join(.x, cc_core_df_filter, dplyr::join_by(country_code)),
      )
    ) |>
    dplyr::select(name, data_core)

  # Return list of tables for dm -----------------------------------------------

  core_lst <- core_df$data_core
  names(core_lst) <- core_df$name
  core_lst$country <- cc_core_df
  core_lst$hbc <- is_hbc
  core_lst
}


get_cc_always_given_acrs_yrs <- function(data) {
  data |>
    dplyr::select(country_code, year) |>
    dplyr::group_split(year, .keep = FALSE) |>
    purrr::reduce(dplyr::inner_join, by = dplyr::join_by(country_code))
}


get_cc_var_always_given_acrs_yrs <- function(data, var, year_range) {
  data |>
    dplyr::filter(dplyr::between(year, min(year_range), max(year_range))) |>
    dplyr::mutate(is_given = !is.na({{ var }})) |>
    dplyr::select(country_code, year, is_given) |>
    dplyr::group_split(year, .keep = FALSE) |>
    purrr::reduce(dplyr::inner_join, by = dplyr::join_by(country_code, is_given)) |>
    dplyr::filter(is_given) |>
    dplyr::select(country_code)
}
