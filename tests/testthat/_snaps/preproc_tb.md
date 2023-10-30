# recipe is as expected

    Code
      recipe_tb
    Message <cliMessage>
      
      -- Recipe ----------------------------------------------------------------------
      
      -- Inputs 
      Number of variables by role
      imputer_knn:        12
      collinear_w_target:  2
      
      -- Operations 
      * Variable mutation for: dplyr::coalesce(xpert, m_wrd)
      * Variables removed: m_wrd
      * Missing value column filter on: recipes::all_predictors()
      * Median imputation for: recipes::has_role("impute_w_median")
      * K-nearest neighbor imputation for: recipes::all_predictors()
      * Variables removed: recipes::has_role("collinear_w_target")
      * Zero variance filter on: recipes::all_numeric_predictors()
      * Variable mutation for: recipes::all_numeric_predictors() &
        -recipes::all_factor()
      * Log transformation on: recipes::all_numeric_predictors() &
        -recipes::all_factor()

# log transformation works for all the variables

    Code
      out_log
    Output
      tibble::tribble(
        ~who_dx_gap, ~pop_total, ~pop_urban_perc, ~pop_density, ~gdp,             ~e_mort_100k, ~culture, ~smear, ~xpert,
        35,          32353588,   66.18,           25.95,        69309110145.77,   62,           0,        167,    22,
        10.91,       211782878,  86.82,           25.34,        1873288159000.64, 3.3,          386,      2463,   206,
        26.95,       1383112050, 34.47,           465.19,       2835606242052.48, 33,           92,       20356,  1545,
      )

