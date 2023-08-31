# `country_code` entries are not missing

    Code
      dplyr::filter(dplyr::distinct(tidy_gf_procurement(data), country_code,
      country_territory), is.na(country_code))
    Output
      # A tibble: 7 x 2
        country_code country_territory
        <chr>        <chr>            
      1 <NA>         Africa           
      2 <NA>         Caribbean        
      3 <NA>         Kosovo           
      4 <NA>         Oceania          
      5 <NA>         Southern Asia    
      6 <NA>         Western Asia     
      7 <NA>         Zanzibar         

