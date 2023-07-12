library(readr)
library(dplyr)
library(stringr)
library(tidyr)
library(corrr)
library(ggplot2)

df_ts <- read_tidy_tb(type = "time_series")
df_fixed <- read_tidy_tb(type = "fixed")

# ---- Validate against WHO data ----
# Source: https://www.who.int/teams/global-tuberculosis-programme/data
# Data sharing policy: https://www.who.int/about/policies/publishing/data-policy

# Download a dictionary of variable names for identification in subsequent data
# sets
who_variables <- read_csv(
  "https://extranet.who.int/tme/generateCSV.asp?ds=dictionary"
)

# No datasets appear to exist which calculate a "dx gap":
who_variables |>
  filter(str_detect(definition, "dx|gap")) |>
  select(!code_list)

who_variables |>
  filter(str_detect(variable_name, "dx|gap")) |>
  select(!code_list)

# Instead, let's create our own measure of "Dx Gap", which is understood to be
# a "diagnostic gap", defined as the gap between the number of people who fall
# ill with TB each year and the number of people who are officially reported as
# having been diagnosed and notified:
# https://chat.openai.com/share/6242595d-6c2e-41ee-817d-14d830b925c9

# The diagnostic gap represents the people who have TB but are not officially
# diagnosed, due to limitations or challenges in the healthcare system.

# To calculate the diagnostic gap We need to find data on:
# 1. The estimated total number of TB cases expected each year
# 2. The total number of actual reported cases by health systems

# The variables we are interested in, appear to be in the "Estimates"
# - `e_inc_100k` captures no.1 above
# - `c_newinc` captures no.2 above
who_variables |>
  filter(variable_name == "e_inc_num" | variable_name == "c_newinc") |>
  select(!code_list)

# 'e_inc_num' can be found in the 'WHO TB burden estimates
# [>1Mb]' dataset:
who_estimates <- read_csv(
  "https://extranet.who.int/tme/generateCSV.asp?ds=estimates"
)

who_estimates <- who_estimates |>
  select(
    country,
    year,
    tb_estimated_cases = e_inc_num
  )

# 'c_newinc' can be found in the 'Case notifications [>2Mb]' dataset:
who_notifications <- read_csv(
  "https://extranet.who.int/tme/generateCSV.asp?ds=notifications"
)

who_notifications <- who_notifications |>
  select(
    country,
    year,
    tb_notified_cases = c_newinc
  )

who_dx_gap <- who_estimates |>
  inner_join(who_notifications, by = c("year", "country")) |>
  mutate(
    who_dx_gap_count = tb_estimated_cases - tb_notified_cases,
    who_dx_gap_rate = (tb_estimated_cases - tb_notified_cases) / tb_estimated_cases
  )

who_dx_gap_2019 <- who_dx_gap |>
  filter(year == 2019) |>
  select(country, starts_with("who_"))

findtb_dx_gap_2019 <- df_fixed |>
  select(country, findtb_dx_gap = rate_dx_gap)

# Find non-matching primary keys before joining:
# - DRC
anti_join(findtb_dx_gap_2019, who_dx_gap_2019)

who_dx_gap_2019 <- who_dx_gap_2019 |>
  mutate(
    country = if_else(
      country == "Democratic Republic of the Congo",
      "DRC",
      country
    )
  )

# Findtb's measure of "Dx Gap" does not correlate strongly with the calculated
# version:
findtb_dx_gap_2019 |>
  left_join(who_dx_gap_2019) |>
  correlate()

findtb_dx_gap_2019 |>
  left_join(who_dx_gap_2019) |>
  pivot_longer(!c(country, findtb_dx_gap)) |>
  ggplot(aes(findtb_dx_gap, value)) +
  geom_point(colour = "steelblue", size = 3, alpha = .8) +
  facet_wrap(vars(name), scales = "free") +
  theme_minimal()

findtb_dx_gap_2019 |>
  left_join(who_dx_gap_2019) |>
  rename(
    `Findtb diagnostic gap` = findtb_dx_gap,
    `WHO diagnostic gap` = who_dx_gap_rate
  ) |> 
  ggplot(aes(`Findtb diagnostic gap`, `WHO diagnostic gap`)) +
  geom_point(colour = "steelblue", size = 3, alpha = .8) +
  theme_minimal() + 
  labs(
    title = "Findtb's measure of diagnostic gap negatively correlates with an alternative measure calculated from WHO data",
    subtitle = "Pearson correlation cofficient = -0.836"
    )
