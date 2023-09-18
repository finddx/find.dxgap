#' Create folder containing data for the project.
#'
#' This function has side effects. It creates a folder storing data for the
#' project. In addition it sets the `DXGAP_DATADIR` environment variable which
#' is needed for the `read_*()` family of functions to work properly, in
#' particular when running tests.
#'
#' @param path a path where the folder should be created. By defeult, it is
#'   created at the same level of where the findtb project lives.
#' @param dirs a character vector with subfolders' names.
#'
#' @return the path to the folder, invisibly.
#' @export
#'
#' @examples path_findtb <- set_data_dir("~/Documents/my_projects")
set_data_dir <- function(path = fs::path_dir(getwd()),
                               dirs = c("who", "global-fund", "world-bank", "meta")) {
  if (!rlang::is_character(path) && length(path) != 1) {
    rlang::abort("Not a valid character path.")
  }
  if (!rlang::is_character(dirs)) {
    rlang::abort("Not a valid character vector.")
  }

  sys_findtb_data <- Sys.getenv("DXGAP_DATADIR")
  if (sys_findtb_data != "") {
    flag_ev_exists <- readline(
      prompt = paste(
        "The env. var. DXGAP_DATADIR already exists.",
        "Do you want to overwrite it [y/n]? "
      )
    )
    if (flag_ev_exists == "n") {
      return(invisible(sys_findtb_data))
    }
  }

  dir_name <- "findtb-data"
  path_to_datadir <- fs::path(path, dir_name)
  if (fs::dir_exists(path_to_datadir)) {
    flag_dir_exists <- readline(
      prompt = sprintf(
        "%s already exists. Do you want to overwrite it [y/n]? ",
        path_to_datadir
      )
    )
    if (flag_dir_exists == "n") {
      return(invisible(path_to_datadir))
    }
  }

  Sys.setenv("DXGAP_DATADIR" = path_to_datadir)

  tree <- fs::path(path_to_datadir, dirs)

  findtb_data_path <- fs::dir_create(tree)

  # TODO: what if run outside of the project? inst/exdata might not work
  fs::dir_copy("inst/extdata", path_to_datadir, overwrite = TRUE)

  create_readme(fs::path(path_to_datadir))

  if (fs::dir_exists(path_to_datadir)) {
    rlang::inform(sprintf("`%s` created successfully.", dir_name))
  }

  invisible(fs::path(path))
}

create_readme <- function(path) {
  readme <- c(
    "In `who` store...",
    "\n",
    "In `world-bank` store...",
    "\n",
    "In `global-fund` store...",
    "\n",
    "In `meta` store..."
  )
  path_to_readme <- fs::path(path, "README.md")
  ffile <- fs::file_create(path_to_readme)
  file_conn <- file(ffile)
  writeLines(readme, file_conn)
  close(file_conn)
  invisible(path_to_readme)
}
