findtb_build_tbl <- function(dm_hbc, dm_non_hbc) {
  hbc_tbl <-
    dm_hbc |>
    dm::dm_flatten_to_tbl(.start = hbc) |>
    dplyr::mutate(is_hbc = 1)
  non_hbc_tbl <-
    dm_non_hbc |>
    dm::dm_flatten_to_tbl(.start = non_hbc) |>
    dplyr::mutate(is_hbc = 0)
  dplyr::bind_rows(hbc_tbl, non_hbc_tbl) |>
    dplyr::filter(!if_all(-c(country_code), is.na))
}

findtb_build_dm <- function(data_list, hbc = TRUE) {
  prune_lst <- drop_cols(data_list, c("year", "country", "g_whoregion"))
  filter_lst <- filter_country(data_list = prune_lst, .hbc = hbc)
  dm_no_rel <- dm::dm(!!!filter_lst)
  dm_rel <- choose_dm(dm_no_rel)
  set_dm_colors(dm_rel)
}

drop_cols <- function(data_list, cols_to_drop) {
  data_list |>
    purrr::map(~ dplyr::select(.x, -tidyselect::any_of(cols_to_drop)))
}

get_non_hbc_country_code <- function(hbc_df) {
  countrycode::codelist |>
    dplyr::select(country_code = iso3c) |>
    dplyr::filter(!is.na(country_code)) |>
    dplyr::anti_join(hbc_df, by = dplyr::join_by(country_code)) |>
    dplyr::anti_join(country_exclude_df, by = dplyr::join_by(country_code))
}

assign_non_hbc_df <- function(non_hbc_list, non_hbc_df) {
  non_hbc_list[[length(non_hbc_list) + 1]] <- non_hbc_df
  rlang::names2(non_hbc_list)[length(non_hbc_list)] <- "non_hbc"
  return(non_hbc_list)
}

filter_country <- function(data_list, .hbc = TRUE) {
  hbc_df <- data_list$hbc
  if (.hbc) {
    country_lst <- filter_hbc_country(data_list)
    return(country_lst)
  }
  non_hbc_df <- get_non_hbc_country_code(hbc_df)
  non_hbc_list <- filter_non_hbc_country(data_list, non_hbc_df)
  assign_non_hbc_df(non_hbc_list, non_hbc_df)
}

filter_hbc_country <- function(data_list) {
  hbc_df <- data_list$hbc
  purrr::map(
    data_list,
    ~ dplyr::semi_join(.x, hbc_df, by = dplyr::join_by(country_code))
  )
}

filter_non_hbc_country <- function(data_list, non_hbc_df) {
  purrr::map(
    data_list,
    ~ dplyr::semi_join(.x, non_hbc_df, by = dplyr::join_by(country_code))
  ) |>
    purrr::discard(~ nrow(.x) == 0)
}

choose_dm <- function(dm) {
  tbl_names <- names(dm)
  if ("hbc" %in% tbl_names) {
    dm <- set_dm_rels(dm, hbc)
    return(dm)
  }
  set_dm_rels(dm, non_hbc)
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
    dm::dm_add_pk(wb_tot_pop, country_code, check = TRUE) |>
    dm::dm_add_pk(wb_urb_pop, country_code, check = TRUE) |>
    dm::dm_add_pk(wb_density_pop, country_code, check = TRUE) |>
    dm::dm_add_pk(wb_gdp, country_code, check = TRUE) |>
    dm::dm_add_pk(who_notifications, country_code, check = TRUE) |>
    dm::dm_add_pk(who_estimates, country_code, check = TRUE) |>
    dm::dm_add_pk(who_budget, country_code, check = TRUE) |>
    dm::dm_add_pk(who_community, country_code, check = TRUE) |>
    dm::dm_add_pk(who_sites, country_code, check = TRUE) |>
    dm::dm_add_pk(gf_procurement, country_code, check = TRUE)
}

set_dm_fk <- function(dm, parent_tbl) {
  parent_tbl <- rlang::ensym(parent_tbl)
  dm |>
    dm::dm_add_fk(!!parent_tbl, country_code, wb_tot_pop) |>
    dm::dm_add_fk(!!parent_tbl, country_code, wb_urb_pop) |>
    dm::dm_add_fk(!!parent_tbl, country_code, wb_density_pop) |>
    dm::dm_add_fk(!!parent_tbl, country_code, wb_gdp) |>
    dm::dm_add_fk(!!parent_tbl, country_code, who_notifications) |>
    dm::dm_add_fk(!!parent_tbl, country_code, who_estimates) |>
    dm::dm_add_fk(!!parent_tbl, country_code, who_budget) |>
    dm::dm_add_fk(!!parent_tbl, country_code, who_community) |>
    dm::dm_add_fk(!!parent_tbl, country_code, who_sites) |>
    dm::dm_add_fk(!!parent_tbl, country_code, gf_procurement)
}

set_dm_pk_parent <- function(dm, parent_tbl) {
  parent_tbl <- rlang::ensym(parent_tbl)
  dm::dm_add_pk(dm, !!parent_tbl, country_code, check = TRUE)
}

set_dm_colors <- function(dm) {
  dm |>
    dm::dm_set_colors(
      "#5986C4" = starts_with("who"),
      "#70AD47FF" = starts_with("wb"),
      "#ED7D31FF" = contains("hbc")
    )
}
