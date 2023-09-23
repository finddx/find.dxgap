download_hbc <- function(file_name = tempfile("who_hbc_list", fileext = ".pdf"),
                         url = "https://cdn.who.int/media/docs/default-source/hq-tuberculosis/who_globalhbcliststb_2021-2025_backgrounddocument.pdf?sfvrsn=f6b854c2_9",
                         data_dir = Sys.getenv("DXGAP_DATADIR")) {
  file_path <- if (fs::is_absolute_path(file_name)) {
    file_name
  } else {
    file.path(data_dir, file_name)
  }
  download.file(url, file_path)
  invisible(normalizePath(file_path))
}

read_hbc <- function(...) {
  # TODO: extract table from pdf pdftools::pdf_text(file_path)[[8]]
  dxgap_read_csv(...) |>
    tibble::as_tibble()
}

tidy_hbc <- function(data, year = NULL, all = TRUE) {
  df <-
    data |>
    dplyr::mutate(
      country_code = countrycode::countrycode(
        country,
        origin = "country.name",
        dest = "iso3c"
      ),
      .after = country
    )

  if (!all) {
    df <-
      df |>
      dplyr::filter(share_global_inc > 80)
  }

  if (!is.null(year)) {
    df_subset <-
      df |>
      dplyr::mutate(year_end = year_from + 4) |>
      dplyr::mutate(year_user = !!year) |>
      dplyr::filter(year_user > year & year_user <= year_end) |>
      dplyr::select(-year_end, -year_user)
    return(df_subset)
  }
  df
}

get_hbc_core <- function(data) {
  years_unique <-
    data |>
    dplyr::distinct(year) |>
    dplyr::pull(year)

  if (length(years_unique) <= 1) {
    rlang::abort(
      c("Cannot build `core high TB burden country` data across years.",
      i = "Did you call `tidy_hbc(data, year = NULL)`?.")
    )
  }

  data |>
    dplyr::select(country_code, year) |>
    dplyr::group_split(year) |>
    purrr::reduce(dplyr::inner_join, by = dplyr::join_by(country_code)) |>
    dplyr::select(-tidyselect::starts_with("year"))
}
