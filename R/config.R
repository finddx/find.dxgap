set_findtb_datadir <- function(path) {
  if (!rlang::is_character(path) && length(path) != 1) {
    rlang::abort("Not a valid character path.")
  }

  sys_findtb_data <- Sys.getenv("FINDTB_DATADIR")
  if (sys_findtb_data != "") {
    flag_ev_exists <- readline(
      prompt = paste(
        "The env. var. FINDTB_DATADIR already exists.",
        "Do you want to overwrite it [y/n]? "
      )
    )
  }

  if (flag_ev_exists == "n") {
    return(invisible(NULL))
  }

  dir_name <- "findtb_data"
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

  Sys.setenv("FINDTB_DATADIR" = path_to_datadir)

  dirs <- c("who", "global-fund", "world-bank", "meta")
  tree <- fs::path(path_to_datadir, dirs)

  findtb_data_path <- fs::dir_create(tree)
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
