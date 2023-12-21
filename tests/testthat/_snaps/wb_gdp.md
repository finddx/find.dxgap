# World Bank gdp data is read and tidied correctly

    Code
      constructive::construct(vctrs::vec_ptype(raw))
    Output
      tibble::tibble(
        page = numeric(0),
        indicator_id = character(0),
        indicator_value = character(0),
        country_id = character(0),
        country_value = character(0),
        countryiso3code = character(0),
        date = numeric(0),
        value = numeric(0),
        unit = logical(0) |>
          structure(class = "vctrs_unspecified"),
        obs_status = logical(0) |>
          structure(class = "vctrs_unspecified"),
        decimal = numeric(0),
        download_date = as.Date(character(0)),
      )
    Code
      constructive::construct(vctrs::vec_ptype(tidy))
    Output
      tibble::tibble(year = numeric(0), country_code = character(0), gdp = numeric(0))

---

    Code
      dplyr::filter(dplyr::distinct(tidy, country_code), is.na(country_code))
    Output
      # A tibble: 0 x 1
      # i 1 variable: country_code <chr>

