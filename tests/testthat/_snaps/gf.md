# `country_code` entries are not missing

    Code
      dplyr::filter(dplyr::distinct(tidy_gf_procurement(data), country_code, year),
      is.na(country_code))
    Output
      # A tibble: 0 x 2
      # i 2 variables: country_code <chr>, year <dbl>

