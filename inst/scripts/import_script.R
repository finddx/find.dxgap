pkgload::load_all()

lst_df <- import_bulk(
  c(
    "gf_procurement_2023-07-26.csv",
    "wb_pop_urban_2023-07-28.csv",
    "wb_2023-08-31_pop_total.csv",
    "wb_gdp_2023-09-07.csv",
    "wb_pop_density_2023-10-04.csv",
    "who_budget_2023-07-28.csv",
    "who_community_2023-07-28.csv",
    "who_estimates_2023-07-28.csv",
    "who_expenditures_2023-07-28.csv",
    "who_hbc_2023-07-28.csv",
    "who_laboratories_2023-08-30.csv",
    "who_notifications_2023-11-28.csv"
  )
)

tbl <- import_tbl("gf_procurement_2023-07-26.csv")
tbl <- import_tbl("wb_pop_urban_2023-07-28.csv")
tbl <- import_tbl("wb_2023-08-31_pop_total.csv")
tbl <- import_tbl("wb_gdp_2023-09-07.csv")
tbl <- import_tbl("wb_pop_density_2023-10-04.csv")
tbl <- import_tbl("who_budget_2023-07-28.csv")
tbl <- import_tbl("who_community_2023-07-28.csv")
tbl <- import_tbl("who_estimates_2023-07-28.csv")
tbl <- import_tbl("who_expenditures_2023-07-28.csv")
tbl <- import_tbl("who_hbc_2023-07-28.csv")
tbl <- import_tbl("who_laboratories_2023-08-30.csv")
tbl <- import_tbl("who_notifications_2023-11-28.csv")

