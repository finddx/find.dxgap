#' Read the TB dashboard
#'
#' `read_tb_dashboard()` reads the raw Excel TB dashboard into R, keeping all
#' the information in an untidied format.
#'
#' @param file_name Either an absolute or relative path to the raw Excel TB
#'   dashboard. If a relative path is provided, data is read from the
#'   findtb.data. Instead, if an absolute path is provided, data is read from
#'   any other location.
#' @param data_dir An absolute path pointing to the findtb.data folder. By
#'   default, the path is returned by the `FINDTB_DATADIR` environment
#'   variable.
#'
#' @returns A tibble
#' @seealso [tidy_tb_dashboard()] to tidy this dashboard.
#' @examples
#' \dontrun{
#' read_tb_dashboard()
#' }
#' @export
read_tb_dashboard <- function(file_name,
                              data_dir = Sys.getenv("FINDTB_DATADIR")) {
  file_path <- compose_file_path(file_name = file_name, data_dir = data_dir)

  readxl::read_xlsx(
    path = file_path,
    sheet = "Sheet1"
  )
}

read_hbc <- function(file_name, data_dir = Sys.getenv("FINDTB_DATADIR")) {
  file_path <- compose_file_path(file_name = file_name, data_dir = data_dir)
  # TODO: extract table from pdf pdftools::pdf_text(file_path)[[8]]
  officer::read_docx(path = file_path) |>
    officer::docx_summary() |>
    tibble::as_tibble()
}

read_gf_procurement <- function(file_name, data_dir = Sys.getenv("FINDTB_DATADIR")) {
  file_path <- compose_file_path(file_name = file_name, data_dir = data_dir)
  readr::read_tsv(
    file_path,
    locale = readr::locale(encoding = "UTF-16LE"),
    show_col_types = FALSE
  )
}

read_masterlist <- function(file_name, data_dir = Sys.getenv("FINDTB_DATADIR")) {
  file_path <- compose_file_path(file_name = file_name, data_dir = data_dir)
  readr::read_csv(file_path, show_col_types = FALSE)
}
