test_that("plot_tb_ts() works", {
  tb_ts_plot <- plot_tb_ts("rate_tb_case_detection", years = seq(2020, 2015))
  vdiffr::expect_doppelganger("plot_tb_ts", tb_ts_plot)
})
