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
