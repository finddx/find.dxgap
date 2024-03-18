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
      1     1 log_pop_total_lm    linear_reg rmse     10.2
      2     2 simple_lm           linear_reg rmse     16.5
      3     3 norm_pop_total_lm   linear_reg rmse     16.5
      4     4 is_hbc_pop_total_lm linear_reg rmse     40.0
      
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
            -35.3067         -5.0826          4.7648          3.2322         -0.5806  
                 gdp     e_mort_100k         culture           smear           xpert  
             -1.1542          7.0113         -2.8141         -0.9495         -0.5547  
      
      

