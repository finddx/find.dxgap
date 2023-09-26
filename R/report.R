render_report <- function(template_name,
                                 year = 2019,
                                 output_file = NULL,
                          template_dir = "inst/template/") {
  stopifnot(is.numeric(year))
  stopifnot(is.null(output_file) || is.character(output_file))

  template_path <- compose_file_path(template_name, template_dir)

  lst_df <- load()
  dm <- build_dm(lst_df, year = year)
  data_tbl <- build_tbl(dm)

  # if output_file is NULL knit to temp file and open with Viewer/Rstudio browser
  path <- if (is.null(output_file)) {
    temp_file <- tempfile(pattern = "my_rmd", fileext = ".html")
    rmarkdown::render(
      input = template_path,
      output_file = temp_file,
      params = list(
        dm = dm,
        data_tbl = data_tbl,
        year = year
      ),
      envir = new.env()
    )
  } else {
    rmarkdown::render(
      input = template_path,
      output_file = basename(output_file),
      output_dir = dirname(output_file),
      params = list(
        dm = dm,
        data_tbl = data_tbl,
        year = year
      ),
      envir = new.env()
    )
  }
  rstudioapi::viewer(path)
  invisible(path)
}
