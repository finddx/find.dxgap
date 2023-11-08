dxgap_tb_tables <- tibble::tribble(
  ~provider_id, ~dataset_type, ~extension,
  "gf", "procurement", "csv",
  "wb", "pop_urban", "csv",
  "wb", "pop_density", "csv",
  "wb", "pop_total", "csv",
  "wb", "gdp", "csv",
  "who", "budget", "csv",
  "who", "community", "csv",
  "who", "estimates", "csv",
  "who", "expenditures", "csv",
  "who", "notifications", "csv",
  "who", "laboratories", "csv",
  "who", "hbc", "csv"
)

dxgap_diseases <- tibble::tribble(
  ~disease, ~start_year, ~end_year, ~tables,
  "tb",     2016,         2021,     dxgap_tb_tables,
  "covid",  NA,           NA,       NA
)


