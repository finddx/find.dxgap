#' Run a suite of statistical models
#'
#' `run_mod()` runs a suite of statical models, returning a final model fit.
#'
#' @param tbl Input data frame containing the data to model.
#' @param mod A list of models to run.
#' @param preproc A list of preprocessing steps.
#' @param folds An integer. The number of cross-validation folds.
#' @param metrics A tibble containing the performance metrics to evaluate.
#' @param rank_metric A metric from `metrics` to rank results by.
#' @param cross A logical: should all combinations of the preprocessors and
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
#' tbl <- load_dx("tb") |>
#'   build_dm(year = 2019) |>
#'   build_tbl(vars = dxgap_const$tb_vars) |>
#'   compute_dx_gap() |>
#'   dplyr::mutate(is_hbc = forcats::as_factor(is_hbc)) |>
#'   dplyr::select(-any_of(c("year", "country")))
#'
#'  preproc_list <- get_mod_preproc(
#'   .tbl = tbl,
#'   .neighbors = tb_mod_const$neighbors,
#'   .threshold = tb_mod_const$threshold,
#'   .impute_vars = tb_mod_const$impute_vars
#'  )
#'
#' mod_list <- get_mod_mod(tb_mod_const$mode, tb_mod_const$engine)
#'
#' run_mod(
#'   tbl,
#'   preproc = preproc_list,
#'   mod = mod_list,
#'   folds = tb_mod_const$folds,
#'   metrics = tb_mod_const$metrics,
#'   rank_metric = tb_mod_const$rank_metric,
#' )
#' }
run_mod <- function(tbl,
                    mod,
                    preproc,
                    folds,
                    metrics,
                    rank_metric,
                    cross = TRUE,
                    seed = 2023) {
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

#' Extract coefficients from final fit
#'
#' An helper functions to extract coefficient estimates from the best model
#' returned by [run_mod()].
#'
#' @param mod_out_list A list object as returned by [run_mod()].
#'
#' @return A tibble.
#' @export
extract_mod_coeff <- function(mod_out_list) {
  stopifnot(is.list(mod_out_list) && length(mod_out_list) == 3)
  mod_out_list$final_fit |>
    broom::tidy()
}

#' Extract lm model fit object
#'
#' @inheritParams extract_mod_coeff
#'
#' @return An object of class `_lm`.
#' @export
extract_mod_fit <- function(mod_out_list) {
  stopifnot(is.list(mod_out_list) && length(mod_out_list) == 3)
  mod_out_list$final_fit |>
    workflowsets::extract_fit_parsnip(id = pull_mod_best(mod_out_list$rank))
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

# TODO: explode it with a do.call or rlang::exec?
get_mod_preproc <- function(.tbl, .neighbors, .threshold, .impute_vars) {
  tibble::lst(
    simple = get_recipe_tb(
      tbl = .tbl,
      neighbors = .neighbors,
      threshold = .threshold,
      impute_vars = .impute_vars
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

pull_mod_best <- function(rank_df) {
  rank_df$wflow_id[[1]]
}




