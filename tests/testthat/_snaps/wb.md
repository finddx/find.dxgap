# World Bank data is downloaded, read and tidied correctly

    Code
      raw <- read_wb_pop_density(path)
      constructive::construct(vctrs::vec_ptype(raw))
    Warning <rlang_warning>
      Could not use `colored = TRUE`, as the package prettycode is not installed. Please install it if you want to see colored output or see `?styler::print.vertical()` for more information.
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
      tidy <- tidy_wb_pop_density(raw)
      constructive::construct(vctrs::vec_ptype(tidy))
    Warning <rlang_warning>
      Could not use `colored = TRUE`, as the package prettycode is not installed. Please install it if you want to see colored output or see `?styler::print.vertical()` for more information.
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

