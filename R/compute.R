#' Compute the diagnostic gap
#'
#' `compute_dx_gap()` calculates a diagnostic gap defined as the proportion of
#' the population with the condition who are undiagnosed.
#'
#' @section Calculation:
#'
#'   For each country and year in the data, the diagnostic gap can be computed
#'   as follows:
#'
#'   diagnostic gap = (estimated cases - notified cases) / estimated cases
#'
#'   In other words, we can define the diagnostic gap as the gap between the
#'   estimated number of people who fall ill each year and the number of people
#'   who are officially reported as having been diagnosed. This means that the
#'   diagnostic gap represents people who have the illness but are not
#'   officially diagnosed, due to limitations or challenges in the healthcare
#'   system.
#'
#' @param data Input data.
#' @param notified A name unquoted of the variable to be used for notified
#'   cases.
#' @param estimated A name unquoted of the variable to be used for estimated
#'   cases.
#'
#' @return A tibble, the same dimensions as the input data, but with one
#'   additional column called `dx_gap` containing the computed diagnostic
#'   gap values
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Calculate diagnostic gap for 2019 TB data:
#'  build_tbl("tb", 2019, vars = dxgap_const$tb_vars) |>
#'     compute_dx_gap(e_inc_num, c_newinc)
#' }
compute_dx_gap <- function(data, notified, estimated, ...) {
  if ("country_code" %in% names(data)) {
    df <- compute_dx_gap_impl(
      data,
      !!rlang::enquo(notified),
      !!rlang::enquo(estimated),
      .after = country_code
    )
    return(df)
  }
  compute_dx_gap_impl(
    data,
    !!rlang::enquo(notified),
    !!rlang::enquo(estimated),
    ...
  )
}

compute_dx_gap_impl <- function(data, .notified, .estimated, ...) {
  stopifnot(is.data.frame(data))
  rlang::check_required(.estimated)
  check_any_na(data, !!rlang::enquo(.estimated))
  check_any_zero(data, !!rlang::enquo(.estimated))
  rlang::check_required(.notified)
  check_any_na(data, !!rlang::enquo(.notified))
  not <- rlang::enquo(.notified)
  est <- rlang::enquo(.estimated)
  data |>
    dplyr::mutate(dx_gap = (!!est - !!not) / !!est * 100, ...)
}

#' Compute completion rate
#'
#' `compute_completion_rate()` computes the percentage of non-missing values.
#'
#' @param data A tibble.
#' @param id_vars A character vector of variable names indicating the groups
#'   over which counting of the `NA` should be performed. Default
#'   to `NULL` indicating that no groups should be used.
#' @param digits The `digits` argument passed to [signif()].
#'
#' @return A tibble.
#' @export
#'
#' @examples
#' \dontrun{
#' tbl <- build_tbl("tb", 2019, vars = dxgap_const$tb_vars)
#' compute_completion_rate(tbl, id_vars = c("year", "is_hbc"))
#'
#' cars_df <- tibble::as_tibble(mtcars, rownames = "car_name")
#' compute_completion_rate(cars_df, id_vars = NULL)
#' }
compute_completion_rate <- function(data, id_vars = NULL, digits = 2) {
  stopifnot(is.data.frame(data))
  stopifnot(is.character(id_vars) || is.null(id_vars))
  stopifnot(is.numeric(digits) && length(digits) == 1)
  data |>
    dplyr::mutate(dplyr::across(tidyselect::everything(), as.character)) |>
    tidyr::pivot_longer(-tidyselect::all_of(id_vars)) |>
    dplyr::mutate(is_na = is.na(value)) |>
    dplyr::count(!!!rlang::syms(id_vars), name, is_na) |>
    dplyr::group_by(!!!rlang::syms(id_vars), name) |>
    dplyr::mutate(tot = sum(n)) |>
    dplyr::ungroup() |>
    dplyr::mutate(completion_rate = signif(n / tot, digits = digits)) |>
    dplyr::filter(!is_na) |>
    dplyr::select(!!id_vars, var_name = name, completion_rate)
}

#' Compute correlations with a target variable
#'
#' `compute_correlation()` allows to compute correlation of several numerical
#' predictors with respect to a target variable. Optionally, the computation
#' can be done by groups.
#'
#' @param data A tibble.
#' @param target_var The variable against which the correlations needs to be
#'   computed. For instance, `dx_gap`.
#' @param by A character vector.
#' @param ... Optional arguments passed to [correlate()]
#'
#' @return A tibble.
#' @export
#'
#' @examples
#' \dontrun{
#' tbl <-
#'   build_tbl("tb", NULL, vars = dxgap_const$tb_vars) |>
#'   compute_dx_gap(e_inc_num, c_newinc) |>
#'   dplyr::mutate(is_hbc = forcats::as_factor(is_hbc)) |>
#'   dplyr::select(-any_of(c("country")))
#'
#' tbl |>
#'   dplyr::filter(year == 2019) |>
#'   compute_correlation(dx_gap, by = "year")
#'
#' tbl |>
#'   compute_correlation(dx_gap, by = c("year", "is_hbc"))
#'
#' car_tbl <- tibble::as_tibble(mtcars, rownames = "car_name")
#' my_cars <- dplyr::select(car_tbl, -dplyr::all_of(c("vs", "am", "carb")))
#' compute_correlation(my_cars, mpg, by = c("gear", "cyl"))
#' compute_correlation(my_cars, mpg, by = NULL) # car_name is dropped by default
#' }
compute_correlation <- function(data, target_var, by = NULL, ...) {
  stopifnot(is.data.frame(data))
  rlang::check_required(target_var)
  if (is.null(by)) {
    corr_df <-
      data |>
      dplyr::select(tidyselect::where(is.numeric)) |>
      compute_corr({{ target_var }})
    return(corr_df)
  }
  check_var_in_cols(data, var_to_check = by)
  stopifnot(is.character(by))
  # credits to: https://github.com/moodymudskipper
  data |>
    dplyr::reframe(
      compute_corr(
        dplyr::pick(tidyselect::where(is.numeric)),
        {{ target_var }},
        ...
      ),
      .by = tidyselect::all_of(by)
    )
}

compute_corr <- function(data, target_var, ...) {
  data |>
    corrr::correlate(quiet = TRUE, ...) |>
    dplyr::select(term, {{ target_var }}) |>
    dplyr::filter(term != {{ target_var }})
}

