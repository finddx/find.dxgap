# tbl_non_hbc |>
#   filter(if_all(-c(country_code), is.na)) |>
#   distinct(country_code)
country_exclude_df <- tibble::tibble(
  country_code = c(
    "ATA", "BVT", "IOT", "BES", "CXR", "CCK", "FLK", "GUF", "ATF", "GLP", "GGY",
    "HMD", "JEY", "MTQ", "MYT", "NFK", "PCN", "REU", "SGS", "BLM", "SHN", "SPM",
    "SJM", "TWN", "UMI", "VAT", "ESH", "ALA"
  ),
  # we escape non ASCII to avoid getting R CMD warnings
  country = c(
    "Antarctica", "Bouvet Island", "British Indian Ocean Territory",
    "Caribbean Netherlands", "Christmas Island", "Cocos (Keeling) Islands",
    "Falkland Islands", "French Guiana", "French Southern Territories",
    "Guadeloupe", "Guernsey", "Heard & McDonald Islands", "Jersey", "Martinique",
    "Mayotte", "Norfolk Island", "Pitcairn Islands", "R\\u00e9union",
    "South Georgia & South Sandwich Islands", "St. Barth\\u00e9lemy", "St. Helena",
    "St. Pierre & Miquelon", "Svalbard & Jan Mayen", "Taiwan",
    "United States Minor Outlying Islands (the)", "Vatican City",
    "Western Sahara", "\\u00c5land Islands"
  ),
)
