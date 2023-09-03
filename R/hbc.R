download_hbc <- function(file_name = tempfile("who_hbc_list", fileext = ".pdf"),
                         url = "https://cdn.who.int/media/docs/default-source/hq-tuberculosis/who_globalhbcliststb_2021-2025_backgrounddocument.pdf?sfvrsn=f6b854c2_9",
                         data_dir = Sys.getenv("FINDTB_DATADIR")) {
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
  findtb_read_csv(...) |>
    tibble::as_tibble()
}

tidy_hbc <- function(data, .year = NULL) {
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
  if (!is.null(.year)) {
    df_subset <-
      df |>
      dplyr::mutate(year_end = year + 5) |>
      dplyr::mutate(year_user = .year) |>
      dplyr::filter(between(year_user, year, year_end)) |>
      dplyr::select(-year_end, -year_user)
    return(df_subset)
  }
  df
}
