# `country_code` entries are not missing

    Code
      dplyr::filter(dplyr::distinct(tidy_who_hbc(data), country_code), is.na(
        country_code))
    Output
      # A tibble: 0 x 1
      # i 1 variable: country_code <chr>

