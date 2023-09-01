# World Bank data is read and tidied correctly

    Code
      constructive::construct(vctrs::vec_ptype(raw))
    Warning <rlang_warning>
      Could not use `colored = TRUE`, as the package prettycode is not installed. Please install it if you want to see colored output or see `?styler::print.vertical()` for more information.
    Output
      tibble::tibble(
        page = numeric(0),
        indicator_id = character(0),
        indicator_value = character(0),
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
    Warning <rlang_warning>
      Could not use `colored = TRUE`, as the package prettycode is not installed. Please install it if you want to see colored output or see `?styler::print.vertical()` for more information.
    Output
      tibble::tibble(
        indicator_value = character(0),
        country_code = character(0),
        country_value = character(0),
        year = numeric(0),
        value = numeric(0),
      )

# `country_code` entries are not missing

    Code
      dplyr::filter(dplyr::distinct(tidy, country_code, country_value), is.na(
        country_code))
    Output
      # A tibble: 5 x 2
        country_code country_value      
        <chr>        <chr>              
      1 <NA>         High income        
      2 <NA>         Low income         
      3 <NA>         Lower middle income
      4 <NA>         Not classified     
      5 <NA>         Upper middle income

