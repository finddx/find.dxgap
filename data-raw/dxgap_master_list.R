## code to prepare `dxgap_master_list` dataset goes here
pkgload::load_all()

dxgap_master_list <-
  read_masterlist(
    file_name = here::here("inst/extdata/tb_find_variable_masterlist.csv")
  ) |>
  tidy_masterlist()

usethis::use_data(dxgap_master_list, overwrite = TRUE)

