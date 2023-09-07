findtb_build_dm <- function(data_list) {
  cols_to_drop <- c("year", "country", "g_whoregion")
  prune_lst <-
    data_list |>
    purrr::map(~ dplyr::select(.x, -tidyselect::any_of(cols_to_drop)))
  dm_no_rel <- dm::dm(!!!prune_lst)
  dm_rel <- set_dm_rels(dm_no_rel)
  set_dm_colors(dm_rel)
}

set_dm_rels <- function(dm) {
  dm |>
    dm::dm_add_pk(hbc, country_code, check = TRUE) |>
    dm::dm_add_pk(wb_tot_pop, country_code, check = TRUE) |>
    dm::dm_add_pk(wb_urb_pop, country_code, check = TRUE) |>
    dm::dm_add_pk(wb_density_pop, country_code, check = TRUE) |>
    dm::dm_add_pk(wb_gdp, country_code, check = TRUE) |>
    dm::dm_add_pk(who_notifications, country_code, check = TRUE) |>
    dm::dm_add_pk(who_estimates, country_code, check = TRUE) |>
    dm::dm_add_pk(who_budget, country_code, check = TRUE) |>
    dm::dm_add_pk(who_community, country_code, check = TRUE) |>
    dm::dm_add_pk(who_sites, country_code, check = TRUE) |>
    dm::dm_add_pk(gf_procurement, country_code, check = TRUE) |>
    dm::dm_add_fk(hbc, country_code, wb_tot_pop) |>
    dm::dm_add_fk(hbc, country_code, wb_urb_pop) |>
    dm::dm_add_fk(hbc, country_code, wb_density_pop) |>
    dm::dm_add_fk(hbc, country_code, who_notifications) |>
    dm::dm_add_fk(hbc, country_code, who_estimates) |>
    dm::dm_add_fk(hbc, country_code, who_budget) |>
    dm::dm_add_fk(hbc, country_code, who_community) |>
    dm::dm_add_fk(hbc, country_code, who_sites) |>
    dm::dm_add_fk(hbc, country_code, gf_procurement)
}

set_dm_colors <- function(dm) {
  dm |>
    dm::dm_set_colors(
      "#5986C4" = starts_with("who"),
      "#70AD47FF" = starts_with("wb"),
      "#ED7D31FF" = hbc
    )
}
