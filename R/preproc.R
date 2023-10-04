get_recipe <- function(tbl, neighbors, threshold, impute_vars) {
  recipes::recipe(formula = who_dx_gap ~ ., x = tbl) |>
    recipes::update_role(who_dx_gap, new_role = "outcome") |>
    recipes::update_role(country_code, new_role = "id") |>
    recipes::step_filter_missing(recipes::all_predictors(), threshold = threshold) |>
    recipes::update_role(gdp, new_role = "impute_w_median") |>
    recipes::step_impute_median(recipes::has_role("impute_w_median")) |>
    # recipes::update_role(gdp, new_role = "imputer_knn", old_role = "impute_w_median") |>
    get_impute_with_recipe(.neighbors = neighbors, .impute_vars = impute_vars) |>
    recipes::update_role(
      tidyselect::any_of(c("e_inc_num", "c_newinc")),
      new_role = "collinear_w_target"
    ) |>
    recipes::step_rm(recipes::has_role("collinear_w_target")) |>
    recipes::step_zv(recipes::all_numeric_predictors())
}

get_impute_with_recipe <- function(recipe, .impute_vars, .neighbors) {
  recipe |>
    recipes::update_role(
      tidyselect::any_of(.impute_vars),
      new_role = "imputer_knn"
    ) |>
    recipes::step_impute_knn(
      recipes::all_predictors(),
      neighbors = .neighbors,
      impute_with = recipes::imp_vars(recipes::has_role("imputer_knn"))
    )
}

get_finalize_recipe <- function(recipe) {
  recipe |>
    recipes::update_role(
      tidyselect::any_of(c("e_inc_num", "c_newinc", "pop_total")),
      new_role = "collinear_w_target"
    ) |>
    recipes::step_rm(recipes::has_role("collinear_w_target")) |>
    recipes::step_zv(recipes::all_numeric_predictors())
}


get_log_recipe <- function(recipe) {
  recipe |>
    recipes::step_mutate_at(
      recipes::all_numeric_predictors() & -recipes::all_factor(),
      fn = ~ .x + 1
    ) |>
    recipes::step_log(
      recipes::all_numeric_predictors() & -recipes::all_factor()
    )
}

get_normalize_recipe <- function(recipe) {
  recipe |>
    recipes::step_normalize(
      recipes::all_numeric_predictors() & -recipes::all_factor()
    )
}

get_is_hbc_recipe <- function(recipe) {
  recipe |>
    recipes::step_filter(is_hbc == 1) |>
    recipes::step_rm(is_hbc) |>
    get_pca_recipe()
}

get_pop_100k_recipe <- function(recipe) {
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

get_pca_recipe <- function(recipe) {
  recipe |>
    get_normalize_recipe() |>
    recipes::step_pca(
      recipes::all_numeric_predictors() & -recipes::all_factor(),
      num_comp = 5
    )
}

get_core_recipe <- function(recipe) {
  recipe |>
    recipes::step_impute_median(recipes::has_role("impute_w_median")) |>
    recipes::step_rm(recipes::has_role("collinear"))
}

get_set_role_recipe <- function(recipe) {
  recipe |>
    recipes::update_role(who_dx_gap, new_role = "outcome") |>
    recipes::update_role(country_code, new_role = "id") |>
    recipes::update_role(
      tidyselect::any_of(
        c(
          "c_cdr", "c_newinc_100k", "notified_ref_community", "notified_ref",
          "e_mort_100k", "e_pop_num", "new_labconf"
        )
      ),
      new_role = "collinear"
    ) |>
    recipes::update_role(
      tidyselect::any_of(c("pop_urban_perc", "pop_density")),
      new_role = "no_norm"
    ) |>
    recipes::update_role(
      tidyselect::any_of(
        c(
          "e_inc_100k", "e_inc_num", "c_newinc", "pop_total",
          "pop_density", "pop_urban_perc", "gdp"
        )
      ),
      new_role = "impute_w_median"
    )
}


