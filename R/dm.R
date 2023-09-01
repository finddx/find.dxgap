findtb_build_dm <- function(data_list) {
  cols_to_drop <- c("year", "country", "g_whoregion")
  prune_lst <-
    data_list |>
    purrr::map(~ dplyr::select(.x, -tidyselect::any_of(cols_to_drop)))
  dm_no_rel <- dm::dm(!!!prune_lst)
  dm_rel <- set_dm_rels(dm_no_rel)
  dm_rel
}

set_dm_rels <- function(dm) {
  dm |>
    dm::dm_add_pk(hbc_df, country_code) |>
    dm::dm_add_pk(wb_tot_pop_df, country_code) |>
    dm::dm_add_pk(wb_urb_pop_df, country_code) |>
    dm::dm_add_pk(wb_density_pop_df, country_code) |>
    dm::dm_add_pk(who_notifications_df, country_code) |>
    dm::dm_add_pk(who_estimates_df, country_code) |>
    dm::dm_add_pk(who_budget_df, country_code) |>
    dm::dm_add_pk(who_community_df, country_code) |>
    dm::dm_add_pk(who_sites_df, country_code) |>
    dm::dm_add_pk(gf_procurement_df, country_code) |>
    dm::dm_add_fk(hbc_df, country_code, wb_tot_pop_df) |>
    dm::dm_add_fk(hbc_df, country_code, wb_urb_pop_df) |>
    dm::dm_add_fk(hbc_df, country_code, wb_density_pop_df) |>
    dm::dm_add_fk(hbc_df, country_code, who_notifications_df) |>
    dm::dm_add_fk(hbc_df, country_code, who_estimates_df) |>
    dm::dm_add_fk(hbc_df, country_code, who_budget_df) |>
    dm::dm_add_fk(hbc_df, country_code, who_community_df) |>
    dm::dm_add_fk(hbc_df, country_code, who_sites_df) |>
    dm::dm_add_fk(hbc_df, country_code, gf_procurement_df)
}
