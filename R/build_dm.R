#' Build a dm model object
#'
#' `build_dm()` converts a list of tables into a dm object, extending the list
#' to include information on the relationship between the tables.
#'
#' @param data_list A list of tables, typically generated from [build_lst()].
#' @param year An integer indicating a year to filter the data on. Defaults to
#'   NULL, returning all years present in the data.
#'
#' @seealso [build_tbl()]
#'
#' @return An object of class dm, containing the same number of tables as in the
#' input `data_list`.
#'
#' @noRd
#'
#' @examples
#' \dontrun{
#' build_dm(
#'   build_lst("tb"),
#'   estimated = "who_estimates.e_inc_num",
#'   notified = "who_notifications.c_newinc"
#' ) # all years
#' build_dm(
#'   build_lst("tb"),
#'   estimated = "who_estimates.e_inc_num",
#'   notified = "who_notifications.c_newinc",
#'   year = 2019 # only 2019
#' )
#' }
build_dm <- function(data_list, estimated = NULL, notified = NULL, year = NULL) {
  disease <- attr(data_list, "disease")
  year <- check_supported_year(year = year, disease = disease)

  if (is.null(estimated)) {
    estimated <- extract_default_dxgap_tbl_field(
      disease = disease,
      output = "asis",
      dxgap_field = "estimated"
    )
  }
  if (is.null(notified)) {
    notified <- extract_default_dxgap_tbl_field(
      disease = disease,
      output = "asis",
      dxgap_field = "notified"
    )
  }

  core_lst <- get_core(
    data_list,
    estimated = estimated,
    notified = notified,
    year = year
  )

  dm_no_rel <- dm::dm(!!!core_lst)
  dm_col <- set_dm_colors(dm_no_rel)
  dm_disease <- set_dm_rels(dm_col)

  dm_disease

}

set_dm_rels <- function(dm) {
  dm |>
    set_dm_pk_parent() |>
    set_dm_pk() |>
    set_dm_fk()
}

set_dm_pk <- function(dm) {
  dm |>
    dm::dm_add_pk(hbc, country_code, check = TRUE) |>
    dm::dm_add_pk(wb_pop_total, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(wb_pop_urban, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(wb_pop_density, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(wb_gdp, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_notifications, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_estimates, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_budget, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_community, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_laboratories, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_expenditures, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(gf_procurement, c(year, country_code), check = TRUE)
}

set_dm_fk <- function(dm) {
  dm |>
    dm::dm_add_fk(country, country_code, hbc) |>
    dm::dm_add_fk(country, c(year, country_code), wb_pop_total) |>
    dm::dm_add_fk(country, c(year, country_code), wb_pop_urban) |>
    dm::dm_add_fk(country, c(year, country_code), wb_pop_density) |>
    dm::dm_add_fk(country, c(year, country_code), wb_gdp) |>
    dm::dm_add_fk(country, c(year, country_code), who_notifications) |>
    dm::dm_add_fk(country, c(year, country_code), who_estimates) |>
    dm::dm_add_fk(country, c(year, country_code), who_budget) |>
    dm::dm_add_fk(country, c(year, country_code), who_community) |>
    dm::dm_add_fk(country, c(year, country_code), who_laboratories) |>
    dm::dm_add_fk(country, c(year, country_code), who_expenditures) |>
    dm::dm_add_fk(country, c(year, country_code), gf_procurement)
}

set_dm_pk_parent <- function(dm) {
  dm |>
    dm::dm_add_pk(country, c(year, country_code), check = TRUE)
}

set_dm_colors <- function(dm) {
  dm |>
    dm::dm_set_colors(
      "#5986C4" = starts_with("who"),
      "#70AD47FF" = starts_with("wb"),
      "#ED7D31FF" = contains("country")
    )
}
