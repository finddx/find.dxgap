#' @example \dontrun{get_core(load())}
get_core <- function(data_list) {
  country_notification_df <-
    data_list$who_notifications |>
    get_cc_var_always_given_acrs_yrs(c_newinc)

  country_estimate_df <-
    data_list$who_estimates |>
    get_cc_var_always_given_acrs_yrs(e_inc_num)

  in_common_dxgap <-
    country_notification_df |>
    dplyr::inner_join(country_estimate_df, dplyr::join_by(country_code))
  subset_df <-
    to_nest_df(data_list) |>
    dplyr::mutate(
      data2 = dplyr::if_else(
        name == "hbc",
        purrr::map(data, get_cc_always_given_acrs_yrs),
        data
      )
    ) |>
    dplyr::mutate(in_common_dxgap = list(in_common_dxgap)) |>
    dplyr::mutate(can_compute_dx_gap = map2(
      data2,
      in_common_dxgap,
      dplyr::inner_join,
      dplyr::join_by(country_code)
      )
    ) |>
    dplyr::select(name, can_compute_dx_gap)

  final_list <- subset_df$can_compute_dx_gap
  names(final_list) <- subset_df$name
  final_list
}


get_cc_always_given_acrs_yrs <- function(data) {
  check_is_ts(data)
  data |>
    dplyr::select(country_code, year) |>
    dplyr::group_split(year, .keep = FALSE) |>
    purrr::reduce(dplyr::inner_join, by = dplyr::join_by(country_code))
}


get_cc_var_always_given_acrs_yrs <- function(data, var) {
  check_is_ts(data)
  data |>
    dplyr::mutate(is_given = !is.na({{ var }})) |>
    dplyr::select(country_code, year, is_given) |>
    dplyr::group_split(year, .keep = FALSE) |>
    purrr::reduce(dplyr::inner_join, by = dplyr::join_by(country_code, is_given)) |>
    dplyr::filter(is_given) |>
    dplyr::select(country_code)
}
