.onLoad <- function(lib, pkg) {
  if (Sys.getenv("DXGAP_DATADIR") == "") {
    path <- file.path(dirname(getwd()), "find.dxgap.data")
    Sys.setenv("DXGAP_DATADIR" = as.character(path))
  }
}

