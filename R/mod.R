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

