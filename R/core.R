get_core <- function(data_list) {
  c_newinc_df <-
    data_list$who_notifications |>
    get_with_data_countries(c_newinc)

  e_inc_num_df <-
    data_list$who_estimates |>
    get_with_data_countries(e_inc_num)

  in_common_dxgap <-
    c_newinc_df |>
    dplyr::inner_join(e_inc_num_df, dplyr::join_by(country_code))

  subset_df <-
    to_nest_df(data_list) |>
    dplyr::mutate(in_common_acrs_yr = purrr::map(data, get_core_countries)) |>
    dplyr::mutate(in_common_dxgap = list(in_common_dxgap)) |>
    dplyr::mutate(
      final = purrr::map2(
        in_common_acrs_yr,
        in_common_dxgap,
        dplyr::semi_join,
        dplyr::join_by(country_code)
      )
    ) |>
    dplyr::select(name, final)

  final_list <- subset_df$final
  names(final_list) <- subset_df$name
  final_list
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
