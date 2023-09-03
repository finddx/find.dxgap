
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

<div id="hpfxmklwqy" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#hpfxmklwqy table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#hpfxmklwqy thead, #hpfxmklwqy tbody, #hpfxmklwqy tfoot, #hpfxmklwqy tr, #hpfxmklwqy td, #hpfxmklwqy th {
  border-style: none;
}
&#10;#hpfxmklwqy p {
  margin: 0;
  padding: 0;
}
&#10;#hpfxmklwqy .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#hpfxmklwqy .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#hpfxmklwqy .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#hpfxmklwqy .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#hpfxmklwqy .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#hpfxmklwqy .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#hpfxmklwqy .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#hpfxmklwqy .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#hpfxmklwqy .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#hpfxmklwqy .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#hpfxmklwqy .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#hpfxmklwqy .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#hpfxmklwqy .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#hpfxmklwqy .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#hpfxmklwqy .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#hpfxmklwqy .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#hpfxmklwqy .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#hpfxmklwqy .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#hpfxmklwqy .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hpfxmklwqy .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#hpfxmklwqy .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#hpfxmklwqy .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#hpfxmklwqy .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hpfxmklwqy .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#hpfxmklwqy .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#hpfxmklwqy .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#hpfxmklwqy .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hpfxmklwqy .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#hpfxmklwqy .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#hpfxmklwqy .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#hpfxmklwqy .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#hpfxmklwqy .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#hpfxmklwqy .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hpfxmklwqy .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#hpfxmklwqy .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hpfxmklwqy .gt_left {
  text-align: left;
}
&#10;#hpfxmklwqy .gt_center {
  text-align: center;
}
&#10;#hpfxmklwqy .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#hpfxmklwqy .gt_font_normal {
  font-weight: normal;
}
&#10;#hpfxmklwqy .gt_font_bold {
  font-weight: bold;
}
&#10;#hpfxmklwqy .gt_font_italic {
  font-style: italic;
}
&#10;#hpfxmklwqy .gt_super {
  font-size: 65%;
}
&#10;#hpfxmklwqy .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#hpfxmklwqy .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#hpfxmklwqy .gt_indent_1 {
  text-indent: 5px;
}
&#10;#hpfxmklwqy .gt_indent_2 {
  text-indent: 10px;
}
&#10;#hpfxmklwqy .gt_indent_3 {
  text-indent: 15px;
}
&#10;#hpfxmklwqy .gt_indent_4 {
  text-indent: 20px;
}
&#10;#hpfxmklwqy .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="data_file">data_file</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="data_file" class="gt_row gt_left">gf_2023-07-26_procurement.csv</td></tr>
    <tr><td headers="data_file" class="gt_row gt_left">tb_find_variable_masterlist.csv</td></tr>
    <tr><td headers="data_file" class="gt_row gt_left">wb_2023-07-28_SP.URB.TOTL.IN.ZS.csv</td></tr>
    <tr><td headers="data_file" class="gt_row gt_left">wb_2023-08-31_EN.POP.DNST.csv</td></tr>
    <tr><td headers="data_file" class="gt_row gt_left">wb_2023-08-31_SP.POP.TOTL.csv</td></tr>
    <tr><td headers="data_file" class="gt_row gt_left">who_2023-07-28_budget.csv</td></tr>
    <tr><td headers="data_file" class="gt_row gt_left">who_2023-07-28_community.csv</td></tr>
    <tr><td headers="data_file" class="gt_row gt_left">who_2023-07-28_estimates.csv</td></tr>
    <tr><td headers="data_file" class="gt_row gt_left">who_2023-07-28_expenditures.csv</td></tr>
    <tr><td headers="data_file" class="gt_row gt_left">who_2023-07-28_notifications.csv</td></tr>
    <tr><td headers="data_file" class="gt_row gt_left">who_2023-08-30_laboratories.csv</td></tr>
    <tr><td headers="data_file" class="gt_row gt_left">who_hbc.csv</td></tr>
  </tbody>
  &#10;  
</table>
</div>

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
