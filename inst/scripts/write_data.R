library(tidyverse)
pkgload::load_all()

data_path <- file.path(Sys.getenv("DXGAP_DATADIR"), "tb")
df_lst <- load_dx("tb")

tb_vars <- c(
  "year", "country", "is_hbc", "country_code", "who_dx_gap", "pop_total",
  "pop_urban_perc", "pop_density", "gdp", "c_newinc", "e_inc_num",
  "e_mort_100k", "culture", "smear", "xpert", "m_wrd"
)

tbl <-
  build_dm(df_lst, year = NULL) |>
  build_tbl(vars = tb_vars) |>
  prep_tb_data(rm_vars = "country")

# Yearly data -------------------------------------------------------------

readr::write_csv(tbl, file.path(data_path, "tb_ts.csv"))

# Completion rate ---------------------------------------------------------

cr_df <- compute_completion_rate(tbl, id_vars = "year")

readr::write_csv(cr_df, file.path(data_path, "tb_completion_rate.csv"))

# Correlations ------------------------------------------------------------

tbl <-
  tbl |>
  mutate(xpert = dplyr::coalesce(xpert, m_wrd))

corr_df <- compute_correlation(tbl, who_dx_gap, by = "year")
write_csv(corr_df, file.path(data_path, "tb_corr_by_year.csv"))

corr_df2 <- compute_correlation(tbl, who_dx_gap, by = c("year", "is_hbc"))
write_csv(corr_df2, file.path(data_path, "tb_corr_by_year_is_hbc.csv"))

# Modelling ---------------------------------------------------------------

coeff_df <- pull_mod_coeff_all(tbl)
write_csv(coeff_df, file.path(data_path, "tb_coeff.csv"))
