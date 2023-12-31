library(dplyr)
library(tidyr)
library(stringr)
library(corrr) # Note: there is currently issues with renv installing corrr
library(ggplot2)

df_ts <- read_tidy_tb(type = "time_series")
df_fixed <- read_tidy_tb(type = "fixed")

df_2019 <-
  df_ts |>
  filter(year == 2019) |>
  select(-year) |>
  pivot_wider(names_from = indicator, values_from = value)

df_2019_all <- df_2019 |>
  left_join(df_fixed)

# ---- Dx Gap ----
# - Question -
# How is rate_dx_gap, the 'outcome' variable we are interested in, distributed?
df_2019_all |>
  ggplot(aes(rate_dx_gap)) +
  geom_density(fill = "steelblue", alpha = .5) +
  theme_minimal()

# - Insight -
# With the exception of the Russian Federation, with a "Dx Gap" rate of 1.25,
# the remaining values appear normally distributed.
df_2019_all |>
  select(country, rate_dx_gap) |>
  arrange(desc(rate_dx_gap))

# - Reflections -
# - Is the value for the Russian Federation a data entry error? How can the rate
#   be over 1 (i.e., 100%). Understanding how "Dx Gap" was calculated should
#   help answer this.
# - Consider how other variables, examined below, are distrbitued, and what
#   transformations may need to be performed.

# ---- Labs ----
df_2019_labs <- df_2019_all |>
  select(country, population_100k, rate_dx_gap, starts_with("labs_"))

# - Question -
# What is the distribution of lab tests by type across the countries?
df_2019_labs |>
  select(-population_100k, -rate_dx_gap) |>
  pivot_longer(!country) |>
  ggplot(aes(value)) +
  geom_density(fill = "steelblue", alpha = .5) +
  facet_wrap(vars(name), scales = "free") +
  theme_minimal()

# - Insight 1 -
# df_2019_labs$labs_performing_culture_tests_liquid has an outlier
# value of 23,822, corresponding to China
df_2019_labs |>
  filter(
    labs_performing_culture_tests_liquid == max(
      labs_performing_culture_tests_liquid
    )
  )

# This value is 10x previous years. Other types of laboratory tests have not
# increased/decreased by the same rate, indicating this is likely a data entry
# error
df_ts |>
  filter(
    country == "China",
    str_detect(indicator, "^labs_")
  ) |>
  print(n = Inf)

# The values for the previous years show quite a large amount of variance, so
# impute the 2019 value as the mean of the previous years
china_culture_tests_average <- df_ts |>
  filter(
    country == "China",
    indicator == "labs_performing_culture_tests_liquid"
  ) |>
  filter(year < 2019) |>
  summarise(mean = mean(value)) |>
  pull(mean)

df_2019_labs <-
  df_2019_labs |>
  mutate(
    labs_performing_culture_tests_liquid = if_else(
      country == "China",
      china_culture_tests_average,
      labs_performing_culture_tests_liquid
    )
  )

# - Insight 2 -
# df_2019_labs$labs_performing_smear_tests has an outlier value of 20,356,
# corresponding to India
df_2019_labs |>
  filter(
    labs_performing_smear_tests == max(
      labs_performing_smear_tests
    )
  )

# Compared to other years, this value is in the expected range, indicating that
# the observation is not an outlier. Normalising the data by population size
# might prove to be an important step in subsequent EDA and modelling.
df_ts |>
  filter(
    country == "India",
    indicator == "labs_performing_smear_tests"
  )

# - Insight 3 -
# All of the labatory test distributions demonstrate a positive skew, in a
# similar fashion to population:
df_2019_all |>
  ggplot(aes(population_100k)) +
  geom_density(fill = "steelblue", alpha = .5) +
  theme_minimal()

# Population, in general, positively correlates with no. of tests performed,
# with the strength of the correlations varying across the different types of
# lab tests
df_2019_labs |>
  select(-rate_dx_gap) |>
  pivot_longer(!c(country, population_100k)) |>
  ggplot(aes(population_100k, value)) +
  geom_point(colour = "steelblue", alpha = .8) +
  facet_wrap(vars(name), scales = "free") +
  theme_minimal()

