# WHO labs data is read and tidied correctly

    Code
      constructive::construct(vctrs::vec_ptype(raw))
    Output
      tibble::tibble(
        country = character(0),
        iso3 = character(0),
        g_whoregion = character(0),
        year = numeric(0),
        culture = numeric(0),
        lab_cul = numeric(0),
        lab_sm = numeric(0),
        smear = numeric(0),
        lab_xpert = numeric(0),
        xpert = numeric(0),
        m_wrd = numeric(0),
        m_wrd_tests_performed = numeric(0),
        m_wrd_tests_positive = numeric(0),
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

# `country_code` entries are not missing

    Code
      dplyr::filter(dplyr::distinct(tidy, country_code, country), is.na(country_code))
    Output
      # A tibble: 0 x 2
      # i 2 variables: country_code <chr>, country <chr>

