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
#' data_list <- load_dx("tb")
#' dm <- build_dm(data_list, year = 2019)
#' tbl <- build_tbl(dm)
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

