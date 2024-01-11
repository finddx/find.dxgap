pkgload::load_all()

write_data_dir()

render_report(
  "missing.Rmd",
  disease = "tb",
  year = 2016:2018,
  interactive = TRUE,
  vars = NULL
)

render_report(
  "missing.Rmd",
  disease = "tb",
  year = NULL,
  interactive = TRUE,
  vars = NULL
)

render_report(
  "missing.Rmd",
  disease = "tb",
  year = 2016,
  interactive = TRUE,
  vars = NULL
)

# is recognized as the subset of variables that should be used in the lm
extract_vars("tb")

render_report("eda.Rmd", disease = "tb", year = 2019, vars = extract_vars("tb"), interactive = TRUE)
render_report("eda.Rmd", disease = "tb", year = 2016:2017, vars = extract_vars("tb"), interactive = FALSE)
try(render_report("eda.Rmd", disease = "tb", year = 2016:2017, vars = extract_vars("tb"), interactive = TRUE))
render_bulk("eda.Rmd", disease = "tb", year = 2016:2021, vars = extract_vars("tb"))

render_report("explain_lm.Rmd", disease = "tb", year = 2019, vars = extract_vars("tb"))
render_report("explain_lm.Rmd", disease = "tb", year = 2016:2021, vars = extract_vars("tb"), interactive = FALSE)
render_bulk("explain_lm.Rmd", disease = "tb", year = 2016:2021, vars = extract_vars("tb"))

read_who("who_laboratories_2023-08-30.csv") |>
  tidy_who() |>
  filter(str_detect(variable, "m_wrd")) |>
  filter(!is.na(value)) |>
  pull(year) |>
  range()

render_report(
  "eda_ts.Rmd",
  disease = "tb",
  vars = extract_vars("tb"),
  interactive = FALSE,
  year = 2019:2021
)
render_report(
  "eda_ts.Rmd",
  disease = "tb",
  vars = extract_vars("tb"),
  interactive = TRUE,
  year = 2019:2021
)
try(render_report(
  "eda_ts.Rmd",
  disease = "tb",
  vars = extract_vars("tb"),
  interactive = FALSE,
  year = 2019
))
