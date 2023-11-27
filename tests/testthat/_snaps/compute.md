# compute_completion_rate() works

    Code
      constructive::construct(complete_rate_df_country)
    Output
      tibble::tibble(
        year = rep("2019", 43L),
        var_name = c(
          "bmu", "bmu_community_impl", "bmu_ref_data", "bmu_rxsupport_data",
          "bmu_rxsupport_data_coh", "budget_lab", "budget_oth", "budget_staff", "c_cdr",
          "c_newinc", "c_newinc_100k", "cf_lab", "cf_staff", "cf_tot_domestic",
          "cf_tot_gf", "cf_tot_grnt", "cf_tot_sources", "cf_tot_usaid", "country",
          "country_code", "culture", "e_inc_100k", "e_inc_num", "e_mort_100k",
          "e_pop_num", "gdp", "is_hbc", "new_labconf", "notified_ref",
          "notified_ref_community", "pop_density", "pop_total", "pop_urban_perc",
          "rcvd_lab", "rcvd_staff", "rcvd_tot_domestic", "rcvd_tot_gf", "rcvd_tot_grnt",
          "rcvd_tot_sources", "rcvd_tot_usaid", "smear", "total_numb_device", "xpert"
        ),
        completion_rate = c(
          0.51, 0.49, 0.34, 0.28, 0.28, 0.59, 0.51, 0.57, 1, 1, 1, 0.58, 0.57, 0.56,
          0.56, 0.49, 0.59, 0.44, 1, 1, 0.83, 1, 1, 0.99, 1, 0.97, 1, 1, 0.33, 0.32, 1,
          1, 1, 0.54, 0.53, 0.53, 0.53, 0.47, 0.57, 0.44, 0.82, 0.21, 0.81
        ),
      )

---

    Code
      constructive::construct(complete_rate_df_is_hbc)
    Output
      tibble::tibble(
        year = rep("2019", 84L),
        is_hbc = rep(c("0", "1"), each = 42L),
        var_name = rep(
          c(
            "bmu", "bmu_community_impl", "bmu_ref_data", "bmu_rxsupport_data",
            "bmu_rxsupport_data_coh", "budget_lab", "budget_oth", "budget_staff", "c_cdr",
            "c_newinc", "c_newinc_100k", "cf_lab", "cf_staff", "cf_tot_domestic",
            "cf_tot_gf", "cf_tot_grnt", "cf_tot_sources", "cf_tot_usaid", "country",
            "country_code", "culture", "e_inc_100k", "e_inc_num", "e_mort_100k",
            "e_pop_num", "gdp", "new_labconf", "notified_ref", "notified_ref_community",
            "pop_density", "pop_total", "pop_urban_perc", "rcvd_lab", "rcvd_staff",
            "rcvd_tot_domestic", "rcvd_tot_gf", "rcvd_tot_grnt", "rcvd_tot_sources",
            "rcvd_tot_usaid", "smear", "total_numb_device", "xpert"
          ),
          2
        ),
        completion_rate = c(
          0.45, 0.43, 0.28, 0.22, 0.22, 0.52, 0.44, 0.5, 1, 1, 1, 0.52, 0.5, 0.49, 0.5,
          0.42, 0.53, 0.39, 1, 1, 0.8, 1, 1, 1, 1, 0.98, 1, 0.27, 0.27, 1, 1, 1, 0.48,
          0.48, 0.48, 0.48, 0.42, 0.52, 0.39, 0.79, 0.19, 0.78, 0.89, 0.89, 0.7, 0.59,
          0.59, 1, 0.93, 1, 1, 1, 1, 1, 1, 1, 0.96, 0.89, 1, 0.78, 1, 1, 1, 1, 1, 0.96,
          1, 0.96, 1, 0.7, 0.67, 1, 1, 1, 0.85, 0.85, 0.85, 0.81, 0.81, 0.85, 0.74, 1,
          0.33, 1
        ),
      )

---

    Code
      constructive::construct(complete_rate_df_cars)
    Output
      tibble::tibble(
        var_name = c("am", "car_name", "carb", "cyl", "disp", "drat", "gear", "hp", "mpg", "qsec", "vs", "wt"),
        completion_rate = rep(1, 12L),
      )

