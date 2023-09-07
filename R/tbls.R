data_summary <-
  tibble::tribble(
    ~provider,                      ~dataset,  ~ext,
    "who",                             "budget",  "csv",
    "who",                          "community",  "csv",
    "who",                          "estimates",  "csv",
    "who",                       "expenditures",  "csv",
    "who",                       "laboratories",  "csv",
    "who",                       "notifications", "csv",
    "who",                                "hbc",  "csv",
    "gf",                         "procurement",  "csv",
    "wb",                            "pop_total", "csv",
    "wb",                         "pop_density",  "csv",
    "wb",                          "pop_urban",   "csv",
    "wb",                                "gdp",   "csv"
 )
