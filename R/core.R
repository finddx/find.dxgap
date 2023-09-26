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
    dplyr::group_split(year) |>
    purrr::reduce(dplyr::inner_join, by = dplyr::join_by(country_code)) |>
    dplyr::select(-tidyselect::starts_with("year"))
}
