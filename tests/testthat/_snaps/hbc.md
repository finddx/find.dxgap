# `country_code` entries are not missing

    Code
      dplyr::filter(dplyr::distinct(tidy_hbc(data), country_code, country), is.na(
        country_code))
    Output
      # A tibble: 0 x 2
      # i 2 variables: country_code <chr>, country <chr>

