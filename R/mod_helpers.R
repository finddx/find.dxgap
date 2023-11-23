#' Extract coefficients from final fit
#'
#' `extract_mod_coeff()` is an helper functions to extract coefficient estimates
#' from the best model returned by [run_mod()].
#'
#' @param mod_out_list A list object as returned by [run_mod()].
#' @rdname mod_helpers
#' @return `extract_mod_coeff()` returns a tibble.
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
#' extract_mod_coeff(mod_objects)
#' }
extract_mod_coeff <- function(mod_out_list) {
  stopifnot(is.list(mod_out_list) && length(mod_out_list) == 3)
  mod_out_list$final_fit |>
    broom::tidy()
}

#' Extract lm model fit object
#'
#' `extract_mod_fit()` is an helper function to extract the model object from
#' the best model returned by [run_mod()].
#'
#' @rdname mod_helpers
#' @return `extract_mod_fit()` returns an object of class `_lm`.
#' @export
#' @examples
#' \dontrun{
#' lm_obj <- extract_mod_fit(mod_objects)
#' plot_check <- performance::check_model(
#'   lm_obj,
#'   check = c("linearity", "normality", "qq", "outliers"),
#'   theme = "ggplot2::theme_minimal"
#' )
#' }
extract_mod_fit <- function(mod_out_list) {
  stopifnot(is.list(mod_out_list) && length(mod_out_list) == 3)
  mod_out_list$final_fit |>
    workflowsets::extract_fit_parsnip(id = pull_mod_best(mod_out_list$rank))
}

#' Extract lm model fit object
#'
#' `extract_mod_fit()` is an helper function to extract the model object from
#' the best model returned by [run_mod()].
#'
#' @rdname mod_helpers
#' @return `extract_mod_fit()` returns an object of class `_lm`.
#' @export
#' @examples
#' \dontrun{
#' lm_obj <- extract_mod_fit(mod_objects)
#' plot_check <- performance::check_model(
#'   lm_obj,
#'   check = c("linearity", "normality", "qq", "outliers"),
#'   theme = "ggplot2::theme_minimal"
#' )
#' }
extract_mod_rank <- function(mod_out_list) {
  stopifnot(is.list(mod_out_list) && length(mod_out_list) == 3)
  mod_out_list$rank
}
