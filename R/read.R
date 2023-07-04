#' Read the TB dashboard
#'
#' `read_tb_dashboard()` reads the raw Excel TB dashboard into R, keeping all
#' the information in an untidied format.
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
