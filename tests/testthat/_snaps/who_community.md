# WHO community data is read and tidied correctly

    Code
      constructive::construct(vctrs::vec_ptype(raw))
    Output
      tibble::tibble(
        country = character(0),
        iso3 = character(0),
        g_whoregion = character(0),
        year = numeric(0),
        bmu = numeric(0),
        bmu_community_impl = numeric(0),
        bmu_ref_data = numeric(0),
        bmu_rxsupport_data = numeric(0),
        bmu_rxsupport_data_coh = numeric(0),
        notified_ref = numeric(0),
        notified_ref_community = numeric(0),
        download_date = character(0),
      )
    Code
      constructive::construct(vctrs::vec_ptype(tidy))
    Output
      tibble::tibble(
        country_code = character(0),
        year = numeric(0),
        variable = character(0),
        value = numeric(0),
      )

---

    Code
      dplyr::filter(dplyr::distinct(tidy, country_code), is.na(country_code))
    Output
      # A tibble: 0 x 1
      # i 1 variable: country_code <chr>

