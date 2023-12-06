#' Run a suite of statistical models
#'
#' `run_mod_lm()` runs a suite of statistical models, returning a final model fit.
#'
#' @param tbl Input data frame containing the data to model.
#' @param preproc A list of pre-processing steps.
#' @param folds An integer. The number of cross-validation folds.
#' @param metrics A tibble containing the performance metrics to evaluate.
#' @param rank_metric A metric from `metrics` to rank results by.
#' @param cross A logical: should all combinations of the pre-processors and
#'   models be used to create the workflows? If FALSE, the length of preproc and
#'   models should be equal.
#' @param seed A single integer.
#'
#' @return A list containing a workset, ranked model results, and a final model
#' fit.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' tbl <-
#'   build_tbl("tb", 2019, vars = dxgap_const$tb_vars) |>
#'   compute_dx_gap(e_inc_num, c_newinc) |>
#'   dplyr::mutate(is_hbc = forcats::as_factor(is_hbc)) |>
#'   dplyr::select(-any_of(c("year", "country")))
#'
#' preproc_list <- get_mod_preproc(
#'   .tbl = tbl,
#'   .neighbors = 5,
#'   .threshold = 0.25,
#'   .impute_with = c("gdp", "e_inc_num", "pop_total")
#'  )
#'
#' run_mod_lm(
#'   tbl,
#'   preproc = preproc_list,
#'   folds = 10,
#'   metrics = yardstick::metric_set(yardstick::rmse, yardstick::rsq),
#'   rank_metric = "rmse"
#' )
#' }
run_mod_lm <- function(tbl,
                       preproc,
                       folds,
                       metrics,
                       rank_metric,
                       cross = TRUE,
                       seed = 2023) {

  # Linear model ---------------------------------------------------------------
  mod <- get_mod_mod("regression", "lm")

  # Spending -------------------------------------------------------------------
  splits_list <- split_mod(tbl, .v = folds)

  # Matrix ---------------------------------------------------------------------
  linear_models_matrix <- build_mod_matrix(
    .mod_list = mod,
    .preproc_list = preproc,
    .cross = cross
  )

  # Fit ------------------------------------------------------------------------
  wset <- fit_mod_matrix(
    .matrix = linear_models_matrix,
    .metrics = metrics,
    .resamples = splits_list$tbl_cv,
    .seed = seed
  )

  # Rank -----------------------------------------------------------------------
  rank <- rank_mod(.wset = wset, .rank_metric = rank_metric)

  # Finalize -------------------------------------------------------------------
  final_fit <- finalize_mod(
    .wset = wset,
    .rank = rank,
    .train = splits_list$tbl_train
  )

  tibble::lst(
    wset = wset,
    rank = rank,
    final_fit = final_fit,
  )
}

prepare_mod_tbl <- function(tbl) {
  tbl |>
    dplyr::mutate(is_hbc = forcats::as_factor(is_hbc)) |>
    dplyr::select(-any_of(c("year", "country")))
}

finalize_mod <- function(.wset, .rank, .train) {
  .wset |>
    workflowsets::extract_workflow(id = pull_mod_best(.rank)) |>
    fit(data = .train)
}

rank_mod <- function(.wset, .rank_metric) {
  workflowsets::rank_results(.wset, rank_metric = .rank_metric, select_best = TRUE) |>
    dplyr::select(rank, wflow_id, model, .metric, mean) |>
    dplyr::filter(.metric == !!.rank_metric)
}

fit_mod_matrix <- function(.matrix, .metrics, .resamples, .seed) {
  workflowsets::workflow_map(
    object = .matrix,
    verbose = TRUE,
    metrics = .metrics,
    fn = "fit_resamples",
    resamples = .resamples,
    seed = .seed
  )
}

build_mod_matrix <- function(.mod_list, .preproc_list, .cross)  {
  args <- list(.mod_list, .preproc_list)
  args_are_all_list <- all(purrr::map_lgl(args, is.list))
  stopifnot(args_are_all_list)
  workflowsets::workflow_set(
    preproc = .preproc_list,
    models = .mod_list,
    cross = .cross
  )
}

split_mod <- function(tbl, .v) {
  tbl_split <- rsample::initial_split(tbl)
  tbl_train <- rsample::training(tbl_split)
  tbl_test <- rsample::testing(tbl_split)
  tbl_cv <- rsample::vfold_cv(tbl_train, v = .v)
  tibble::lst(
    tbl_split = tbl_split,
    tbl_train = tbl_train,
    tbl_test = tbl_test,
    tbl_cv = tbl_cv
  )
}

#' Get pre-processing recipes
#'
#' This function returns a list of pre-processing steps applied with
#' [run_mod_lm()].
#'
#' @inheritParams run_mod_lm
#' @inheritParams recipes::step_filter_missing
#' @inheritParams recipes::step_impute_knn
#'
#' @return A list of items of class "recipe".
#'
#' @export
#' @examples
#' \dontrun{
#' tbl <-
#'   build_tbl("tb", 2019, vars = dxgap_const$tb_vars) |>
#'   compute_dx_gap(e_inc_num, c_newinc) |>
#'   dplyr::mutate(is_hbc = forcats::as_factor(is_hbc)) |>
#'   dplyr::select(-any_of(c("year", "country")))
#'
#' get_mod_preproc(
#'   .tbl = tbl,
#'   .neighbors = 5,
#'   .threshold = 0.25,
#'   .impute_with = c("gdp", "e_inc_num", "pop_total")
#'  )
#' }
get_mod_preproc <- function(.tbl, .neighbors, .threshold, .impute_with) {
  tibble::lst(
    simple = get_recipe_tb(
      tbl = .tbl,
      neighbors = .neighbors,
      threshold = .threshold,
      impute_vars = .impute_with
    ),
    log_pop_total = get_log_recipe_tb(simple),
    norm_pop_total = get_normalize_recipe_tb(simple),
    is_hbc_pop_total = get_is_hbc_recipe_tb(simple)
  )
}

get_mod_mod <- function(.mode, .engine) {
  tibble::lst(lm = specify_mod(.mode = .mode, .engine = .engine))
}

specify_mod <- function(.mode, .engine) {
  parsnip::linear_reg(mode = .mode) |>
    parsnip::set_engine(engine = .engine)
}
