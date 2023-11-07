get_recipe_tb <- function(tbl, neighbors, threshold, impute_vars) {
  recipes::recipe(formula = who_dx_gap ~ ., x = tbl) |>
    recipes::update_role(country_code, new_role = "id") |>
    recipes::step_mutate(xpert = dplyr::coalesce(xpert, m_wrd)) |>
    recipes::step_rm(m_wrd) |>
    recipes::step_filter_missing(recipes::all_predictors(), threshold = threshold) |>
    recipes::add_role(gdp, new_role = "impute_w_median") |>
    recipes::step_impute_median(recipes::has_role("impute_w_median")) |>
    get_impute_with_recipe_tb(.neighbors = neighbors, .impute_vars = impute_vars) |>
    recipes::add_role(
      tidyselect::any_of(c("e_inc_num", "c_newinc")),
      new_role = "collinear_w_target"
    ) |>
    recipes::step_rm(recipes::has_role("collinear_w_target")) |>
    recipes::step_zv(recipes::all_numeric_predictors())
}

get_impute_with_recipe_tb <- function(recipe, .impute_vars, .neighbors) {
  recipe |>
    recipes::add_role(
      tidyselect::any_of(.impute_vars),
      new_role = "imputer_knn"
    ) |>
    recipes::step_impute_knn(
      recipes::all_predictors(),
      neighbors = .neighbors,
      impute_with = recipes::imp_vars(recipes::has_role("imputer_knn"))
    )
}

get_log_recipe_tb <- function(recipe) {
  recipe |>
    recipes::step_log(
      recipes::all_numeric_predictors() & -recipes::all_factor(),
      offset = 1
    )
}

get_normalize_recipe_tb <- function(recipe) {
  recipe |>
    recipes::step_normalize(
      recipes::all_numeric_predictors() & -recipes::all_factor()
    )
}

get_is_hbc_recipe_tb <- function(recipe) {
  df <- recipe$template
  recipe <-
    recipe |>
    recipes::step_filter(is_hbc == 1) |>
    recipes::step_rm(is_hbc)
  if (nrow(df) > ncol(df)) {
    return(recipe)
  }
  get_pca_recipe_tb(recipe)
}

get_pop_100k_recipe_tb <- function(recipe) {
  recipe |>
    recipes::step_mutate(pop_100k = pop_total / 1e5) |>
    recipes::step_mutate_at(
      recipes::all_numeric_predictors() &
        -recipes::all_factor() &
        -recipes::has_role("no_norm"),
      fn = ~ .x / pop_100k
    ) |>
    recipes::step_rm(pop_100k)
}

get_pca_recipe_tb <- function(recipe) {
  recipe |>
    get_normalize_recipe_tb() |>
    recipes::step_pca(
      recipes::all_numeric_predictors() & -recipes::all_factor(),
      threshold = .75
    )
}

get_core_recipe_tb <- function(recipe) {
  recipe |>
    recipes::step_impute_median(recipes::has_role("impute_w_median")) |>
    recipes::step_rm(recipes::has_role("collinear"))
}
