tb_mod_const <- tibble::lst(
  neighbors = 5,
  threshold = 0.25,
  impute_vars = c("gdp", "e_inc_num", "pop_total"),
  mode = "regression",
  engine = "lm",
  folds = 10,
  metrics = yardstick::metric_set(yardstick::rmse, yardstick::rsq),
  rank_metric = "rmse"
)

tb_const <- tibble::lst(
  country = c(
    "Angola",
    "Bangladesh",
    "Brazil",
    "Cambodia",
    "Central African Republic",
    "China",
    "Congo",
    "Democratic People's Republic of Korea",
    "DRC",
    "Ethiopia",
    "India",
    "Indonesia",
    "Kenya",
    "Lesotho",
    "Liberia",
    "Mozambique",
    "Myanmar",
    "Namibia",
    "Nigeria",
    "Pakistan",
    "Papua New Guinea",
    "Philippines",
    "Russian Federation",
    "Sierra Leone",
    "South Africa",
    "Thailand",
    "United Republic of Tanzania",
    "Viet Nam",
    "Zambia",
    "Zimbabwe"
  ),
  indicator_ts = c(
    "tb_incidence_per_100k",
    "population_100k",
    "rate_tb_case_detection",
    "rate_bacteriologically_tested",
    "labs_performing_smear_tests",
    "labs_performing_xpert_tests",
    "labs_performing_culutre_tests_liquid",
    "labs_performing_dst"
  )
)
