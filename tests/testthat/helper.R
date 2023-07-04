skip_if_no_data <- function(file_name,
                            data_dir = Sys.getenv("FINDTB_DATADIR")) {
  skip_if(data_dir == "")
  path <- file.path(data_dir, file_name)
  skip_if(!file.exists(path))
}
