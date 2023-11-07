#' Get core countries
#' @examples \dontrun{
#' get_core(load_dx())
#' }
get_core <- function(data_list) {
  country_notification_df <-
    data_list$who_notifications |>
    get_cc_var_always_given_acrs_yrs(c_newinc)

  country_estimate_df <-
    data_list$who_estimates |>
    dplyr::filter(e_inc_num != 0) |> # avoid dividing by zero
    get_cc_var_always_given_acrs_yrs(e_inc_num)

  in_common_dxgap <-
    country_notification_df |>
    dplyr::inner_join(country_estimate_df, dplyr::join_by(country_code))

  subset_df <-
    to_nest_df(data_list) |>
    dplyr::mutate( # get core set of consistently hbc across year
      consistently_hbc = dplyr::if_else(
        name == "hbc",
        purrr::map(data, get_cc_always_given_acrs_yrs),
        data
      )
    ) |>
    dplyr::mutate(in_common_dxgap = list(in_common_dxgap)) |> # those cc for which dxgap can always be computed
    dplyr::mutate(can_compute_dx_gap = purrr::map2(
      consistently_hbc,
      in_common_dxgap,
      dplyr::inner_join,
      dplyr::join_by(country_code)
      )
    ) |>
    dplyr::select(name, can_compute_dx_gap)

  final_list <- subset_df$can_compute_dx_gap
  names(final_list) <- subset_df$name
  tibble::lst(core_list = final_list, can_compute_dxgap = in_common_dxgap)
}


get_cc_always_given_acrs_yrs <- function(data) {
  check_is_ts(data)
  data |>
    dplyr::select(country_code, year) |>
    dplyr::group_split(year, .keep = FALSE) |>
    purrr::reduce(dplyr::inner_join, by = dplyr::join_by(country_code))
}


get_cc_var_always_given_acrs_yrs <- function(data, var, start_year = dxgap_const$start_year) {
  check_is_ts(data)
  data |>
    dplyr::filter(year >= !!start_year) |>
    dplyr::mutate(is_given = !is.na({{ var }})) |>
    dplyr::select(country_code, year, is_given) |>
    dplyr::group_split(year, .keep = FALSE) |>
    purrr::reduce(dplyr::inner_join, by = dplyr::join_by(country_code, is_given)) |>
    dplyr::filter(is_given) |>
    dplyr::select(country_code)
}
