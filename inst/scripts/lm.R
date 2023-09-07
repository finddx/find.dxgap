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
  "gdp",
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
  recipes::step_rm(
    c_cdr,
    e_mort_100k,
    c_newinc_100k,
    dplyr::starts_with("lab"),
    dplyr::starts_with("m_wrd"),
  ) |>
  # recipes::step_filter_missing(threshold = 0.75) |>
  # recipes::update_role(country_code, new_role = "id") |>
  recipes::update_role(who_dx_gap, new_role = "outcome") |>
  recipes::update_role(e_inc_100k, new_role = "impute") |>
  recipes::update_role(pop_total, new_role = "impute") |>
  recipes::update_role(gdp, new_role = "impute") |>
  recipes::step_impute_median(
    e_inc_100k,
    budget_oth,
    gdp,
    cf_tot_gf,
    cf_tot_grnt
  ) |>
  recipes::step_impute_knn(
    -recipes::all_outcomes(),
    neighbors = 3,
    impute_with = c("e_inc_100k", "pop_total", "gdp") #recipes::has_role("impute")
  ) |>
  recipes::step_mutate(
    dplyr::across(
      -dplyr::all_of(c("who_dx_gap", "pop_100k", "pop_density", "pop_urban_perc")),
      ~ .x / pop_100k,
      .names = "{.col}_100k"
    )
  ) |>
  recipes::step_mutate(
    dplyr::across(
      -recipes::all_outcomes(),
      ~ dplyr::if_else(.x == 0, 10, .x)
    )
  ) |>
  recipes::step_log(-recipes::all_outcomes()) |>
  recipes::step_lincomb(-recipes::all_outcomes()) |>
  recipes::step_zv(-recipes::all_outcomes()) |>
  recipes::step_normalize(-recipes::all_outcomes()) |>
  recipes::step_corr(-recipes::all_outcomes(), threshold = 0.8)

recipes::prep(tbl_rec) |>
  recipes::bake(tbl) |>
  skimr::skim()

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

