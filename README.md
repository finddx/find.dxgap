
<!-- README.md is generated from README.Rmd. Please edit that file -->

# findtb

<!-- badges: start -->
<!-- badges: end -->

## Installation

You can install the development version of findtb from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("cynkra/findtb")
```

## findtb.data

Data for the project are stored in a directory called `findtb.data`.
Please, call `set_findtb_data_dir()` to create and populate such folder.

The data available are:

| data_file                        |
|:---------------------------------|
| gf_2023-07-26_procurement.csv    |
| tb_find_variable_masterlist.csv  |
| wb_2023-07-28_pop_urban.csv      |
| wb_2023-08-31_pop_density.csv    |
| wb_2023-08-31_pop_total.csv      |
| who_2023-07-28_budget.csv        |
| who_2023-07-28_community.csv     |
| who_2023-07-28_estimates.csv     |
| who_2023-07-28_expenditures.csv  |
| who_2023-07-28_notifications.csv |
| who_2023-08-30_laboratories.csv  |
| who_hbc.csv                      |

## Report

Call, `findtb_render_report(year = 2019)` to render a report for given
year. Create new templates and render them using the `template_path`
parameter.

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

## TB dignosis Crash Course

### Tubercolosis

Tuberculosis (TB) is a disease caused by germs that are spread from
person to person through the air. TB usually affects the lungs, but it
can also affect other parts of the body, such as the brain, the kidneys,
or the spine. A person with TB can die if they do not get treatment.

### Process

- Show symptoms (plus, so called *asymptomatic*)

- Get tested

### How to detect

- Blood tests

- Skin tests

- *Rapid tests*

### Issues

- “Latent TB infection”” vs “TB disease”

- Gap between estimated and notified cases

- DR-TB (**Drug-resistant TB**):

  - multidrug or rifampicin-resistant TB (MDR / RR-TB)
  - due to: *Mycobacterium tuberculosis complex bacteria (MTBC)*

- Needs for laboratories (DST)

### Management of TB spread

- Rapid diagnosis:

  - *drug-susceptibility testing (DST)*

  - fast and accurate detection tests

- Rapid detection of DR-TB

- Effective treatment regime

### Policy

WHO developed a global strategy for TB prevention (*End TB Strategy*)
with goals to meet.

### Metrics

- point prevalence

- period prevalence

- incidence rate (or, *cumulative incidence rate*) = (numb. of new cases
  arising from a definined pop. in a specified time period) / (numb. in
  defined at-risk pop. over the same time period)

- incidence density

- illness duration

### Glossary

**POC: Point-of-care diagnostic tests for tuberculosis disease**

They facilitate early detection, immediate treatment, and reduced
transmission of TB disease.

Types:

- Oral Swab testing

- GeneXpert® Systems technology by Cephid

  - Workstation for molecular diagnostics

- Urine LF-LAM

- …

**WHO dashboard**

<https://www.who.int/teams/global-tuberculosis-programme/data>

**Model (diagnostic) algorithms**

Effective and efficient TB diagnostic algorithms are key components of a
diagnostic cascade designed to ensure that patients with TB are
diagnosed accurately and rapidly, and are promptly placed on appropriate
therapy.

Objectives:

- Screening

- Diagnosis

Example:

![](https://tbksp.org/sites/default/files/inline-images/Fig4-2.gif)

**WHO HBC**

WHO render a list of High burden countries (HBCs) for TB, TB/HIV, etc.

**Prevention**

- primary

- secondary

- tertiary

### Source:

- [WHO operational handbook on TB - Dignosis
  Module](https://www.who.int/publications/i/item/9789240030589)

- [WHO Global TB
  report](https://www.who.int/teams/global-tuberculosis-programme/data#gtbr)

- [Global Epidemiology of
  Tuberculosis](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4315920/)

- [Diagnosing the diagnostic
  gaps](https://www.youtube.com/watch?v=pvp7HiHOU2Q)
