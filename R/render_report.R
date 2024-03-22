#' Render a template report
#'
#' `render_report()` generates a report for a given template and year. The final
#' output can be viewed interactively in RStudio. Reports can also be rendered
#' across multiple years.
#'
#' @inheritParams build_tbl
#' @param template_name String containing the name of the template to render.
#'   Run [view_templates()] to see a list of valid options.
#' @param year Integer matching the year(s) of the report to be rendered. Can be
#'   a single integer like `2019`, or a vector of integers such as `2019:2021`.
#'   The argument is to passed to `build_dm()` under the hood.
#' @param interactive Logical indicating whether to open the report with the
#'   RStudio Viewer.
#' @param override_vars_check Logical indicating whether to override checks on
#'   supported vars. Defaults to FALSE. If TRUE, consistent results are not
#'   guaranteed.

#' @section On `override_vars_check`:
#' This check consists in comparing the character vector of variable names
#' supplied by the user through the `vars` argument, with those that were
#' selected in light of the exploratory data analysis. If some of the provided
#' variables are not part of the original subset, the function will throw an
#' error. However, new variables names can always be added overriding the check
#' by setting `override_vars_check = TRUE`. If a new variable name should be
#' part of the core subset, it should be added to the `dxgap_diseases` tibble.
#'
#' @export
#'
#' @examples \dontrun{
#' tb_vars <- c("year", "is_hbc", "country_code", "dx_gap",
#'              "pop_total", "pop_urban_perc", "pop_density", "gdp", "c_newinc",
#'              "e_inc_num", "e_mort_100k", "culture", "smear", "xpert", "m_wrd")
#' render_report(
#'   template_name = "eda.Rmd",
#'   disease = "tb",
#'   estimated = "who_estimates.e_inc_num",
#'   notified = "who_notifications.c_newinc",
#'   year = 2019,
#'   vars = tb_vars
#' )
#' }
render_report <- function(template_name,
                          disease,
                          estimated = NULL,
                          notified = NULL,
                          year = NULL,
                          vars = NULL,
                          interactive = TRUE,
                          override_vars_check = FALSE) {
  template_nm <- strip_ext(template_name)
  accept_ts <- extract_type_template(
    disease = disease,
    template_name = template_nm
  )
  year <- check_supported_year(year = year, disease = disease)
  multiple_years <- length(year) > 1
  does_not_accept_ts <- !accept_ts
  multi_cross_sectional <- multiple_years && does_not_accept_ts
  if (does_not_accept_ts) {
    check_interactive_render(year = year, interactive = interactive)
  }
  if (accept_ts && !is.null(year) && template_nm != "missing") {
    check_multi_year(year = year)
  }
  if (multi_cross_sectional) {
    paths <- render_bulk_impl(
      template_name = template_name,
      disease = disease,
      estimated = estimated,
      notified = notified,
      year = year,
      vars = vars,
      override_vars_check = override_vars_check
    )
    return(invisible(paths))
  }
  # either a ts-dm or a single_year-dm
  render_report_impl(
    template_name,
    disease,
    estimated = estimated,
    notified = notified,
    year = year,
    vars = vars,
    interactive = interactive,
    override_vars_check = override_vars_check
  )
}

render_report_impl <- function(template_name,
                               disease,
                               estimated,
                               notified,
                               year,
                               vars,
                               interactive,
                               override_vars_check,
                               template_dir = "inst/template/",
                               data_dir = Sys.getenv("DXGAP_DATADIR")) {
  check_supported_disease(disease)
  check_supported_templates(template = template_name, disease = disease)
  if (!override_vars_check) {
    check_supported_vars(vars = vars, disease = disease)
  }

  template_path <- compose_file_path(template_name, template_dir)

  lst_df <- build_lst(disease)
  dm <- build_dm(lst_df, year = year, estimated = estimated, notified = notified)

  # Here and not in `build_tbl_impl` since I don't have the disease there
  if (is.null(estimated)) {
    estimated <- extract_default_dxgap_tbl_field(
      disease = disease,
      dxgap_field = "estimated",
      output = "asis"
    )
  }

  if (is.null(notified)) {
    notified <- extract_default_dxgap_tbl_field(
      disease = disease,
      dxgap_field = "notified",
      output = "asis"
    )
  }
  data_tbl <- build_tbl_impl(dm, estimated = estimated, notified = notified, vars = vars)

  # if output_file is NULL knit to temp file and open with Viewer/Rstudio browser
  if (interactive) {
    temp_file <- tempfile(pattern = "my_rmd", fileext = ".html")
    rmarkdown::render(
      input = template_path,
      output_file = temp_file,
      output_format = "html_document",
      params = list(
        disease = disease,
        dm = dm,
        data_tbl = data_tbl,
        year = year
      ),
      envir = new.env()
    )
    rstudioapi::viewer(temp_file)
    return(invisible(temp_file))
  }

  if (is.null(year)) {
    file_name <- compose_file_name(
      fs::path_ext_remove(template_name),
      file_ext = ".html"
    )
  } else {
    file_name <- compose_file_name(
      fs::path_ext_remove(template_name),
      year,
      file_ext = ".html"
    )
  }

  out_path <- compose_file_path(file_name, file.path(data_dir, "report"))

  rmarkdown::render(
    input = template_path,
    output_file = basename(out_path),
    output_dir = dirname(out_path),
    output_format = "html_document",
    params = list(
      disease = disease,
      dm = dm,
      data_tbl = data_tbl,
      year = year
    ),
    envir = new.env()
  )
  invisible(out_path)
}

render_bulk_impl <- function(template_name,
                             disease,
                             estimated = NULL,
                             notified = NULL,
                             year = NULL,
                             vars = NULL,
                             override_vars_check = FALSE) {
  paths <- purrr::map(
    year,
    ~ render_report(
      disease = disease,
      estimated = estimated,
      notified = notified,
      template_name = template_name,
      year = .x,
      vars = vars,
      override_vars_check = override_vars_check,
      interactive = FALSE
    )
  )
  invisible(unlist(paths))
}

#' Render templates across multiple years
#'
#' `r lifecycle::badge("deprecated")`
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
#' @inheritParams build_tbl
#' @param override_vars_check Logical indicating whether to override checks on
#'   supported vars. Defaults to FALSE. If TRUE, consistent results are not
#'   guaranteed.
#' @param vars A vector of strings naming columns to subset the data on. Passed
#'   to [build_tbl()]. Defaults to NULL, indicating all variables should be
#'   used.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' tb_vars <- c("year", "is_hbc", "country_code", "dx_gap",
#'              "pop_total", "pop_urban_perc", "pop_density", "gdp", "c_newinc",
#'              "e_inc_num", "e_mort_100k", "culture", "smear", "xpert", "m_wrd")
#' render_bulk("eda.Rmd", disease = "tb", year = 2018:2021, vars = tb_vars)
#' }
render_bulk <- function(template_name,
                        disease,
                        estimated = NULL,
                        notified = NULL,
                        year = NULL,
                        vars = NULL,
                        override_vars_check = FALSE) {
  lifecycle::deprecate_stop(
    "0.1.1",
    "render_bulk()",
    details = "Please, use render_report()."
  )
  paths <- purrr::map(
    year,
    ~ render_report(
      disease = disease,
      estimated = estimated,
      notified = notified,
      template_name = template_name,
      year = .x,
      vars = vars,
      override_vars_check = override_vars_check,
      interactive = FALSE
    )
  )
  invisible(unlist(paths))
}
