get_core <- function(list) {
  c_newinc_df <-
    list$who_notifications |>
    get_with_data_countries(c_newinc)

  e_inc_num_df <-
    list$who_estimates |>
    get_with_data_countries(e_inc_num)

  in_common_dxgap <- inner_join(c_newinc_df, e_inc_num, join_by(country_code))

  to_nest_df(df_lst) |>
    mutate(in_common_acrs_yr = map(data, get_core_countries)) |>
    mutate(in_common_dxgap = list(in_common_dxgap)) |>
    mutate(
      final = map2(
        in_common_acrs_yr,
        in_common_dxgap,
        semi_join,
        join_by(country_code)
      )
    ) |>
    select(name, final) |>
    unnest(final)
}


get_core_countries <- function(data) {
  years_unique <-
    data |>
    dplyr::distinct(year) |>
    dplyr::pull(year)

  if (length(years_unique) <= 1) {
    rlang::abort(
      c("Cannot build `core countries` across years.",
        i = "Did you call `tidy_xyz(data, year = NULL)`?.")
    )
  }

  data |>
    dplyr::select(country_code, year) |>
    dplyr::group_split(year, .keep = FALSE) |>
    purrr::reduce(dplyr::inner_join, by = dplyr::join_by(country_code))
}


get_with_data_countries <- function(data, col, year = NULL) {
  if (!is.null(year)) {
    data <- dplyr::filter(data, year >= !!year)
  }
  data |>
    dplyr::mutate(is_given = !is.na({{ col }})) |>
    dplyr::select(country_code, year, is_given) |>
    dplyr::group_split(year, .keep = FALSE) |>
    purrr::reduce(dplyr::inner_join, by = dplyr::join_by(country_code, is_given)) |>
    dplyr::select(country_code)
}
