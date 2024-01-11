check_supported_disease <- function(disease, .dxgap_diseases = dxgap_diseases) {
  supported_diseases <- .dxgap_diseases$disease
  if (!disease %in% supported_diseases) {
    rlang::abort(
      c(
        sprintf("`%s` not in `dxgap_diseases`.", disease),
        x = "Disease is not supported yet."
      ),
      class = "dxgap_disease_not_supported"
    )
  }
}

check_supported_templates <- function(template, disease, .dxgap_diseases = dxgap_diseases) {
  template_strip_ext <- strip_ext(template)
  if (template_strip_ext == "test") {
    return(NULL)
  }
  supported_template <-
    .dxgap_diseases |>
    dplyr::filter(disease == !!disease) |>
    dplyr::select(template) |>
    tidyr::unnest(template) |>
    dplyr::pull(template_id)
  if (!template_strip_ext %in% supported_template) {
    rlang::abort(
      sprintf("`%s` is not supported for disease `%s`.", template, disease),
      class = "dxgap_template_not_supported"
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
      ),
      class = "dxgap_vars_not_supported"
    )
  }
}

check_supported_year <- function(year, disease, .dxgap_diseases = dxgap_diseases) {
  if (is.null(year)) {
    invisible(year)
  }

  supported_years <- extract_supported_year(
    disease = disease,
    .dxgap_diseases = .dxgap_diseases
  )

  all_not_supported <- !all(year %in% supported_years)
  any_supported <- any(year %in% supported_years)

  out_of_range <- setdiff(year, supported_years)
  msg <- "`%s` not in supported year range for disease `%s`."
  if (all_not_supported && !any_supported) {
    rlang::abort(
      c(
        sprintf(
          msg,
          paste(out_of_range, collapse = ", "),
          disease
        )
      ),
      class = "dxgap_year_supported_range"
    )
  } else if (any_supported && all_not_supported) {
    fall_back_range <- intersect(supported_years, year)
    rlang::inform(
      c(
        sprintf(
          msg,
          paste(out_of_range, collapse = ", "),
          disease
        ),
        i = sprintf(
          "Fallback on: `%s`.",
          paste(fall_back_range, collapse = ", ")
        )
      ),
      class = "dxgap_year_supported_range"
    )
  } else {
    invisible(year)
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
      ),
      class = "dxgap_data_dir"
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

check_var_in_cols <- function(data, var_to_check) {
  stopifnot(is.character(var_to_check))
  if (!any(var_to_check %in% names(data))) {
    rlang::abort(
      sprintf("`%s` not in data.", paste(var_to_check, collapse = ", ")),
      class = "dxgap_data"
    )
  }
}

check_is_ts <- function(data) {
  years_unique <-
    data |>
    dplyr::distinct(year) |>
    dplyr::pull(year)

  if (length(years_unique) <= 1) {
    rlang::abort(
      c("Cannot build `core countries` across years.",
        i = "Did you call `tidy_xyz(data, year = NULL)`?."),
      class = "dxgap_data"
    )
  }
}

check_all_numeric <- function(data) {
  is_numeric <- purrr::map_lgl(data, is.numeric)
  if (!all(is_numeric)) {
    rlang::abort("Some variables are not numeric.", class = "dxgap_data")
  }
}

check_unique_ptype <- function(...) {
  stopifnot(sum(...) == 1)
}

check_any_na <- function(data, var) {
  var_quote <- rlang::enquo(var)
  vec <- dplyr::pull(data, !!var_quote)
  any_na_in_var <- anyNA(vec)
  if (any_na_in_var) {
    rlang::abort(sprintf("`NA` values found in `%s`.", rlang::as_name(var_quote)))
  }
}

check_any_zero <- function(data, var) {
  var_quote <- rlang::enquo(var)
  check_any_na(data = data, var = !!var_quote)
  vec <- dplyr::pull(data, !!var_quote)
  any_zero <- any(vec == 0)
  if (any_zero) {
    rlang::abort(
      c(
        sprintf("`0` values found in `%s`.", rlang::as_name(var_quote)),
        i = "Dividing by `0` generates `Inf` values."
      )
    )
  }
}

check_interactive_render <- function(year, interactive) {
  if (length(year) > 1 && interactive) {
    rlang::abort(
      c(
        "Cannot render reports interactively for multiple years.",
        i = "Set `interactive = FALSE`."
      )
    )
  }
}
