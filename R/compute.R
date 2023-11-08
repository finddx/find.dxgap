compute_coeff_tbl <- function(disease = "tb",
                              mod = get_mod_mod(tb_mod_const$mode, tb_mod_const$engine),
                              neighbors = tb_mod_const$neighbors,
                              threshold = tb_mod_const$threshold,
                              impute_vars = tb_mod_const$impute_vars,
                              folds = tb_mod_const$folds,
                              metrics = tb_mod_const$metrics,
                              rank_metric = tb_mod_const$rank_metric,
                              year = NULL,
                              cross = TRUE,
                              seed = 2023,
                              tbl_list = load_dx()) { # TODO: load_dx(disease = disease)
  if (!is.null(year)) {
    year_list <-
      dxgap_diseases |>
      dplyr::filter(disease == !!disease) |>
      dplyr::select(start_year, end_year) |>
      as.list()
    year_seq <- seq(year_list[["start_year"]], year_list[["end_year"]])
  }

  tbl <-
    purrr::map(year_seq, ~ build_dm(tbl_list, .x)) |>
    purrr::map(build_tbl) |>
    purrr::map(compute_dx_gap) |>
    purrr::map(prepare_mod_tbl)

  preproc_list <- vector(mode = "list", length = length(year_seq))
  for (i in seq_along(year_seq)) {
    preproc_list[[i]] <- get_mod_preproc(
      .tbl = tbl[[i]],
      .neighbors = neighbors,
      .threshold = threshold,
      .impute_vars = impute_vars,
    )
  }
  prepoc_list <-
    purrr::map(
      tbl,
      ~ get_mod_preproc(
        .tbl = .x,
        .neighbors = neighbors,
        .threshold = threshold,
        .impute_vars = impute_vars,
      )
    )


  mod_obj <- purrr::map(
    ts_tbl,
    ~ run_mod(
      .x,
      mod = mod,
      preproc = preproc,
      folds = folds,
      metrics = metrics,
      cross = cross,
      seed = seed
    )
  )


}
