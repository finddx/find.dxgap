read_wb_pop_density <- function(...) {
  findtb_read_csv(...) |>
    tibble::as_tibble()
}

tidy_wb_pop_density <- function(data) {
  data
}
