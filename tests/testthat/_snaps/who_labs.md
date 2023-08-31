# WHO labs data is downloaded, read and tidied correctly

    Code
      raw <- read_who(path)
      constructive::construct(vctrs::vec_ptype(raw))
    Warning <rlang_warning>
      Could not use `colored = TRUE`, as the package prettycode is not installed. Please install it if you want to see colored output or see `?styler::print.vertical()` for more information.
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
      tidy <- tidy_who(raw)
      constructive::construct(vctrs::vec_ptype(tidy))
    Warning <rlang_warning>
      Could not use `colored = TRUE`, as the package prettycode is not installed. Please install it if you want to see colored output or see `?styler::print.vertical()` for more information.
    Output
      tibble::tibble(
        country = character(0),
        country_code = character(0),
        g_whoregion = character(0),
        year = numeric(0),
        variable = character(0),
        value = numeric(0),
      )

