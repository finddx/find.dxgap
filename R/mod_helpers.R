#' Helpers to work out `run_mod_lm()`'s output
#'
#' The following helpers extract elements of the list returned by [run_mod_lm()].
#'
#' @name mod_helpers
NULL

#' Extract lm model fit object
#'
#' `pull_mod_rank()` extracts a tibble summarising the ranking of pre-processing
#' steps measured according to `rank_metric` chosen in [run_mod_lm()].
#'
#' @rdname mod_helpers
#' @return `pull_mod_rank()` returns a tibble.
#' @export
#' @examples
#' \dontrun{
#' preproc_list <- get_mod_preproc(
#'   .tbl = tbl,
#'   .neighbors = 5,
#'   .threshold = 0.25,
#'   .impute_with = c("gdp", "e_inc_num", "pop_total")
#'  )
#'
#' mod_objects <- run_mod_lm(
#'   tbl,
#'   preproc = preproc_list,
#'   folds = 10,
#'   metrics = yardstick::metric_set(yardstick::rmse, yardstick::rsq),
#'   rank_metric = "rmse"
#' )
#' pull_mod_rank(mod_objects)
#' }
pull_mod_rank <- function(mod_out_list) {
  stopifnot(is.list(mod_out_list) && length(mod_out_list) == 3)
  mod_out_list$rank
}

#' Extract best model id
#'
#' `pull_mod_best()` extract the best model id.
#'
#' @param rank_df A tibble as returned by [pull_mod_rank()].
#'
#' @rdname mod_helpers
#' @return `pull_mod_best()` returns a character of length one.
#' @export
#'
#' @examples
#' \dontrun{
#' pull_mod_rank(mod_objects) |>
#'   pull_mod_best()
#' }
pull_mod_best <- function(rank_df) {
  rank_df$wflow_id[[1]]
}

#' Extract coefficients from best model fit
#'
#' `pull_mod_coeff()` extracts best model coefficient estimates.
#'
#' @param mod_out_list A list object as returned by [run_mod_lm()].
#' @rdname mod_helpers
#' @return `pull_mod_coeff()` returns a tibble.
#' @export
#' @examples
#' \dontrun{
#' pull_mod_coeff(mod_objects)
#' }
pull_mod_coeff <- function(mod_out_list) {
  stopifnot(is.list(mod_out_list) && length(mod_out_list) == 3)
  mod_out_list$final_fit |>
    broom::tidy()
}

#' Extract best model object
#'
#' `pull_mod_fit()` extracts the best model object.
#'
#' @rdname mod_helpers
#' @return `pull_mod_fit()` returns an object of class `_lm`.
#' @export
#' @examples
#' \dontrun{
#' lm_obj <- pull_mod_fit(mod_objects)
#' plot_check <- performance::check_model(
#'   lm_obj,
#'   check = c("linearity", "normality", "qq", "outliers"),
#'   theme = "ggplot2::theme_minimal"
#' )
#' }
pull_mod_fit <- function(mod_out_list) {
  stopifnot(is.list(mod_out_list) && length(mod_out_list) == 3)
  mod_out_list$final_fit |>
    workflowsets::extract_fit_parsnip(id = pull_mod_best(mod_out_list$rank))
}

#' Extract coefficients across years
#'
#' `pull_mod_coeff_all()` extracts coefficients estimates referenced by year.
#'
#' @inheritParams run_mod_lm
#' @param mod_const Default models specs as returned by the list `tb_mod_const`.
#'
#' @rdname mod_helpers
#' @return `pull_mod_coeff_all()` returns a tibble.
#' @export
#'
#' @examples
#' \dontrun{
#' tbl <-
#'   build_tbl(
#'     "tb",
#'     estimated = "who_estimates.e_inc_num",
#'     notified = "who_notifications.c_newinc",
#'     year = NULL,
#'     vars = extract_vars("tb")
#'   ) |>
#'   dplyr::mutate(is_hbc = forcats::as_factor(is_hbc))
#' coeff_df <- pull_mod_coeff_all(tbl)
#' }
pull_mod_coeff_all <- function(tbl, mod_const = tb_mod_const) {
  stopifnot(is.data.frame(tbl))
  stopifnot(is.list(mod_const))

  tbl_nested <- tidyr::nest(tbl, .key = "disease_data", .by = year)

  tbl_nested_preproc <-
    tbl_nested |>
    dplyr::mutate(
      preproc = purrr::map(
        disease_data,
        ~ get_mod_preproc(
          .x,
          .neighbors = mod_const$neighbors,
          .threshold = mod_const$threshold,
          .impute_with = mod_const$impute_vars
        )
      )
    )

  tbl_mod_out <-
    tbl_nested_preproc |>
    dplyr::mutate(
      mod_obj = purrr::pmap(
        list(
          disease_data,
          preproc
        ),
        .f = function(x, y) {
          run_mod_lm(
            tbl = x,
            preproc = y,
            folds = mod_const$folds,
            metrics = mod_const$metrics,
            rank_metric = mod_const$rank_metric,
          )
        }
      )
    )

  tbl_coeff <-
    tbl_mod_out |>
    dplyr::mutate(
      coeff = purrr::map(mod_obj, pull_mod_coeff),
      best_mod = purrr::map_chr(
        mod_obj,
        function(x) {
          pull_mod_rank(x) |>
            pull_mod_best()
        }
      )
    ) |>
    dplyr::select(year, best_mod, coeff) |>
    tidyr::unnest(coeff) |>
    mutate_is_significant()

  tbl_coeff

}

