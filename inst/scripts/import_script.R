pkgload::load_all()

lst_df <- import_bulk(
  c(
    "gf_2023-07-26_procurement.csv",
    "wb_2023-07-28_pop_urban.csv",
    "wb_2023-08-31_pop_total.csv",
    "wb_2023-09-07_gdp.csv",
    "wb_2023-10-04_pop_density.csv",
    "who_2023-07-28_budget.csv",
    "who_2023-07-28_community.csv",
    "who_2023-07-28_estimates.csv",
    "who_2023-07-28_expenditures.csv",
    "who_2023-07-28_hbc.csv",
    "who_2023-08-30_laboratories.csv",
    "who_2023-11-28_notifications.csv"
  )
)

tbl <- import_tbl("gf_2023-07-26_procurement.csv")
tbl <- import_tbl("wb_2023-07-28_pop_urban.csv")
tbl <- import_tbl("wb_2023-08-31_pop_total.csv")
tbl <- import_tbl("wb_2023-09-07_gdp.csv")
tbl <- import_tbl("wb_2023-10-04_pop_density.csv")
tbl <- import_tbl("who_2023-07-28_budget.csv")
tbl <- import_tbl("who_2023-07-28_community.csv")
tbl <- import_tbl("who_2023-07-28_estimates.csv")
tbl <- import_tbl("who_2023-07-28_expenditures.csv")
tbl <- import_tbl("who_2023-07-28_hbc.csv")
tbl <- import_tbl("who_2023-08-30_laboratories.csv")
tbl <- import_tbl("who_2023-11-28_notifications.csv")

