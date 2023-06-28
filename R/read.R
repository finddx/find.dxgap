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
