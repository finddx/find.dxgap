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

dxgap_read_csv <- function(file_name, data_dir = Sys.getenv("DXGAP_DATADIR"), ...) {
  file_path <- compose_file_path(file_name = file_name, data_dir = data_dir)
  readr::read_csv(file_path, show_col_types = FALSE, ...)
}

req_perform_lazy <- function(req) {
  stopifnot(inherits(req, "httr2_request"))
  Sys.sleep(3)
  httr2::req_perform(req = req)
}

