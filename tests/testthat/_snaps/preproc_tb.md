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
      tibble::tibble(
        who_dx_gap = c(35, 10.91, 26.95),
        pop_total = c(32353588, 211782878, 1383112050),
        pop_urban_perc = c(66.18, 86.82, 34.47),
        pop_density = c(25.95, 25.34, 465.19),
        gdp = c(69309110145.77, 1873288159000.64, 2835606242052.48),
        e_mort_100k = c(62, 3.3, 33),
        culture = c(0, 386, 92),
        smear = c(167, 2463, 20356),
        xpert = c(22, 206, 1545),
      )

