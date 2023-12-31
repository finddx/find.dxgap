dxgap_tb_tables <- tibble::tribble(
  ~provider_id,   ~dataset_type, ~extension,
    "gf",    "procurement",        "csv",
    "wb",      "pop_urban",        "csv",
    "wb",    "pop_density",        "csv",
    "wb",      "pop_total",        "csv",
    "wb",            "gdp",        "csv",
    "who",        "budget",        "csv",
    "who",     "community",        "csv",
    "who",     "estimates",        "csv",
    "who",  "expenditures",        "csv",
    "who", "notifications",        "csv",
    "who",  "laboratories",        "csv",
    "who",           "hbc",        "csv"
)

dxgap_tb_templates <- tibble::tribble(
  ~template_id,
  "explain_lm",
  "eda_ts",
  "eda",
  "missing"
)

dxgap_const <- tibble::lst(
  start_year = 2015,
  tb_vars = c("year",
           "country",
           "is_hbc",
           "country_code",
           "dx_gap",
           "pop_total",
           "pop_urban_perc",
           "pop_density",
           "gdp",
           "c_newinc",
           "e_inc_num",
           "e_mort_100k",
           "culture",
           "smear",
           "xpert",
           "m_wrd")
)

dxgap_tb_vars <- tibble::tibble(
  vars = c("year",
           "country",
           "is_hbc",
           "country_code",
           "dx_gap",
           "pop_total",
           "pop_urban_perc",
           "pop_density",
           "gdp",
           "c_newinc",
           "e_inc_num",
           "e_mort_100k",
           "culture",
           "smear",
           "xpert",
           "m_wrd")
)

dxgap_diseases <- tibble::tribble(
  ~disease, ~start_year, ~end_year, ~tables,         ~template,         ~vars,
  "tb",     2016,         2021,     dxgap_tb_tables, dxgap_tb_templates, dxgap_tb_vars
)

