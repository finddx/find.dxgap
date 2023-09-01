findtb_build_dm <- function(data_list) {
  dm_no_rel <- dm::dm(!!!data_list)
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
    dm::dm_add_fk(hbc_df, country_code, gf_procurement_df)
}
