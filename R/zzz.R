.onLoad <- function(lib, pkg) {
  if (Sys.getenv("FINDTB_DATADIR") == "") {
    path <- file.path(dirname(getwd()), "findtb-data")
    Sys.setenv("FINDTB_DATADIR" = as.character(path))
  }
}

