pkgload::load_all()

render_report(
  "missing.Rmd",
  disease = "tb",
  year = NULL,
  interactive = FALSE,
  vars = NULL
)

# is recognized as the subset of variables that should be used in the lm
dxgap_const$tb_vars

render_report("eda.Rmd", disease = "tb", year = 2019, vars = dxgap_const$tb_vars)
render_bulk("eda.Rmd", disease = "tb", year = 2016:2021, vars = dxgap_const$tb_vars)

render_report("explain_lm.Rmd", disease = "tb", year = 2019, vars = dxgap_const$tb_vars)
render_bulk("explain_lm.Rmd", disease = "tb", years = 2016:2021, vars = dxgap_const$tb_vars)

read_who("who_laboratories_2023-08-30.csv") |>
  tidy_who() |>
  filter(str_detect(variable, "m_wrd")) |>
  filter(!is.na(value)) |>
  pull(year) |>
  range()

render_report("eda_ts.Rmd", disease = "tb", vars = dxgap_const$tb_vars, interactive = FALSE)
