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

