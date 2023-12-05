
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

## find.dxgap.data

Data for the project are stored in a directory called
[`find.dxgap.data`](https://github.com/finddx/find.dxgap.data).

The below schema represents the flow of data in this package to aid with
future developments:

<img src='man/figures/data-schematic.png' align="centre"/>

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

### Source:

- [WHO operational handbook on TB - Dignosis
  Module](https://www.who.int/publications/i/item/9789240030589)

- [WHO Global TB
  report](https://www.who.int/teams/global-tuberculosis-programme/data#gtbr)

- [Global Epidemiology of
  Tuberculosis](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4315920/)

- [Diagnosing the diagnostic
  gaps](https://www.youtube.com/watch?v=pvp7HiHOU2Q)
