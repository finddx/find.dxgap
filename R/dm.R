build_tbl <- function(dm) {
  dm |>
    dm::dm_flatten_to_tbl(.start = country) |>
    dplyr::filter(!dplyr::if_all(-c(country_code), is.na)) |>
    dplyr::relocate(is_hbc, country_code, year, .before = everything())
}

build_dm <- function(data_list, year = NULL) {
  # TODO: max year should be computed from the who estimates and notification data
  max_year <- lubridate::year(lubridate::today()) - 2
  if (!is.null(year) && year > max_year) {
    rlang::abort(sprintf("Data available up to %s.", max_year))
  }
  core_data <- get_core(data_list)
  core_list <- core_data$core_list
  can_compute_dxgap <- core_data$can_compute_dxgap
  non_parent <- setdiff(names(core_list), "hbc")
  subset_lst <- drop_cols(core_list, non_parent,  c("country", "g_whoregion"))

  hbc_df <-
    data_list$hbc |>
    dplyr::semi_join(subset_lst$hbc, dplyr::join_by(country_code)) |>
    dplyr::select(country_code, year, country) |>
    dplyr::mutate(is_hbc = 1)

  non_hbc_df <-
    get_non_hbc_country_code(hbc_df) |>
    dplyr::semi_join(can_compute_dxgap, dplyr::join_by(country_code)) |>
    dplyr::mutate(is_hbc = 0)

  # estimates and notifications are available up to given year
  country_df <- hbc_df |>
    dplyr::bind_rows(non_hbc_df) |>
    dplyr::filter(year <= max_year)

  subset_lst$hbc <- NULL
  subset_lst$country <- country_df

  dm_no_rel <- dm::dm(!!!subset_lst)
  dm_col <- set_dm_colors(dm_no_rel)
  dm_ts <- set_dm_rels(dm_col)

  if (is.null(year)) {
    return(dm_ts)
  }

  dm::dm_filter(dm_ts, country = (year == !!year))

}

drop_cols <- function(data_list, at, cols_to_drop) {
  data_list |>
    purrr::map_at(.at = at, .f = ~ dplyr::select(.x, -tidyselect::any_of(cols_to_drop)))
}

get_non_hbc_country_code <- function(hbc_df) {
  countrycode::codelist |>
    dplyr::select(country_code = iso3c, country = country.name.en) |>
    dplyr::filter(!is.na(country_code)) |>
    dplyr::anti_join(hbc_df, by = dplyr::join_by(country_code)) |>
    dplyr::anti_join(country_exclude_df, by = dplyr::join_by(country_code)) |>
    tidyr::crossing(year = 2016:2099) # start from the min year available in hbc list
}

set_dm_rels <- function(dm) {
  dm |>
    set_dm_pk_parent() |>
    set_dm_pk() |>
    set_dm_fk()
}

set_dm_pk <- function(dm) {
  dm |>
    dm::dm_add_pk(wb_tot_pop, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(wb_urb_pop, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(wb_density_pop, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(wb_gdp, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_notifications, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_estimates, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_budget, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_community, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_sites, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(who_expenditures, c(year, country_code), check = TRUE) |>
    dm::dm_add_pk(gf_procurement, c(year, country_code), check = TRUE)
}

set_dm_fk <- function(dm, parent_tbl) {
  dm |>
    dm::dm_add_fk(country, c(year, country_code), wb_tot_pop) |>
    dm::dm_add_fk(country, c(year, country_code), wb_urb_pop) |>
    dm::dm_add_fk(country, c(year, country_code), wb_density_pop) |>
    dm::dm_add_fk(country, c(year, country_code), wb_gdp) |>
    dm::dm_add_fk(country, c(year, country_code), who_notifications) |>
    dm::dm_add_fk(country, c(year, country_code), who_estimates) |>
    dm::dm_add_fk(country, c(year, country_code), who_budget) |>
    dm::dm_add_fk(country, c(year, country_code), who_community) |>
    dm::dm_add_fk(country, c(year, country_code), who_sites) |>
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
