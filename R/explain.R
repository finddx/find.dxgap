get_core_recipe <- function(tbl) {
  recipes::recipe(formula = who_dx_gap ~ ., x = tbl) |>
    recipes::update_role(who_dx_gap, new_role = "outcome") |>
    recipes::update_role(country_code, new_role = "id") |>
    recipes::step_filter_missing(recipes::all_predictors(), threshold = 0.9) |>
    recipes::update_role(
      dplyr::all_of(
        c("c_cdr", "c_newinc_100k", "notified_ref_community", "notified_ref",
          "e_mort_100k", "e_pop_num", "new_labconf", "is_hbc")
      ),
      new_role = "collinear"
    ) |>
    recipes::update_role(
      dplyr::all_of(c("pop_urban_perc", "pop_density")),
      new_role = "no_norm"
    ) |>
    recipes::update_role(
      dplyr::all_of(
        c("e_inc_100k", "e_inc_num", "c_newinc", "pop_total",
          "pop_density", "pop_urban_perc", "gdp")
      ),
      new_role = "impute_w_median"
    ) |>
    recipes::step_filter(
      !if_any(c("gdp", "e_inc_num", "who_dx_gap", "pop_total"), is.na)
    ) |>
    recipes::step_impute_median(recipes::has_role("impute_w_median")) |>
    recipes::step_mutate(pop_100k = pop_total / 1e5) |>
    recipes::step_rm(recipes::has_role("collinear")) |>
    recipes::update_role(
      dplyr::all_of(c("gdp", "e_inc_num", "pop_total")),
      new_role = "imputer_knn",
      old_role = "impute_w_median"
    ) |>
    recipes::step_impute_knn(
      recipes::all_predictors(),
      neighbors = 5,
      impute_with = recipes::imp_vars(recipes::has_role("imputer_knn"))
    ) |>
    recipes::step_rm(e_inc_num, e_inc_100k, c_newinc) |>
    recipes::step_zv(recipes::all_numeric_predictors())
}
