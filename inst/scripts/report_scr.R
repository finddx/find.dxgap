pkgload::load_all()

set_data_dir()

render_report(
  "missing.Rmd",
  .year = NULL,
  interactive = FALSE,
  .vars = NULL
  #.vars = dxgap_constants$tb_vars
)

render_report("eda.Rmd", .year = 2019, .vars = dxgap_constants$tb_vars)
render_bulk("eda.Rmd", year = 2018:2021, vars = dxgap_constants$tb_vars)

render_report("explain_lm.Rmd", .year = 2019, .vars = dxgap_constants$tb_vars)
render_bulk("explain_lm.Rmd", year = 2018:2021, vars = dxgap_constants$tb_vars)
