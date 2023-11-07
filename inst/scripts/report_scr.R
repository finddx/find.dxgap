pkgload::load_all()

set_data_dir()

render_report(
  "missing.Rmd",
  .year = NULL,
  interactive = TRUE,
  .vars = NULL
)

# is recognized as the subset of variables that should be used in the lm
dxgap_const$tb_vars

render_report("eda.Rmd", .year = 2019, .vars = c(dxgap_const$tb_vars, "new_labconf"))
render_bulk("eda.Rmd", year = 2018:2021, vars = dxgap_const$tb_vars)


render_report("explain_lm.Rmd", .year = 2019, .vars = dxgap_const$tb_vars)
render_bulk("explain_lm.Rmd", year = 2016:2021, vars = dxgap_const$tb_vars)

read_who("who_2023-08-30_laboratories.csv") |>
  tidy_who() |>
  filter(str_detect(variable, "m_wrd")) |>
  filter(!is.na(value)) |>
  pull(year) |>
  range()

render_report("eda_ts.Rmd", .vars = dxgap_const$tb_vars)
