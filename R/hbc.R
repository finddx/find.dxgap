#' TB High-Burden Countries data from WHO
#'
#' WHO each five years lists the 20 + 10 countries classified as "High-Burden".
#' * The first 20 account for roughly 80%
#' of the share of global incidence for a given 5 years period.
#' * The last 10 accounts for roughly 2%-3% of the share of global incidence for
#' a given 5 years period.
#'
#' @name hbc
NULL

#' Download TB High-Burden Countries data set
#'
#' @inheritParams download_who
#' @rdname hbc
#' @return `download_hbc()` returns invisibly the file path in which data are
#'   stored.
#' @export
#' @examples
#' \dontrun{
#' download_hbc("who_2023-07-28_hbc.pdf")
#' }
download_hbc <- function(file_name) {
  download_hbc_impl(.file_name = file_name)
}

download_hbc_impl <- function(.file_name = tempfile("who_hbc_list", fileext = ".pdf"),
                              .url = "https://cdn.who.int/media/docs/default-source/hq-tuberculosis/who_globalhbcliststb_2021-2025_backgrounddocument.pdf?sfvrsn=f6b854c2_9",
                              .data_dir = Sys.getenv("DXGAP_DATADIR")) {
  file_path <- if (fs::is_absolute_path(file_name)) {
    file_name
  } else {
    file.path(data_dir, file_name)
  }
  download.file(url, file_path)
  invisible(normalizePath(file_path))
}

#' Read TB High-Burden Countries data set
#'
#' `read_who_hbc()` reads a file generated manually using the pdf downloaded from
#' `download_hbc()`.
#'
#' @param file_name A string containing the name of the file to be read.
#' @inheritParams read_who
#' @rdname hbc
#' @return `read_who_hbc()` returns a tibble containing the data set.
#' @noRd
#' @examples
#' \dontrun{
#' read_who_hbc("who_2023-07-28_hbc.csv")
#' }
read_who_hbc <- function(file_name, data_dir = Sys.getenv("DXGAP_DATADIR")) {
  # TODO: extract table from pdf pdftools::pdf_text(file_path)[[8]]
  dxgap_read_csv(file_name = file_name, data_dir = data_dir) |>
    tibble::as_tibble()
}

#' Tidy Global Fund data sets
#'
#' @inheritParams tidy_who
#' @param all Whether to return the 20 + 10 subset, or just the first 20
#'   countries. Default to `TRUE`.
#' @rdname hbc
#' @return `tidy_hbc()` returns a tibble. This is a tidied version of the input
#'   tibble.
#' @noRd
#' @examples
#' \dontrun{
#' read_who_hbc("who_2023-07-28_hbc.csv") |>
#'   tidy_hbc()
#' }
tidy_who_hbc <- function(data, .year = NULL, all = TRUE) {
  df <-
    data |>
    dplyr::mutate(
      country_code = countrycode::countrycode(
        country,
        origin = "country.name",
        dest = "iso3c"
      ),
      .after = country
    )

  grown_df <- grow_hbc(df)

  df <-
    df |>
    dplyr::full_join(
      grown_df,
      dplyr::join_by(country_code, year_from == year_from_id)
    ) |>
    dplyr::select(-year_from)

  if (!all) {
    df <-
      df |>
      dplyr::filter(share_global_inc > 80)
  }

  if (!is.null(.year)) {
    df_subset <-
      df |>
      dplyr::filter(year == !!.year)
    return(df_subset)
  }
  df
}

grow_hbc <- function(data) {
  data |>
    dplyr::mutate(year_from_id = year_from) |>
    tidyr::nest(.key = "hbc_data", .by = year_from_id) |>
    dplyr::mutate(hbc_data = purrr::map(
      hbc_data,
      ~ dplyr::mutate(.x, year_to = year_from + 4)
      )
    ) |>
    dplyr::mutate(hbc_data = purrr::map(
      hbc_data,
      ~ tidyr::pivot_longer(.x, tidyselect::starts_with("year"), names_to = NULL)
      )
    ) |>
    dplyr::mutate(hbc_data = purrr::map(
      hbc_data,
      ~ tidyr::expand(.x, country_code, year = tidyr::full_seq(value, 1))
      )
    ) |>
    tidyr::unnest(hbc_data)
}

tidy_hbc2 <- function(data) {
  data |>
    dplyr::select(country_code, year) |>
    dplyr::mutate(country = countrycode::countrycode(
      country_code,
      origin = "iso3c",
      dest = "country.name"
    ))
}
