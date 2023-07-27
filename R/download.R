download_hbc <- function(file_name = tempfile("who_hbc_list", fileext = ".pdf"),
                         url = "https://cdn.who.int/media/docs/default-source/hq-tuberculosis/who_globalhbcliststb_2021-2025_backgrounddocument.pdf?sfvrsn=f6b854c2_9",
                         data_dir = Sys.getenv("FINDTB_DATADIR")) {
  file_path <- if (fs::is_absolute_path(file_name)) {
    file_name
  } else {
    file.path(data_dir, file_name)
  }
  download.file(url, file_path)
  invisible(normalizePath(file_path))
}


download_who <- function(file_name = tempfile(
                                        compose_file_name("who", download_date, dataset),
                                        fileext = ".csv"
                                      ),
                         dataset = "notification",
                         download_date = as.character(Sys.Date()),
                         data_dir = Sys.getenv("FINDTB_DATADIR")) {
  dataset <- rlang::arg_match(dataset, who_url_endpoints$dataset)
  url <-  "https://extranet.who.int/tme/generateCSV.asp?ds="
  endpoint <-
    who_url_endpoints |>
    dplyr::filter(dataset == !!dataset) |>
    dplyr::pull(url_endpoint)
  url_topic <- paste0(url, endpoint)
  file_path <- compose_file_path(file_name, data_dir)

  data <- readr::read_csv(url_topic)
  subset_cols <-
    read_masterlist("tb_find_variable_masterlist.csv", data_dir = data_dir) |>
    tidy_masterlist() |>
    dplyr::filter(dataset == !!dataset) |>
    dplyr::pull(variable_name)
  relevant_cols <- c("country", "year", subset_cols)
  data_subset <-
    dplyr::select(data, tidyselect::all_of(relevant_cols)) |>
    dplyr::mutate(download_date = download_date)

  out_dir_findtb <- file.path("inst/extdata", file_name)
  final_paths <- c(out_dir_findtb, file_path)
  purrr::walk(paste0(final_paths, ".csv"), ~ readr::write_csv(data_subset, .x))
  invisible(normalizePath(file_path))
}




