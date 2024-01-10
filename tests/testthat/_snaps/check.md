# check_any_na() works

    Code
      check_any_na(df, Ozone)
    Condition
      Error in `check_any_na()`:
      ! `NA` values found in `Ozone`.

# check_any_zero() works

    Code
      check_any_zero(df, am)
    Condition
      Error in `check_any_zero()`:
      ! `0` values found in `am`.
      i Dividing by `0` generates `Inf` values.

# check_supported_year() works

    Code
      check_supported_year(2014:2015, "tb")
    Condition
      Error in `check_supported_year()`:
      ! `2014, 2015` not in supported year range for disease `tb`.

---

    Code
      check_supported_year(2014:2016, "tb")
    Message
      `2014, 2015` not in supported year range for disease `tb`.
      i Fallback on: `2016`.

---

    Code
      check_supported_year(2020:2023, "tb")
    Message
      `2022, 2023` not in supported year range for disease `tb`.
      i Fallback on: `2020, 2021`.

---

    Code
      check_supported_year(2016:2021, "tb")

