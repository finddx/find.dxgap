pull_mod_coeff_all <- function(disease,
                               vars = dxgap_const$tb_vars,
                               mod_const = tb_mod_const) {
  tbl <-
    load_dx(disease = disease) |>
    build_dm(year = NULL) |>
    build_tbl(vars = vars) |>
    compute_dx_gap() |>
    dplyr::mutate(is_hbc = forcats::as_factor(is_hbc)) |>
    dplyr::select(-any_of(c("country")))

  tbl_nested <- tidyr::nest(tbl, .key = "disease_data", .by = year)

  tbl_nested_preproc <-
    tbl_nested |>
    dplyr::mutate(
      preproc = purrr::map(
        disease_data,
        ~ get_mod_preproc(
          .x,
          .neighbors = mod_const$neighbors,
          .threshold = mod_const$threshold,
          .impute_vars = mod_const$impute_vars
        )
      )
    ) |>
    dplyr::mutate(mod = list(get_mod_mod(mod_const$mode, mod_const$engine)))

  tbl_mod_out <-
    tbl_nested_preproc |>
    dplyr::mutate(
      mod_obj = purrr::pmap(
        list(
          disease_data,
          preproc,
          mod
        ),
        .f = function(x, y, z) {
          run_mod(
            tbl = x,
            preproc = y,
            mod = z,
            folds = mod_const$folds,
            metrics = mod_const$metrics,
            rank_metric = mod_const$rank_metric,
          )
        }
      )
    )

  tbl_coeff <-
    tbl_mod_out |>
    dplyr::mutate(
      coeff = purrr::map(mod_obj, pull_mod_coeff),
      best_mod = purrr::map_chr(
        mod_obj,
        function(x) {
          pull_mod_rank(x) |>
            pull_mod_best()
        }
      )
    ) |>
    dplyr::select(year, best_mod, coeff) |>
    tidyr::unnest(coeff) |>
    mutate_is_significant()

  tbl_coeff

}



