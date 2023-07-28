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

read_hbc <- function(file_name, data_dir = Sys.getenv("FINDTB_DATADIR")) {
  file_path <- compose_file_path(file_name = file_name, data_dir = data_dir)
  # TODO: extract table from pdf pdftools::pdf_text(file_path)[[8]]
  officer::read_docx(path = file_path) |>
    officer::docx_summary() |>
    tibble::as_tibble()
}

tidy_hbc <- function(data) {
  data |>
    dplyr::slice(1:30) |>
    dplyr::transmute(
      country = text,
      year = 2021,
      share_global_tb_incidence = c(rep(84, 20), rep(3, 10)),
      country_code = countrycode::countrycode(
        country,
        origin = "country.name",
        dest = "iso3c"
      )
    )
}