df_2019_labs_normalised <- df_2019_labs |>
  mutate(
    across(
      starts_with("labs_"),
      ~ .x / population_100k,
      .names = "{.col}_per_100k"
    )
  )

# However after normalising the no. of lab tests by population, the positive
# skew in the distributions remains:
df_2019_labs_normalised |>
  select(country, ends_with("_per_100k")) |>
  pivot_longer(!country) |>
  ggplot(aes(value)) +
  geom_density(fill = "steelblue", alpha = .5) +
  facet_wrap(vars(name), scales = "free") +
  theme_minimal()

# - Reflections -
# - Should the absolute or relative (normalised by population) number of lab
#   tests be used as features throughout the EDA? Without understanding how
#   "DX Gap" is calculated, it is currently difficult to answer this question.
# - Given the normalised lab test distributions still maintain a positive skew,
#   what other demographic factors could be influencing the no. of tests a
#   country performs (e.g., income, rurality)? How does this relate to the
#   "Dx Gap"?
# - Do the distributions need transforming to normal (e.g., by applying log
#   tansform)

# - Question -
# How does the type and count of lab tests correlate with "Dx Gap"? How about
# the total number of lab tests performed across any type of test?
df_2019_labs_normalised <- df_2019_labs_normalised |>
  rowwise() |>
  mutate(
    labs_all_tests = sum(
      c(
        labs_performing_smear_tests,
        labs_performing_xpert_tests,
        labs_performing_culture_tests_liquid,
        labs_performing_dst
      ),
      na.rm = TRUE
    )
  ) |>
  ungroup() |>
  mutate(labs_all_tests_per_100k = labs_all_tests / population_100k)

df_2019_labs_correlations <-
  df_2019_labs_normalised |>
  correlate() |>
  select(term, rate_dx_gap) |>
  arrange(desc(rate_dx_gap))

# - Insight -
# The total number of lab tests performed does not correlate strongly with
# "Dx Gap"
df_2019_labs_normalised |>
  pivot_longer(!c(country, rate_dx_gap)) |>
  ggplot(aes(value, rate_dx_gap)) +
  geom_point(colour = "steelblue", alpha = .8) +
  facet_wrap(vars(name), scales = "free") +
  theme_minimal()

# - Insight -
# The number of liquid culture tests performed per 100k people may be a
# signficant determinant of a countries "Dx Gap"
model <- lm(
  rate_dx_gap ~ labs_performing_culture_tests_liquid_per_100k +
    labs_performing_dst_per_100k,
  data = df_2019_labs_normalised,
)

summary(model)

# ---- Non-lab variables ----
# - Question -
# How do the non-labatory based variables correlate with "Dx Gap"?

# It is assumed NR = "No record" below
df_2019_non_lab_continuous_vars <- df_2019_all |>
  select(
    country,
    tb_incidence_per_100k,
    rate_tb_case_detection,
    rate_tested_with_rapid_dx,
    rate_dx_gap
  ) |>
  mutate(
    rate_tested_with_rapid_dx = if_else(
      rate_tested_with_rapid_dx == "NR",
      NA_character_,
      rate_tested_with_rapid_dx
    ),
    rate_tested_with_rapid_dx = as.double(rate_tested_with_rapid_dx)
  )

# - Insight -
# - TB incidence and the rate of TB case detection are strongly correlated with
#   "Dx Gap". But, this is presumably because the calculation for "Dx Gap" uses
#   these or related variables. An understanding of how "Dx Gap" was calculated
#   is required.
df_2019_non_lab_continuous_vars |>
  correlate() |>
  select(term, rate_dx_gap) |>
  arrange(desc(rate_dx_gap))

df_2019_non_lab_continuous_vars |> 
pivot_longer(!c(country, rate_dx_gap)) |>
  ggplot(aes(value, rate_dx_gap)) +
  geom_point(colour = "steelblue", alpha = .8) +
  facet_wrap(vars(name), scales = "free") +
  theme_minimal()
