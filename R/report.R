findtb_render_report <- function(template_path = "inst/template/eda.Rmd",
                                 year = 2019,
                                 output_file = NULL) {
  stopifnot(is.numeric(year))
  stopifnot(is.null(output_file) || is.character(output_file))

  lst_df <- findtb_load(.year = year)
  dm_hbc <- findtb_build_dm(lst_df, hbc = TRUE)
  dm_non_hbc <- findtb_build_dm(lst_df, hbc = FALSE)
  data_tbl <- findtb_build_tbl(dm_hbc, dm_non_hbc)

  # if output_file is NULL knit to temp file and open with Viewer/Rstudio browser
  path <- if (is.null(output_file)) {
    temp_file <- tempfile(pattern = "my_rmd", fileext = ".html")
    rmarkdown::render(
      input = template_path,
      output_file = temp_file,
      params = list(
        dm_hbc = dm_hbc,
        dm_non_hbc = dm_non_hbc,
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
        dm_hbc = dm_hbc,
        dm_non_hbc = dm_non_hbc,
        data_tbl = data_tbl,
        year = year
      ),
      envir = new.env()
    )
  }
  rstudioapi::viewer(path)
  invisible(path)
}
