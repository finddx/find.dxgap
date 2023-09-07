findtb_import_bulk <- function(data_lst,
                           data_name,
                           year,
                           data_dir = Sys.getenv("FINDTB_DATADIR")) {
  list_arg <- rlang::ensym(data_lst)
  lst <- fetch_object(obj_name = !!list_arg, env = globalenv())
  for (i in seq_along(data_name)) {
    lst <- findtb_import(
      .data_lst = lst,
      .file_name = data_name[[i]],
      .year = year,
      .data_dir = data_dir
    )
  }

  lst
}

#' @example lst <- findtb_import(lst, "who_hbc.csv", 2019)
findtb_import <- function(.data_lst,
                          .file_name,
                          .year,
                          .all = TRUE,
                          .data_dir = Sys.getenv("FINDTB_DATADIR")) {

  # Extract file name ----------------------------------------------------------
  data_name <- extract_name(.file_name)

  data_summary <-
    data_summary |>
    dplyr::mutate(data_name = stringr::str_c(provider, dataset, sep = "_")) |>
    dplyr::filter(data_name == !!data_name)

  provider <-
    data_summary |>
    dplyr::pull(provider)

  dataset <-
    data_summary |>
    dplyr::pull(dataset)

  # Read -----------------------------------------------------------------------

  path_file <- compose_file_path(file_name = .file_name, data_dir = .data_dir)

  read_raw <- switch(
    data_name,
    who_budget = read_who,
    who_community = read_who,
    who_estimates = read_who,
    who_expenditures = read_who,
    who_laboratories = read_who,
    who_notifications = read_who,
    who_hbc = read_hbc,
    gf_procurement = read_gf_procurement,
    wb_pop_total = read_wb,
    wb_pop_density = read_wb,
    wb_pop_urban = read_wb,
    wb_gdp = read_wb
  )

  data_raw <- read_raw(path_file)

  # Tidy -----------------------------------------------------------------------

  tidy_data <- switch(
    data_name,
    who_budget = tidy_who,
    who_community = tidy_who,
    who_estimates = tidy_who,
    who_expenditures = tidy_who,
    who_laboratories = tidy_who,
    who_notifications = tidy_who,
    who_hbc = tidy_hbc,
    gf_procurement = tidy_gf_procurement,
    wb_pop_total = tidy_wb,
    wb_pop_density = tidy_wb,
    wb_pop_urban = tidy_wb,
    wb_gdp = tidy_wb
  )

  if (provider %in% c("who") && dataset != "hbc") {
    data_tidy <- tidy_data(data_raw, year = .year, .shape = "wide")
  } else {
    data_tidy <- tidy_data(data_raw, year = .year)
  }

  list_arg <- rlang::ensym(.data_lst)
  lst <- fetch_object(obj_name = !!list_arg, env = parent.frame())
  lst_names <- rlang::names2(lst)

  if (data_name %in% lst_names) {
    lst[[data_name]] <- data_tidy
  } else { # does not exist or first time
    next_item_index <- length(lst) + 1
    lst[[next_item_index]] <- data_tidy
    rlang::names2(lst)[next_item_index] <- data_name
  }

  lst

}

fetch_object <- function(obj_name, env) {
  obj <- rlang::ensym(obj_name)
  if (exists(obj, envir = env)) {
    get(obj, envir = env)
  } else {
    list()
  }
}

extract_name <- function(file_name) {
  stringr::str_remove_all(file_name, "\\d{4}-\\d{2}-\\d{2}\\_|\\.csv$") # TODO ext should not be hardcoded
}
