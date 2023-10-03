pkgload::load_all()

render_report("eda.Rmd", .year = 2019, .vars = dxgap_constants$tb_vars)
render_report("explain_lm.Rmd", .year = 2019, .vars = dxgap_constants$tb_vars)
render_report("missing.Rmd", .year = NULL, .vars = dxgap_constants$tb_vars)
