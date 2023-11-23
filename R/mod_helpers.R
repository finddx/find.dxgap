#' Helpers to work out `run_mod()`'s output
#'
#' The following helpers extract elements of the list returned by [run_mod()].
#'
#' @name mod_helpers
NULL

#' Extract lm model fit object
#'
#' `pull_mod_rank()` extracts a tibble summarising the ranking of
#' pre-processing steps.
#'
#' @rdname mod_helpers
#' @return `pull_mod_rank()` returns a tibble.
#' @export
#' @examples
#' \dontrun{
#' mod_objects <- run_mod(
#'   tbl,
#'   preproc = preproc_list,
#'   mod = mod_list,
#'   folds = tb_mod_const$folds,
#'   metrics = tb_mod_const$metrics,
#'   rank_metric = tb_mod_const$rank_metric,
#' )
#' pull_mod_rank(mod_objects)
#' }
pull_mod_rank <- function(mod_out_list) {
  stopifnot(is.list(mod_out_list) && length(mod_out_list) == 3)
  mod_out_list$rank
}

#' Extract coefficients from best model fit
#'
#' `pull_mod_coeff()` extracts best model coefficient estimates.
#'
#' @param mod_out_list A list object as returned by [run_mod()].
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
