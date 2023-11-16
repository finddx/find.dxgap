#' Render templates across multiple years
#'
#' `render_bulk()` is a convenience wrapper around [render_report()] that
#' allows you to render templates across multiple years.
#'
#' @param template_name String containing the name of the template to render.
#'   Run [view_templates()] to see a list of valid options.
#' @param year Integer matching the year(s) of the report to be rendered. Can be
#'   a single integer like `2019`, or a vector of integers such as `2019:2021`.
#' @param vars A vector of strings naming columns to subset the data on. Passed
#'   to [build_tbl()]. Defaults to NULL, indicating all variables should be
#'   used.
#'
#' @seealso [render_report()]
#'
#' @export
#'
#' @examples \dontrun{
#' render_bulk("eda.Rmd", year = 2018:2021, vars = dxgap_const$tb_vars)
#' }
render_bulk <- function(template_name, year = NULL, vars = NULL) {
  year <- purrr::walk(
    year,
    ~ render_report(
      .template_name = template_name,
      .year = .x,
      .vars = vars,
      interactive = FALSE
    )
  )
  invisible(year)
}

#' Render a template report for a single year
#'
#' `render_report()` generates a report for a given template and year.
#'
#' @param .template_name String containing the name of the template to render.
#'   Run [view_templates()] to see a list of valid options.
#' @param .year Integer matching the year of the report passed to [build_dm()].
#' @param .vars A vector of strings naming columns to subset the data on. Passed
#'   to [build_tbl()]. Defaults to NULL, indicating all variables should be
#'   used.
#' @param interactive Logical indicating whether to open the report with the
#'   RStudio Viewer.
#' @param template_dir Path where blank templates can be found. Defaults to
#'   `"inst/template/"`.
#' @param data_dir Path containing the directory to read the data from. Defaults
#'   to the path set by the environment variable `"DXGAP_DATADIR"`.
#'
#'
#' @seealso [render_bulk()]
#'
#' @export
#'
#' @examples \dontrun{
#' render_report("eda.Rmd", .year = 2019, .vars = dxgap_const$tb_vars)
#' }
render_report <- function(.template_name,
                          .disease,
                          .year = NULL,
                          .vars = NULL,
                          interactive = TRUE,
                          template_dir = "inst/template/",
                          data_dir = Sys.getenv("DXGAP_DATADIR")) {
  check_supported_disease(.disease)
  # TODO: check template per disease, or adopt more flexibility in templates
  template_path <- compose_file_path(.template_name, template_dir)

  lst_df <- load_dx(.disease)
  dm <- build_dm(lst_df, year = .year)
  data_tbl <- build_tbl(dm, vars = .vars)

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
