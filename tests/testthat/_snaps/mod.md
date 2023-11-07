# run_mod() works

    Code
      final_fit
    Output
      == Workflow [trained] ==========================================================
      Preprocessor: Recipe
      Model: linear_reg()
      
      -- Preprocessor ----------------------------------------------------------------
      8 Recipe Steps
      
      * step_mutate()
      * step_rm()
      * step_filter_missing()
      * step_impute_median()
      * step_impute_knn()
      * step_rm()
      * step_zv()
      * step_log()
      
      -- Model -----------------------------------------------------------------------
      
      Call:
      stats::lm(formula = ..y ~ ., data = data)
      
      Coefficients:
         (Intercept)         is_hbc1       pop_total  pop_urban_perc     pop_density  
            -56.8649         -4.8531          4.8067          4.2067          0.9806  
                 gdp     e_mort_100k         culture           smear           xpert  
             -0.7645          9.3912         -1.5168         -1.8210         -1.7029  
      

