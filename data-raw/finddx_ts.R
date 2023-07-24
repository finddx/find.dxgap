## code to prepare `finddx_ts` dataset goes here
pkgload::load_all()
finddx_ts <-
  read_tidy_tb(
    file_name = here::here("inst/extdata/tb_policy_dashboard_final_v1_14Nov22.xlsx"),
    type = "time_series"
  )
usethis::use_data(finddx_ts, overwrite = TRUE)
