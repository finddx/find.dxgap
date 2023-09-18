pkgload::load_all()

lst_df <- import_bulk(lst_df, c("gf_2023-07-26_procurement.csv",
                                 "wb_2023-07-28_pop_urban.csv",
                                 "wb_2023-08-31_pop_density.csv",
                                 "wb_2023-09-07_gdp.csv",
                                 "wb_2023-08-31_pop_total.csv",
                                 "who_2023-07-28_budget.csv",
                                 "who_2023-07-28_community.csv",
                                 "who_2023-07-28_estimates.csv",
                                 "who_2023-07-28_expenditures.csv",
                                 "who_2023-07-28_notifications.csv",
                                 "who_2023-08-30_laboratories.csv",
                                 "who_hbc.csv"), 2019)

lst_df <- findtb_import(lst_df, "gf_2023-07-26_procurement.csv", 2019)
lst_df <- findtb_import(lst_df, "wb_2023-07-28_pop_urban.csv", 2019)
lst_df <- findtb_import(lst_df, "wb_2023-08-31_pop_density.csv", 2019)
lst_df <- findtb_import(lst_df, "wb_2023-08-31_pop_total.csv", 2019)
lst_df <- findtb_import(lst_df, "wb_2023-09-07_gdp.csv", 2019)
lst_df <- findtb_import(lst_df, "who_2023-07-28_budget.csv", 2019)
lst_df <- findtb_import(lst_df, "who_2023-07-28_community.csv", 2019)
lst_df <- findtb_import(lst_df, "who_2023-07-28_estimates.csv", 2019)
lst_df <- findtb_import(lst_df, "who_2023-07-28_expenditures.csv", 2019)
lst_df <- findtb_import(lst_df, "who_2023-07-28_notifications.csv", 2019)
lst_df <- findtb_import(lst_df, "who_2023-08-30_laboratories.csv", 2019)
lst_df <- findtb_import(lst_df, "who_hbc.csv", 2019)

lst_df
