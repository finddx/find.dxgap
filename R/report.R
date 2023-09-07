findtb_render_report <- function(template_path = "inst/template/findtb_policy_report.Rmd",
                                 year = 2019,
                                 output_file = NULL) {
  stopifnot(is.numeric(year))
  stopifnot(is.null(output_file) || is.character(output_file))

  lst_df <- findtb_load(.year = year)
  dm <- findtb_build_dm(lst_df)

  # if output_file is NULL knit to temp file and open with Viewer/Rstudio browser
  path <- if (is.null(output_file)) {
    temp_file <- tempfile(pattern = "findtb_policy_report", fileext = ".html")
    rmarkdown::render(
      input = template_path,
      output_file = temp_file,
      params = list(dm = dm, year = year),
      envir = new.env()
    )
  } else {
    rmarkdown::render(
      input = template_path,
      output_file = basename(output_file),
      output_dir = dirname(output_file),
      params = list(dm = dm, year = year),
      envir = new.env()
    )
  }
  rstudioapi::viewer(path)
  invisible(path)
}
