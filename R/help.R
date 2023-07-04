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
