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
read_tb_dashboard <- function() {
  path <- "inst/extdata/TB policy dashboard final_v1_14Nov22.xlsx"

  if (!file.exists(path)) {
    stop("The dataset cannot be found.")
  }

  readxl::read_xlsx(
    path = path,
    sheet = "Sheet1"
  )
}
