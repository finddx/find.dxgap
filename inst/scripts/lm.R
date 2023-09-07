pkgload::load_all()

a_lst <- findtb_load()

dm <- findtb_build_dm(a_lst)

tbl <-
  dm::dm_flatten_to_tbl(dm, .start = hbc) |>
  compute_dx_gap()

tbl_rec <-
  recipes::recipe(who_dx_gap ~ ., data = tbl) |>
  recipes::update_role(country_code, new_role = "id") |>
  recipes::update_role(who_dx_gap, new_role = "outcome") |>
  recipes::step_mutate(
    pop_100k = pop_total / 1e5,
    budget_lab_100k = budget_lab / pop_100k,
    budget_staff_100k = budget_staff / pop_100k,
    cf_tot_domestic_100k = cf_tot_domestic / pop_100k,
    cf_tot_sources_100k = cf_tot_sources / pop_100k,
    culture_100k = culture / pop_100k,
    smear_100k = smear / pop_100k,
    xpert_100k = xpert / pop_100k,
    total_dev_100k = total_numb_device / pop_100k
  ) |>
  # recipes::step_select(
  #   who_dx_gap,
  #   pop_100k,
  #   budget_lab_100k,
  #   budget_staff_100k,
  #   cf_tot_domestic_100k,
  #   cf_tot_sources_100k,
  #   culture_100k,
  #   smear_100k,
  #   xpert_100k,
  #   total_dev_100k
  # ) |>
  recipes::step_rm(country_code) |>
  recipes::step_normalize(recipes::all_numeric()) |>
  recipes::step_corr(-recipes::all_outcomes()) |>
  recipes::step_impute_knn(-recipes::all_outcomes(), neighbors = 3)

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

