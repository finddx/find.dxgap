# run_mod_lm() works

    Code
      mod_objects
    Output
      $wset
      # A workflow set/tibble: 4 x 4
        wflow_id            info             option    result   
        <chr>               <list>           <list>    <list>   
      1 simple_lm           <tibble [1 x 4]> <opts[2]> <rsmp[+]>
      2 log_pop_total_lm    <tibble [1 x 4]> <opts[2]> <rsmp[+]>
      3 norm_pop_total_lm   <tibble [1 x 4]> <opts[2]> <rsmp[+]>
      4 is_hbc_pop_total_lm <tibble [1 x 4]> <opts[2]> <rsmp[+]>
      
      $rank
      # A tibble: 4 x 5
         rank wflow_id            model      .metric  mean
        <int> <chr>               <chr>      <chr>   <dbl>
      1     1 log_pop_total_lm    linear_reg rmse     9.79
      2     2 simple_lm           linear_reg rmse    18.4 
      3     3 norm_pop_total_lm   linear_reg rmse    18.4 
      4     4 is_hbc_pop_total_lm linear_reg rmse    26.0 
      
      $final_fit
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
           -47.25424        -2.65440         4.33669         0.94852         0.56163  
                 gdp     e_mort_100k         culture           smear           xpert  
            -0.18834         7.19791        -2.96444        -0.06239        -2.54542  
      
      

