compose_file_path <- function(file_name, data_dir) {
  params <- list(file_name, data_dir)
  out_check <- sapply(params, function(x) is.character(x) && length(x) == 1)
  stopifnot(all(out_check))
  is_abs <- fs::is_absolute_path(file_name)
  if (is_abs) {
    file_name
  } else {
    file.path(data_dir, file_name)
  }
}

read_tidy_tb <- function(file_name = "tb_policy_dashboard_final_v1_14Nov22.xlsx",
                         type = "time_series") {
  suppressMessages(read_tb_dashboard(file_name)) |>
    tidy_tb_dashboard(type = type)
}

get_distinct <- function(data, col) {
  data |>
    dplyr::distinct({{ col }}) |>
    dplyr::pull()
}

skip_if_not_available <- function(url) {
  req <- httr2::req_perform(httr2::request(url))
  is_error <- httr2::resp_is_error(req)
  if (is_error) {
    testthat::skip("Cannot reach online resource.")
  }
}

skip_if_no_data <- function(file_name,
                            data_dir = Sys.getenv("DXGAP_DATADIR")) {
  skip_if(data_dir == "")
  path <- file.path(data_dir, file_name)
  skip_if(!file.exists(path))
}

paste_dataset_name_date <- function(...,
                                    dataset, # "notifications"
                                    download_date = as.character(Sys.Date())) {
  compose_file_name(..., dataset, download_date)
}

compose_file_name <- function(..., sep = "_", file_ext = NULL) {
  dots <- rlang::dots_list(...)
  if (is.null(file_ext)) {
    file_name <- paste(dots, collapse = sep)
    return(file_name)
  }
  paste0(paste(dots, collapse = sep), file_ext)
}

extract_name <- function(path) {
  file_name <- basename(path)
  stringr::str_remove_all(file_name, "\\.[a-zA-Z0-9]+|\\_\\d{4}-\\d{2}-\\d{2}")
}

dxgap_read_csv <- function(file_name, data_dir = Sys.getenv("DXGAP_DATADIR"), ...) {
  file_path <- compose_file_path(file_name = file_name, data_dir = data_dir)
  readr::read_csv(file_path, show_col_types = FALSE, ...)
}

req_perform_lazy <- function(req) {
  stopifnot(inherits(req, "httr2_request"))
  Sys.sleep(3)
  httr2::req_perform(req = req)
}

cook <- function(recipe) {
  recipe |>
    recipes::prep() |>
    recipes::juice() |>
    dplyr::relocate(tidyselect::any_of(c("is_hbc", "country_code", "dx_gap")))
}

mutate_is_significant <- function(data, threshold = 0.05) {
  data |>
    dplyr::mutate(
      "is_under_{threshold}" := dplyr::if_else(
        p.value <= threshold,
        TRUE,
        FALSE
      )
    ) |>
    dplyr::mutate(
      dplyr::across(
        tidyselect::starts_with("is_under_"),
        as.character
    )
  )
}

to_nest_df <- function(list) {
  stopifnot(is.list(list))
  cond <- all(purrr::map_lgl(list, is.data.frame))
  stopifnot(cond)
  stopifnot(rlang::is_named2(list))
  tibble::tibble(
    name = names(list),
    data = unname(list)
  )
}

eval_if <- function(tbl, vars) {
  col_names <- names(tbl)
  if (any(vars %in% col_names)) {
    return(TRUE)
  }
  FALSE
}

eval_if_is_installed_strict <- function(.pkg_vec) {
  cond <- rlang::is_installed(pkg = .pkg_vec)
  if (cond) {
    return(TRUE)
  }
  FALSE
}

compute_sum_by <- function(data, var, by, .na.rm = TRUE) {
  stopifnot(is.character(by))
  by_syms <- rlang::syms(by)
  data |>
    dplyr::group_by(!!!by_syms) |>
    dplyr::summarise("{{var}}" := sum({{ var }}, na.rm = .na.rm)) |>
    dplyr::ungroup()
}

#' List available templates
#' @export
#' @examples
#' \dontrun{
#' view_templates()
#' }
view_templates <- function() {
  all_templates <- fs::dir_ls("inst/template", regexp = "\\.Rmd$") |>
    fs::path_file()
  valid_templates <- all_templates[!grepl("test\\.Rmd$", all_templates)]
  return(valid_templates)
}

mutate_country <- function(data) {
  data |>
    dplyr::mutate(
      country = countrycode::countrycode(
        country_code,
        origin = "iso3c",
        dest = "country.name"
      ),
      .before = everything()
    )
}

get_meta_dxgap <- function(estimated, notified) {
  stopifnot(rlang::is_bare_character(estimated, n = 1))
  stopifnot(rlang::is_bare_character(notified, n = 1))
  mat <- stringr::str_split_fixed(
    c(estimated, notified),
    pattern = "\\.",
    n = 2
  )
  dimnames(mat) <- list(
    c("estimated", "notified"),
    c("table", "field")
  )
  tbl_field_df <- tibble::as_tibble(mat, rownames = "type")
  tbl_field_df
}

extract_tbl_name <- function(dxgap_meta_df, type) {
  type_match <- rlang::arg_match(type, c("estimated", "notified"))
  dxgap_meta_df |>
    dplyr::filter(type == !!type_match) |>
    dplyr::pull(table)
}

extract_field_name <- function(dxgap_meta_df, type) {
  type_match <- rlang::arg_match(type, c("estimated", "notified"))
  dxgap_meta_df |>
    dplyr::filter(type == !!type_match) |>
    dplyr::pull(field)
}

extract_default_dxgap_tbl_field <- function(disease,
                                            dxgap_field,
                                            component = "all",
                                           .dxgap_diseases = dxgap_diseases) {
  check_supported_disease(disease = disease)
  dxgap_field_match <- rlang::arg_match(dxgap_field, c("estimated", "notified"))
  component_match <- rlang::arg_match(component, c("all", "tbl", "field"))

  tbl_field <-
    .dxgap_diseases |>
    dplyr::filter(disease == !!disease) |>
    dplyr::pull(dxgap_field_match)

  if (component_match == "tbl") {
    stringr::str_split_i(tbl_field, "\\.", i = 1)
  } else if (component_match == "field") {
    stringr::str_split_i(tbl_field, "\\.", i = 2)
  } else {
    tbl_field
  }
}
