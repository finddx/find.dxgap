# library(tidyverse)
pkgload::load_all()

a_lst <- findtb_load()
dm <- findtb_build_dm(a_lst)

tbl <-
  dm::dm_flatten_to_tbl(dm, .start = hbc) |>
  dplyr::mutate(
    who_dx_gap = (e_inc_num - c_newinc) / e_inc_num,
    pop_100k = pop_total / 1e5
  ) |>
  dplyr::select(-country_code)

to_divide_by_pop <- c(
  "budget_lab",
  "budget_staff",
  "cf_tot_domestic",
  "cf_tot_sources",
  "culture",
  "smear",
  "xpert",
  "total_numb_device"
  )

tbl_rec <-
  recipes::recipe(who_dx_gap ~ ., data = tbl) |>
  # recipes::update_role(country_code, new_role = "id") |>
  recipes::update_role(who_dx_gap, new_role = "outcome") |>
  recipes::update_role(e_inc_100k, new_role = "impute") |>
  recipes::update_role(pop_total, new_role = "impute") |>
  recipes::step_mutate(
    dplyr::across(
      dplyr::all_of(to_divide_by_pop),
      ~ .x / pop_100k,
      .names = "{.col}_100k"
    )
  ) |>
  recipes::step_rm(c_cdr, e_mort_100k, c_newinc_100k) |>
  recipes::step_zv(-recipes::all_outcomes()) |>
  recipes::step_normalize(-recipes::all_outcomes()) |>
  recipes::step_impute_knn(
    -recipes::all_outcomes(),
    neighbors = 3,
    impute_with = recipes::has_role("impute")
  ) |>
  recipes::step_corr(-recipes::all_outcomes(), threshold = 0.8)

recipes::prep(tbl_rec) |>
  recipes::bake(tbl)

lm_model <-
  parsnip::linear_reg(mode = "regression") %>%
  parsnip::set_engine("lm")

wf <-
  workflows::workflow() |>
  workflows::add_model(lm_model) |>
  workflows::add_recipe(tbl_rec)


lm_fit <- parsnip::fit(wf, data = tbl)

lm_fit  |>
  workflows::extract_fit_parsnip() |>
  broom::tidy()

