skip_if_no_data <- function(file_name,
                            data_dir = Sys.getenv("FINDTB_DATADIR")) {
  skip_if(data_dir == "")
  path <- file.path(data_dir, file_name)
  skip_if(!file.exists(path))
}

compose_date_dataset_file_name <- function(...,
                                           download_date = as.character(Sys.Date()),
                                           dataset = "notifications") {
  compose_file_name(..., download_date, dataset)
}

compose_file_name <- function(..., sep = "_", file_ext = NULL) {
  dots <- rlang::dots_list(...)
  if (is.null(file_ext)) {
    file_name <- paste(dots, collapse = sep)
    return(file_name)
  }
  paste0(paste(dots, collapse = sep), file_ext)
}

findtb_read_csv <- function(file_name, data_dir = Sys.getenv("FINDTB_DATADIR"), ...) {
  file_path <- compose_file_path(file_name = file_name, data_dir = data_dir)
  readr::read_csv(file_path, show_col_types = FALSE, ...)
}

req_perform_lazy <- function(req) {
  stopifnot(inherits(req, "httr2_request"))
  Sys.sleep(3)
  httr2::req_perform(req = req)
}
