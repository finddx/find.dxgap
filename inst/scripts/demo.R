pkgload::load_all()

# Data for the project ---------------------------------------------------------

# deprecated: clone find.dxgap.data instead and set `DXGAP_DATADIR`
# see README for instructions
try(write_data_dir())

# Disease meta table -----------------------------------------------------------
# contains supported year range, vars and templates plus default fields to be used
# as notified and estimated cases for dx_gap computation
# TODO: build a constructor for this table for enhanced user experience?
# https://github.com/finddx/find.dxgap/issues/298

dxgap_diseases # TODO: export?
extract_vars("tb")

dxgap_diseases$notified
dxgap_diseases$estimated

dxgap_diseases$start_year # since hbc list starts in 2016
dxgap_diseases$end_year

# Read and tidy any individual table -------------------------------------------

import_tbl("who_notifications_2023-11-28.csv")
import_tbl("wb_pop_density_2023-10-04.csv")
import_tbl("who_hbc_2023-07-28.csv")

# Build disease-table ----------------------------------------------------------

build_tbl("tb")
build_tbl("tb", year = 2018)
try(build_tbl("tb", year = 2014))

try(build_tbl("covid"))

build_tbl("tb", year = 2018:2020)
build_tbl("tb", year = 2014:2016) # fall-back on 2016 only

# `dx_gap` is computed automatically
stopifnot("dx_gap" %in% names(build_tbl("tb", year = 2018)))

# `estimated` and `notified` are always recovered from the arg. no need to
# specify them in `vars`
build_tbl(
  "tb",
  vars = c("year", "country_code", "pop_density"),
  estimated = "who_estimates.e_inc_num",
  notified = "who_notifications.c_newinc"
)

# fails since since we don't find a valid subset of core countries for which
# dx_gap can be computed if using `conf_rrmdr_tx`
try(
  build_tbl(
    "tb",
    vars = c("year", "country_code"),
    estimated = dxgap_diseases$estimated,
    notified = "who_notifications.conf_rrmdr_tx",
  )
)

# Missing report ---------------------------------------------------------------

render_report(
  "missing.Rmd",
  disease = "tb",
  year = 2016:2018,
  interactive = TRUE,
  vars = NULL
)

# fails: out of year range
try(
  render_report(
    "missing.Rmd",
    disease = "tb",
    year = 2014:2015,
    interactive = TRUE,
    vars = NULL
  )
)

render_report(
  "missing.Rmd",
  disease = "tb",
  year = 2016,
  interactive = TRUE,
  vars = NULL
)

# fall-back on supported years only
render_report(
  "missing.Rmd",
  disease = "tb",
  year = 2014:2016,
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

# EDA time series --------------------------------------------------------------

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

# fails: needs at least length 2 year
try(
  render_report(
    "eda_ts.Rmd",
    disease = "tb",
    vars = extract_vars("tb"),
    interactive = FALSE,
    year = 2019
  )
)

# TODO: fails correctly, however we should not show the msg and just the error
try(
  render_report(
    "eda_ts.Rmd",
    disease = "tb",
    vars = extract_vars("tb"),
    interactive = FALSE,
    year = 2014:2016
  )
)

# Cross sectional EDA ----------------------------------------------------------

render_report(
  "eda.Rmd",
  disease = "tb",
  year = 2019,
  vars = extract_vars("tb"),
  interactive = TRUE
)

# fails: conf_rrmdr_tx is out of supported vars known to be leading to "good"
# results
try(
  render_report(
    "eda.Rmd",
    disease = "tb",
    year = 2019,
    vars = c(extract_vars("tb"), "conf_rrmdr_tx"),
    interactive = TRUE
  )
)

# we can ignore the error with `override_vars_check`
render_report(
  "eda.Rmd",
  disease = "tb",
  year = 2019,
  vars = c(extract_vars("tb"), "conf_rrmdr_tx"),
  interactive = TRUE,
  override_vars_check = TRUE
)

render_report(
  "eda.Rmd",
  disease = "tb",
  year = 2016:2017,
  vars = extract_vars("tb"),
  interactive = FALSE
)

# fails and needs `interactive = FALSE`
try(
  render_report(
    "eda.Rmd",
    disease = "tb",
    year = 2016:2017,
    vars = extract_vars("tb"),
    interactive = TRUE
  )
)

# deprecated: we only use render_report
try(
  render_bulk(
    "eda.Rmd",
    disease = "tb",
    year = 2016:2021,
    vars = extract_vars("tb")
  )
)

# Modeling ---------------------------------------------------------------------

render_report(
  "explain_lm.Rmd",
  disease = "tb",
  year = 2019,
  vars = extract_vars("tb")
)

render_report(
  "explain_lm.Rmd",
  disease = "tb",
  year = 2016:2021,
  vars = extract_vars("tb"),
  interactive = FALSE
)

# It falls-back on supported 2016 and render just that
render_report(
  "explain_lm.Rmd",
  disease = "tb",
  year = 2014:2016,
  vars = extract_vars("tb"),
  interactive = FALSE
)


# fails and needs `interactive = FALSE`
try(
  render_report(
    "explain_lm.Rmd",
    disease = "tb",
    year = 2014:2017,
    vars = extract_vars("tb"),
    interactive = TRUE
  )
)

# however, if the fallback year is of length one, it goes ahead and it renders
# just that
render_report(
  "explain_lm.Rmd",
  disease = "tb",
  year = 2014:2016,
  vars = extract_vars("tb"),
  interactive = TRUE
)

# fails since deprecated
try(
  render_bulk(
    "explain_lm.Rmd",
    disease = "tb",
    year = 2016:2021,
    vars = extract_vars("tb")
  )
)

