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

get_distinct <- function(col,
                         df = read_tidy_tb()) {
  df |>
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

compose_date_dataset_file_name <- function(...,
                                           download_date = as.character(Sys.Date()),
                                           dataset = "notifications") {
  compose_file_name(..., download_date, dataset)
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
  stringr::str_remove_all(file_name, "\\d{4}-\\d{2}-\\d{2}\\_|\\.[a-zA-Z0-9]+$")
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
    dplyr::relocate(tidyselect::any_of(c("is_hbc", "country_code", "who_dx_gap")))
}

compute_dx_gap <- function(data) {
  data |>
    dplyr::mutate(
      who_dx_gap = (e_inc_num - c_newinc) / e_inc_num * 100,
      .after = country_code
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

compute_sum_by <- function(data, var, by, .na.rm = TRUE) {
  stopifnot(is.character(by))
  by_syms <- rlang::syms(by)
  data |>
    dplyr::group_by(!!!by_syms) |>
    dplyr::summarise("{{var}}" := sum({{ var }}, na.rm = .na.rm)) |>
    dplyr::ungroup()
}
