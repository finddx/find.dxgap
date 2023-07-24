## code to prepare `finddx_fixed` dataset goes here
pkgload::load_all()
finddx_fixed <-
  read_tidy_tb(
    file_name = here::here("inst/extdata/tb_policy_dashboard_final_v1_14Nov22.xlsx"),
    type = "fixed"
  )
usethis::use_data(finddx_fixed, overwrite = TRUE)
