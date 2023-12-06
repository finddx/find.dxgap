# recipe is as expected

    Code
      recipe_tb
    Message
      
      -- Recipe ----------------------------------------------------------------------
      
      -- Inputs 
      Number of variables by role
      outcome:             1
      predictor:          12
      imputer_knn:        14
      collinear_w_target:  2
      id:                  1
      impute_w_median:     1
      
      -- Operations 
      * Variable mutation for: dplyr::coalesce(xpert, m_wrd)
      * Variables removed: m_wrd
      * Missing value column filter on: recipes::all_predictors()
      * Median imputation for: recipes::has_role("impute_w_median")
      * K-nearest neighbor imputation for: recipes::all_predictors()
      * Variables removed: recipes::has_role("collinear_w_target")
      * Zero variance filter on: recipes::all_numeric_predictors()
      * Log transformation on: recipes::all_numeric_predictors() &
        -recipes::all_factor()

# log transformation works for all the variables

    Code
      out_log
    Output
      tibble::tibble(
        dx_gap = c(35, 10.91, 26.95),
        pop_total = c(17.29, 19.17, 21.05),
        pop_urban_perc = c(4.21, 4.48, 3.57),
        pop_density = c(3.29, 3.27, 6.14),
        gdp = c(24.96, 28.26, 28.67),
        e_mort_100k = c(4.14, 1.46, 3.53),
        culture = c(0, 5.96, 4.53),
        smear = c(5.12, 7.81, 9.92),
        xpert = c(3.14, 5.33, 7.34),
      )

