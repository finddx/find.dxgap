#' Render templates across multiple years
#'
#' `render_bulk()` is a convenience wrapper around `render_report()` that
#' allows you to render templates across multiple years.
#'
#' @section Vars Check:
#' This check consists in comparing the character vector of variable names
#' supplied by the user through the `vars` argument, with those that were
#' selected in light of the exploratory data analysis. If some of the provided
#' variables are not part of the original subset, the function will throw an
#' error. However, new variables names can always be added overriding the check
#' by setting `override_vars_check = TRUE`. If a new variable name should be
#' part of the core subset, it should be added to the `dxgap_diseases` tibble.
#'
#'
#' @param template_name String containing the name of the template to render.
#'   Run [view_templates()] to see a list of valid options.
#' @inheritParams load_dx
#' @param override_vars_check Logical indicating whether to override checks on
#'   supported vars. Defaults to FALSE. If TRUE, consistent results are not
#'   guaranteed.
#' @param years Integer matching the year(s) of the report to be rendered. Can be
#'   a single integer like `2019`, or a vector of integers such as `2019:2021`.
#' @param vars A vector of strings naming columns to subset the data on. Passed
#'   to [build_tbl()]. Defaults to NULL, indicating all variables should be
#'   used.
#'
#' @rdname render
#'
#' @export
#'
#' @examples
#' \dontrun{
#' tb_vars <- c("year", "country", "is_hbc", "country_code", "who_dx_gap",
#'              "pop_total", "pop_urban_perc", "pop_density", "gdp", "c_newinc",
#'              "e_inc_num", "e_mort_100k", "culture", "smear", "xpert", "m_wrd")
#' render_bulk("eda.Rmd", disease = "tb", years = 2018:2021, vars = tb_vars)
#' }
render_bulk <- function(template_name, disease,  years = NULL, vars = NULL, override_vars_check = FALSE) {
  years <- purrr::walk(
    years,
    ~ render_report(
      disease = disease,
      template_name = template_name,
      year = .x,
      vars = vars,
      override_vars_check = override_vars_check,
      interactive = FALSE
    )
  )
  invisible(years)
}

#' Render a template report for a single year
#'
#' `render_report()` generates a report for a given template and year. The final
#' output can be viewed in RStudio.
#'
#' @inheritParams load_dx
#' @param year Integer matching the year of the report passed to [build_dm()].
#' @param interactive Logical indicating whether to open the report with the
#'   RStudio Viewer.
#'
#' @rdname render
#'
#' @export
#'
#' @examples \dontrun{
#' tb_vars <- c("year", "country", "is_hbc", "country_code", "who_dx_gap",
#'              "pop_total", "pop_urban_perc", "pop_density", "gdp", "c_newinc",
#'              "e_inc_num", "e_mort_100k", "culture", "smear", "xpert", "m_wrd")
#' render_report("eda.Rmd", disease = "tb", year = 2019, vars = tb_vars)
#' }
render_report <- function(template_name,
                          disease,
                          year = NULL,
                          vars = NULL,
                          interactive = TRUE,
                          override_vars_check = FALSE) {

  render_report_impl(
    template_name,
    disease,
    year = year,
    vars = vars,
    interactive = interactive,
    override_vars_check = override_vars_check
  )
}

render_report_impl <- function(template_name,
                               disease,
                               year,
                               vars,
                               interactive,
                               override_vars_check,
                               template_dir = "inst/template/",
                               data_dir = Sys.getenv("DXGAP_DATADIR")) {
  check_supported_disease(disease)
  check_supported_year(year = year, disease = disease)
  check_supported_templates(template = template_name, disease = disease)
  if (!override_vars_check) {
    check_supported_vars(vars = vars, disease = disease)
  }

  template_path <- compose_file_path(template_name, template_dir)

  lst_df <- load_dx(disease)
  dm <- build_dm(lst_df, year = year)
  data_tbl <- build_tbl(dm, vars = vars)

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
        year = year
      ),
      envir = new.env()
    )
    rstudioapi::viewer(temp_file)
    return(invisible(temp_file))
  }

  file_name <- compose_file_name(
    fs::path_ext_remove(template_name),
    year,
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
      year = year
    ),
    envir = new.env()
  )
  invisible(out_path)
}
