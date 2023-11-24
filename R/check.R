check_supported_disease <- function(disease, .dxgap_diseases = dxgap_diseases) {
  supported_diseases <- .dxgap_diseases$disease
  if (!disease %in% supported_diseases) {
    rlang::abort(
      c(
        sprintf("Cannot find `%s` in `dxgap_diseases`.", disease),
        x = "Disease is not supported yet."
      ),
      class = "dxgap_disease_not_supported"
    )
  }
}

check_supported_templates <- function(template, disease, .dxgap_diseases = dxgap_diseases) {
  template_strip_ext <- stringr::str_remove(template, "\\..*$")
  supported_template <-
    .dxgap_diseases |>
    dplyr::filter(disease == !!disease) |>
    dplyr::select(template) |>
    tidyr::unnest(template) |>
    dplyr::pull(template_id)
  if (!template_strip_ext %in% supported_template) {
    rlang::abort(
      sprintf("`%s` is not supported for disease `%s`.", template, disease)
    )
  }
}

check_supported_vars <- function(vars, disease, .dxgap_diseases = dxgap_diseases) {
  if (is.null(vars)) {
    invisible(vars)
  }
  supported_vars <-
    .dxgap_diseases |>
    dplyr::filter(disease == !!disease) |>
    dplyr::select(vars) |>
    tidyr::unnest(vars) |>
    dplyr::pull(vars)
  unknown_vars <- setdiff(vars, supported_vars)
  if (length(unknown_vars) != 0) {
    rlang::abort(
      c(
        sprintf("Some `vars` are not supported for disease `%s`.", disease),
        i = sprintf("Not known vars: `%s`", paste(unknown_vars, collapse = ", ")),
        i = "Set override_vars_check to `TRUE` to override this check.",
        i = "If `override_vars_check = TRUE` consistent results are not guaranteed."
      )
    )
  }
}

check_supported_year <- function(year, disease, .dxgap_diseases = dxgap_diseases) {
  if (is.null(year)) {
    invisible(year)
  }
  supported_years <-
    .dxgap_diseases |>
    dplyr::filter(disease == !!disease) |>
    dplyr::select(start_year, end_year) |>
    as.list() |>
    purrr::reduce(.f = seq)
  if (!all(year %in% supported_years)) {
    rlang::abort(
      c(
        sprintf("`year` is out of supported range for disease `%s`.", disease)
      )
    )
  }
}

check_clean_data_dir <- function(data_files, .pattern) {
  pattern <- paste0(c(.pattern, "\\..*$"), collapse = "|")
  core_pattern <- stringr::str_remove_all(
    data_files,
    pattern = pattern
  )
  n_duplicates <- anyDuplicated(core_pattern)
  if (n_duplicates != 0) {
    rlang::abort(
      c(
        "`data_files` are not unique.",
        i = "One file per `dataset_type` must be present in the data folder."
      )
    )
  }
}

check_ptype <- function(data, ptype) {
  sym_ptype <- rlang::ensym(ptype)
  sym_data <- rlang::ensym(data)
  rlang::try_fetch(
    expr = vctrs::vec_assert(data, ptype),
    error = function(err) {
      main_msg <- "%s does not match output provided by %s"
      msg <- sprintf(
        main_msg,
        rlang::as_string(sym_data),
        rlang::as_string(sym_ptype)
      )
      rlang::abort(msg, parent = err, class = "dxgap_wrong_raw_data")
    }
  )
}

is_ptype <- function(data, ptype) {
  rlang::try_fetch(
    error = function(cnd) FALSE,
    {
      check_ptype(data, ptype)
      TRUE
    }
  )
}

check_is_ts <- function(data) {
  years_unique <-
    data |>
    dplyr::distinct(year) |>
    dplyr::pull(year)

  if (length(years_unique) <= 1) {
    rlang::abort(
      c("Cannot build `core countries` across years.",
        i = "Did you call `tidy_xyz(data, year = NULL)`?.")
    )
  }
}
