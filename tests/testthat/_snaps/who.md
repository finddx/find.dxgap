# WHO notifications data is downloaded, read and tidied correctly

    Code
      raw <- read_who(path)
      constructive::construct(vctrs::vec_ptype(raw))
    Warning <rlang_warning>
      Could not use `colored = TRUE`, as the package prettycode is not installed. Please install it if you want to see colored output or see `?styler::print.vertical()` for more information.
    Output
      tibble::tibble(
        country = character(0),
        year = numeric(0),
        c_newinc = numeric(0),
        new_labconf = numeric(0),
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
        year = numeric(0),
        c_newinc = numeric(0),
        new_labconf = numeric(0),
      )

