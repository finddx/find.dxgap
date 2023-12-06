
<!-- README.md is generated from README.Rmd. Please edit that file -->

# find.dxgap

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
<!-- badges: end -->

## Installation

This project aims to both find the determinants of the DX Gap in TB, and
to generalise these methods into a broader R package framework for other
diseases. This creates the need for a project structure that both allows
for a high-level of reproducibility (using exact R package versions to
reproduce analyses calculating determinants) and for generalisability
(so that the methods work across different R package versions in the
future).

To achieve reproducibility, the
[`renv`](https://rstudio.github.io/renv/articles/renv.html) package is
used to create a reproducibile environment. Take this approach when you
want to exactly reproduce any analyses performed as part of this
project. To use this project with `renv`:

1.  [Clone](https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls)
    the package with HTTPS/SSH.
2.  If this is your first time running the project, `renv` should
    automatically bootstrap itself, downloading and installing the
    appropriate version of renv.
3.  You will then be prompted to download and install all the packages
    needed by running `renv::restore()`.

To achieve generalisability and to install this project as an R package,
the
[`DESCRIPTION`](https://r-pkgs.org/description.html#sec-description-imports-suggests)
file is used to specify package dependencies. Take this approach when
you want to use the functions and ideas within the package. You can
install the development version of find.dxgap from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("finddx/find.dxgap")
```

``` r
library(find.dxgap)
```

## find.dxgap.data

Clone [`find.dxgap.data`](https://github.com/finddx/find.dxgap.data) to
get data for the project.

The following env. variable needs to be set to establish connection
between `find.dxgap` and `find.dxgap.data`. Please call,
`usethis::edit_r_environ(scope = "user")` and c/p the following in your
.Renviron file:

    DXGAP_DATADIR = "/<path_to>/find.dxgap.data"

## Usage

#### Tables

Once `DXGAP_DATADIR` is set, build a wide table for given year and
disease:

``` r
tb_vars <- c(
  "year", "country", "is_hbc", "country_code", "who_dx_gap", "pop_total",
  "pop_urban_perc", "pop_density", "gdp", "c_newinc", "e_inc_num",
  "e_mort_100k", "culture", "smear", "xpert", "m_wrd"
)

build_tbl("tb", year = 2019, vars = tb_vars)
#> # A tibble: 190 × 15
#>     year country        is_hbc country_code pop_total pop_urban_perc pop_density
#>    <dbl> <chr>           <dbl> <chr>            <dbl>          <dbl>       <dbl>
#>  1  2019 Angola              1 AGO             3.24e7           66.2       26.0 
#>  2  2019 Bangladesh          1 BGD             1.66e8           37.4     1272.  
#>  3  2019 Brazil              1 BRA             2.12e8           86.8       25.3 
#>  4  2019 Central Afric…      1 CAF             5.21e6           41.8        8.36
#>  5  2019 China               1 CHN             1.41e9           60.3      150.  
#>  6  2019 Congo - Kinsh…      1 COD             8.99e7           45.0       39.7 
#>  7  2019 Congo - Brazz…      1 COG             5.57e6           67.4       16.3 
#>  8  2019 Ethiopia            1 ETH             1.14e8           21.2      101.  
#>  9  2019 Indonesia           1 IDN             2.70e8           56.0      144.  
#> 10  2019 India               1 IND             1.38e9           34.5      465.  
#> # ℹ 180 more rows
#> # ℹ 8 more variables: gdp <dbl>, c_newinc <dbl>, e_inc_num <dbl>,
#> #   e_mort_100k <dbl>, culture <dbl>, smear <dbl>, xpert <dbl>, m_wrd <dbl>
```

Optionally, a time series can be build:

``` r
build_tbl("tb", year = NULL, vars = tb_vars)
#> # A tibble: 1,140 × 15
#>     year country    is_hbc country_code pop_total pop_urban_perc pop_density
#>    <dbl> <chr>       <dbl> <chr>            <dbl>          <dbl>       <dbl>
#>  1  2016 Angola          1 AGO           29154746           64.1        23.4
#>  2  2017 Angola          1 AGO           30208628           64.8        24.2
#>  3  2018 Angola          1 AGO           31273533           65.5        25.1
#>  4  2019 Angola          1 AGO           32353588           66.2        26.0
#>  5  2020 Angola          1 AGO           33428486           66.8        26.8
#>  6  2021 Angola          1 AGO           34503774           67.5        27.7
#>  7  2016 Bangladesh      1 BGD          159784568           35.1      1228. 
#>  8  2017 Bangladesh      1 BGD          161793964           35.9      1243. 
#>  9  2018 Bangladesh      1 BGD          163683958           36.6      1257. 
#> 10  2019 Bangladesh      1 BGD          165516222           37.4      1272. 
#> # ℹ 1,130 more rows
#> # ℹ 8 more variables: gdp <dbl>, c_newinc <dbl>, e_inc_num <dbl>,
#> #   e_mort_100k <dbl>, culture <dbl>, smear <dbl>, xpert <dbl>, m_wrd <dbl>
```

An error is raised, if a disease is not supported yet:

``` r
build_tbl("covid", year = NULL, vars = tb_vars)
#> Error in `check_supported_disease()` at find.dxgap/R/load.R:26:3:
#> ! Cannot find `covid` in `dxgap_diseases`.
#> ✖ Disease is not supported yet.
```

When is [\#289](https://github.com/finddx/find.dxgap/pull/289) is
merged, tables from different providers will all be accessible with a
unique function. For instance:

``` r
import_tbl("who_hbc_2023-07-28.csv")
```

``` r
import_tbl("gf_procurement_2023-07-26.csv")
```

Please, refer to
[`find.dxgap.data`](https://github.com/finddx/find.dxgap.data) for the
available tables.

#### Report

Few templates have been implemented for data exploration:

``` r
view_templates() |> 
  writeLines()
#> eda.Rmd
#> eda_ts.Rmd
#> explain_lm.Rmd
#> missing.Rmd
```

``` r
render_report(
  "eda_ts.Rmd", 
  disease = "tb",
  year = NULL, # the template requires `NULL`
  interactive = TRUE,
  vars = tb_vars
)
```

``` r
render_report(
  "explain_lm.Rmd",
  disease = "tb",
  year = 2019, # the template requires a year to be selected
  interactive = TRUE,
  vars = tb_vars
)
```

## Objectives of the project

Support in data analysis / processing for the development of a Shiny
dashboard (**TB Diagnostics Policy dashboard**) that will show *by
country* the:

- *TB diagnostic landscape*

- *TB burden*

More specifically it will show:

- Countries with similar demographics to improve the learning of
  algorithms
- Need for testing by region and test type
- Assess readiness and willingness of countries for new upcoming TB
  diagnostics
- Understand *Gap* in testing and TB incidence in a country
- Assess existing association between algorithms and *TB incidence* / %
  of cases bacteriologically confirmed

## Schema

The below schema represents the flow of data in this package to aid with
future developments:

<img src='man/figures/data-schematic.png' align="centre"/>

### Source:

- [WHO operational handbook on TB - Dignosis
  Module](https://www.who.int/publications/i/item/9789240030589)

- [WHO Global TB
  report](https://www.who.int/teams/global-tuberculosis-programme/data#gtbr)

- [Global Epidemiology of
  Tuberculosis](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4315920/)

- [Diagnosing the diagnostic
  gaps](https://www.youtube.com/watch?v=pvp7HiHOU2Q)
