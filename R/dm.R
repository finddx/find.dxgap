build_tbl <- function(dm_hbc, dm_non_hbc) {
  hbc_tbl <-
    dm_hbc |>
    dm::dm_flatten_to_tbl(.start = hbc) |>
    dplyr::mutate(is_hbc = 1)
  non_hbc_tbl <-
    dm_non_hbc |>
    dm::dm_flatten_to_tbl(.start = non_hbc) |>
    dplyr::mutate(is_hbc = 0)
  dplyr::bind_rows(hbc_tbl, non_hbc_tbl) |>
    dplyr::filter(!dplyr::if_all(-c(country_code), is.na)) |>
    dplyr::relocate(is_hbc, .before = everything())
}

build_dm <- function(data_list, year = NULL, is_hbc = TRUE) {
  prune_lst <- drop_cols(data_list, c("country", "g_whoregion"))
  filter_lst <- filter_country(data_list = prune_lst, year = year,  .is_hbc = is_hbc)
  dm_no_rel <- dm::dm(!!!filter_lst)
  is_hbc <- is_hbc_dm(dm_no_rel)
  if (is_hbc) {
    dm_rel <- set_dm_rels(dm_no_rel, hbc)
  } else {
    dm_rel <- set_dm_rels(dm_no_rel, non_hbc)
  }
  dm_ts <- set_dm_colors(dm_rel)
  if (is.null(year)) {
    return(dm_ts)
  }
  if (is_hbc) {
    dm_year <- dm::dm_filter(dm_ts, hbc = (year == !!year))
  } else {
    dm_year <- dm::dm_filter(dm_ts, non_hbc = (year == !!year))
  }
  dm_year
}

drop_cols <- function(data_list, cols_to_drop) {
  data_list |>
    purrr::map(~ dplyr::select(.x, -tidyselect::any_of(cols_to_drop)))
}

get_non_hbc_country_code <- function(hbc_df, .year) {
  if (!is.null(.year)) {
    hbc_df <-
      hbc_df |>
      dplyr::filter(year == !!.year)
  }
  countrycode::codelist |>
    dplyr::select(country_code = iso3c) |>
    dplyr::filter(!is.na(country_code)) |>
    dplyr::anti_join(hbc_df, by = dplyr::join_by(country_code)) |>
    dplyr::anti_join(country_exclude_df, by = dplyr::join_by(country_code)) |>
    tidyr::expand(country_code, year = 2000:2099)
}

assign_non_hbc_df <- function(non_hbc_list, non_hbc_df) {
  non_hbc_list[[length(non_hbc_list) + 1]] <- non_hbc_df
  rlang::names2(non_hbc_list)[length(non_hbc_list)] <- "non_hbc"
  return(non_hbc_list)
}

filter_country <- function(data_list, year, .is_hbc) {
  hbc_df <- data_list$hbc
  if (.is_hbc) {
    country_lst <- filter_hbc_country(data_list)
    return(country_lst)
  }
  non_hbc_df <- get_non_hbc_country_code(hbc_df, .year = year)
  non_hbc_list <- filter_non_hbc_country(data_list, non_hbc_df)
  assign_non_hbc_df(non_hbc_list, non_hbc_df)
}

filter_hbc_country <- function(data_list) {
  hbc_df <- data_list$hbc
  purrr::map(
    data_list,
    ~ dplyr::semi_join(.x, hbc_df, by = dplyr::join_by(country_code, year))
  )
}

filter_non_hbc_country <- function(data_list, non_hbc_df) {
  list_data <- purrr::map(
    data_list,
    ~ dplyr::semi_join(.x, non_hbc_df, by = dplyr::join_by(country_code, year))
  )
  list_data$hbc <- NULL
  list_data
}

is_hbc_dm <- function(dm) {
  tbl_names <- names(dm)
  if ("hbc" %in% tbl_names) {
    return(TRUE)
  }
  FALSE
}

set_dm_rels <- function(dm, parent_tbl) {
  parent_tbl <- rlang::ensym(parent_tbl)
  dm |>
    set_dm_pk_parent(!!parent_tbl) |>
    set_dm_pk() |>
    set_dm_fk(!!parent_tbl)
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
  parent_tbl <- rlang::ensym(parent_tbl)
  dm |>
    dm::dm_add_fk(!!parent_tbl, c(year, country_code), wb_tot_pop) |>
    dm::dm_add_fk(!!parent_tbl, c(year, country_code), wb_urb_pop) |>
    dm::dm_add_fk(!!parent_tbl, c(year, country_code), wb_density_pop) |>
    dm::dm_add_fk(!!parent_tbl, c(year, country_code), wb_gdp) |>
    dm::dm_add_fk(!!parent_tbl, c(year, country_code), who_notifications) |>
    dm::dm_add_fk(!!parent_tbl, c(year, country_code), who_estimates) |>
    dm::dm_add_fk(!!parent_tbl, c(year, country_code), who_budget) |>
    dm::dm_add_fk(!!parent_tbl, c(year, country_code), who_community) |>
    dm::dm_add_fk(!!parent_tbl, c(year, country_code), who_sites) |>
    dm::dm_add_fk(!!parent_tbl, c(year, country_code), who_expenditures) |>
    dm::dm_add_fk(!!parent_tbl, c(year, country_code), gf_procurement)
}

set_dm_pk_parent <- function(dm, parent_tbl) {
  parent_tbl <- rlang::ensym(parent_tbl)
  dm::dm_add_pk(dm, !!parent_tbl, c(year, country_code), check = TRUE)
}

set_dm_colors <- function(dm) {
  dm |>
    dm::dm_set_colors(
      "#5986C4" = starts_with("who"),
      "#70AD47FF" = starts_with("wb"),
      "#ED7D31FF" = contains("hbc")
    )
}
