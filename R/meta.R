who_url_endpoints <- tibble::tribble(
                     ~dataset,                   ~url_endpoint,
                       "budget",                  "budget",
         "community_engagement",               "community",
                    "estimates",               "estimates",
  "expenditure_and_utilisation", "expenditure_utilisation",
                 "laboratories",                    "labs",
                 "notification",           "notifications"
  )

ptype_who_notifications <- tibble::tibble(
  country = character(0),
  year = numeric(0),
  c_newinc = numeric(0),
  new_labconf = numeric(0),
  download_date = character(0),
)

ptype_who_budget <- tibble::tibble(
  country = character(0),
  year = numeric(0),
  budget_lab = numeric(0),
  budget_oth = numeric(0),
  budget_staff = numeric(0),
  cf_lab = numeric(0),
  cf_staff = numeric(0),
  cf_tot_domestic = numeric(0),
  cf_tot_gf = numeric(0),
  cf_tot_grnt = numeric(0),
  cf_tot_sources = numeric(0),
  cf_tot_usaid = numeric(0),
  download_date = character(0),
)

ptype_who_community <- tibble::tibble(
  country = character(0),
  year = numeric(0),
  bmu = numeric(0),
  bmu_community_impl = numeric(0),
  bmu_ref_data = numeric(0),
  bmu_rxsupport_data = numeric(0),
  bmu_rxsupport_data_coh = numeric(0),
  notified_ref = numeric(0),
  notified_ref_community = numeric(0),
  download_date = character(0),
)

ptype_who_estimates <- tibble::tibble(
  country = character(0),
  year = numeric(0),
  c_cdr = numeric(0),
  c_newinc_100k = numeric(0),
  e_inc_100k = numeric(0),
  e_inc_num = numeric(0),
  e_mort_100k = numeric(0),
  e_pop_num = numeric(0),
  download_date = character(0),
)

ptype_who_labs <- tibble::tibble(
  country = character(0),
  year = numeric(0),
  culture = numeric(0),
  lab_cul = numeric(0),
  lab_sm = numeric(0),
  lab_xpert = numeric(0),
  m_wrd = numeric(0),
  m_wrd_tests_performed = numeric(0),
  m_wrd_tests_positive = numeric(0),
  xpert = numeric(0),
  download_date = character(0),
)

ptype_who_expenditures <- tibble::tibble(
  country = character(0),
  year = numeric(0),
  rcvd_lab = numeric(0),
  rcvd_staff = numeric(0),
  rcvd_tot_domestic = numeric(0),
  rcvd_tot_gf = numeric(0),
  rcvd_tot_grnt = numeric(0),
  rcvd_tot_sources = numeric(0),
  rcvd_tot_usaid = numeric(0),
  download_date = character(0),
)
