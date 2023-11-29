# WHO budget data is read and tidied correctly

    Code
      constructive::construct(vctrs::vec_ptype(raw))
    Output
      tibble::tibble(
        country = character(0),
        iso3 = character(0),
        g_whoregion = character(0),
        year = numeric(0),
        budget_lab = numeric(0),
        budget_oth = numeric(0),
        budget_staff = numeric(0),
        cf_lab = numeric(0),
        cf_staff = numeric(0),
        cf_tot_domestic = numeric(0),
        cf_tot_gf = numeric(0),
        cf_tot_grnt = numeric(0),
        cf_tot_sources = numeric(0),
        cf_tot_usaid = numeric(0),
        download_date = character(0),
      )
    Code
      constructive::construct(vctrs::vec_ptype(tidy))
    Output
      tibble::tibble(
        country = character(0),
        country_code = character(0),
        g_whoregion = character(0),
        year = numeric(0),
        variable = character(0),
        value = numeric(0),
      )

---

    Code
      dplyr::filter(dplyr::distinct(tidy, country_code, country), is.na(country_code))
    Output
      # A tibble: 0 x 2
      # i 2 variables: country_code <chr>, country <chr>

