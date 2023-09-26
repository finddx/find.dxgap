render_bulk <- function(template_name, year) {
  year <- purrr::walk(
    year,
    ~ render_report(
      .template_name = template_name,
      .year = .x,
      interactive = FALSE
    )
  )
  invisible(year)
}

render_report <- function(.template_name,
                                 .year = 2019,
                                 interactive = TRUE,
                          template_dir = "inst/template/",
                          data_dir = Sys.getenv("DXGAP_DATADIR")) {
  stopifnot(is.numeric(.year))

  template_path <- compose_file_path(.template_name, template_dir)

  lst_df <- load()
  dm <- build_dm(lst_df, year = .year)
  data_tbl <- build_tbl(dm)

  # if output_file is NULL knit to temp file and open with Viewer/Rstudio browser
  if (interactive) {
    temp_file <- tempfile(pattern = "my_rmd", fileext = ".html")
    rmarkdown::render(
      input = template_path,
      output_file = temp_file,
      output_format = "html_document",
      params = list(
        dm = dm,
        data_tbl = data_tbl,
        year = .year
      ),
      envir = new.env()
    )
    rstudioapi::viewer(temp_file)
    return(invisible(temp_file))
  }

  file_name <- compose_file_name(
    fs::path_ext_remove(.template_name),
    .year,
    file_ext = ".html"
  )

  out_path <- compose_file_path(file_name, file.path(data_dir, "report"))

  rmarkdown::render(
    input = template_path,
    output_file = basename(out_path),
    output_dir = dirname(out_path),
    output_format = "html_document",
    params = list(
      dm = dm,
      data_tbl = data_tbl,
      year = .year
    ),
    envir = new.env()
  )
  invisible(out_path)
}
