# `country_code` entries are not missing

    Code
      dplyr::filter(dplyr::distinct(tidy_tb_dashboard(data, type = "time_series"),
      country_code, country), is.na(country_code))
    Output
      # A tibble: 0 x 2
      # i 2 variables: country_code <chr>, country <chr>

---

    Code
      dplyr::filter(dplyr::distinct(tidy_tb_dashboard(data, type = "fixed"),
      country_code, country), is.na(country_code))
    Output
      # A tibble: 0 x 2
      # i 2 variables: country_code <chr>, country <chr>

