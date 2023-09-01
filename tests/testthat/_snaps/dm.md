# findtb_build_dm() works

    Code
      dm::glimpse(dm)
    Output
      dm of 10 tables: `hbc`, `wb_tot_pop`, `wb_urb_pop`, `wb_density_pop`, `who_notif...
      
      --------------------------------------------------------------------------------
      
      Table: `hbc`
      Primary key: `country_code`
      9 outgoing foreign key(s):
        `country_code` -> `wb_tot_pop$country_code` no_action
        `country_code` -> `wb_urb_pop$country_code` no_action
        `country_code` -> `wb_density_pop$country_code` no_action
        `country_code` -> `who_notifications$country_code` no_action
        `country_code` -> `who_estimates$country_code` no_action
        `country_code` -> `who_budget$country_code` no_action
        `country_code` -> `who_community$country_code` no_action
        `country_code` -> `who_sites$country_code` no_action
        `country_code` -> `gf_procurement$country_code` no_action
      
      Rows: 20
      Columns: 1
      $ country_code <chr> "AGO", "BGD", "BRA", "CHN", "PRK", "COD", "ETH", "IND", "~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_tot_pop`
      Primary key: `country_code`
      
      Rows: 20
      Columns: 4
      $ indicator_value <chr> "Population, total", "Population, total", "Population,~
      $ country_code    <chr> "AGO", "BGD", "BRA", "CHN", "COD", "ETH", "IND", "IDN"~
      $ country_value   <chr> "Angola", "Bangladesh", "Brazil", "China", "Congo, Dem~
      $ value           <dbl> 32353588, 165516222, 211782878, 1407745000, 89906890, ~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_urb_pop`
      Primary key: `country_code`
      
      Rows: 20
      Columns: 2
      $ country_code   <chr> "AGO", "BGD", "BRA", "CHN", "COD", "ETH", "IND", "IDN",~
      $ pop_urban_perc <dbl> 66.177, 37.405, 86.824, 60.308, 45.046, 21.225, 34.472,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_density_pop`
      Primary key: `country_code`
      
      Rows: 20
      Columns: 2
      $ country_code <chr> "AGO", "BGD", "BRA", "CHN", "COD", "ETH", "IND", "IDN", "~
      $ pop_density  <dbl> 25.951382, 1271.538926, 25.338518, 149.367573, 39.658098,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_notifications`
      Primary key: `country_code`
      
      Rows: 20
      Columns: 3
      $ country_code <chr> "AGO", "BGD", "BRA", "CHN", "PRK", "COD", "ETH", "IND", "~
      $ c_newinc     <dbl> 74105, 291595, 85523, 728265, 95722, 178527, 111039, 2162~
      $ new_labconf  <dbl> 34887, 162195, 50073, 295225, 30496, 109558, 44851, 90892~
      
      --------------------------------------------------------------------------------
      
      Table: `who_estimates`
      Primary key: `country_code`
      
      Rows: 20
      Columns: 7
      $ country_code  <chr> "AGO", "BGD", "BRA", "CHN", "PRK", "COD", "ETH", "IND", ~
      $ c_cdr         <dbl> 65, 80, 89, 88, 72, 62, 70, 73, 67, 62, 88, 79, 26, 56, ~
      $ c_newinc_100k <dbl> 229, 176, 40, 51, 372, 199, 97, 156, 208, 166, 317, 254,~
      $ e_inc_100k    <dbl> 351, 221, 46, 58, 513, 320, 140, 214, 312, 267, 361, 322~
      $ e_inc_num     <dbl> 114000, 366000, 96000, 826000, 132000, 288000, 160000, 2~
      $ e_mort_100k   <dbl> 62.0, 24.0, 3.3, 2.3, NA, 60.0, 22.0, 33.0, 36.0, 62.0, ~
      $ e_pop_num     <dbl> 32353588, 165516222, 211782878, 1421864031, 25755441, 89~
      
      --------------------------------------------------------------------------------
      
      Table: `who_budget`
      Primary key: `country_code`
      
      Rows: 20
      Columns: 11
      $ country_code    <chr> "AGO", "BGD", "BRA", "CHN", "PRK", "COD", "ETH", "IND"~
      $ budget_lab      <dbl> 17133500, 32123255, 7142388, 33671641, 4194415, 630471~
      $ budget_oth      <dbl> 4000000, 1807810, 117000, 0, 10572573, 2277868, 159111~
      $ budget_staff    <dbl> 1572700, 20323571, 660802, 146348944, 2580600, 5594703~
      $ cf_lab          <dbl> 7216284, 12753612, 7142388, 33671641, 438700, 1466023,~
      $ cf_staff        <dbl> 1572700, 21387575, 660802, 146348944, 2580600, 1828732~
      $ cf_tot_domestic <dbl> 13692478, 18153743, 38052385, 664180563, 5865100, 1711~
      $ cf_tot_gf       <dbl> 2416285, 36966056, NA, 0, 4018900, 16431571, 13388780,~
      $ cf_tot_grnt     <dbl> 4000000, 0, 117000, 6837963, 2732200, 5858316, 2784812~
      $ cf_tot_sources  <dbl> 20108763, 68101153, 38169385, 671018526, 12616200, 262~
      $ cf_tot_usaid    <dbl> 0, 12981354, NA, 0, 0, 2242963, 11447314, 15000000, 13~
      
      --------------------------------------------------------------------------------
      
      Table: `who_community`
      Primary key: `country_code`
      
      Rows: 17
      Columns: 8
      $ country_code           <chr> "AGO", "BGD", "BRA", "COD", "ETH", "IND", "IDN"~
      $ bmu                    <dbl> 340, 857, NA, 517, 950, 6532, 514, 289, 546, 33~
      $ bmu_community_impl     <dbl> 9, 481, NA, 389, 950, 6532, 211, 289, 546, 236,~
      $ bmu_ref_data           <dbl> 9, 481, NA, 389, 890, 1372, 211, 289, 546, 236,~
      $ bmu_rxsupport_data     <dbl> NA, 481, NA, 399, 950, 6093, 191, 290, 657, 250~
      $ bmu_rxsupport_data_coh <dbl> NA, 242334, NA, 50566, 108193, 2296068, 422135,~
      $ notified_ref           <dbl> 5630, 242334, NA, 150807, 107230, 648697, 42850~
      $ notified_ref_community <dbl> 2742, 138110, NA, 86411, 17146, 42165, 47250, 8~
      
      --------------------------------------------------------------------------------
      
      Table: `who_sites`
      Primary key: `country_code`
      
      Rows: 20
      Columns: 10
      $ country_code          <chr> "AGO", "BGD", "BRA", "CHN", "PRK", "COD", "ETH",~
      $ culture               <dbl> 0, 5, 386, 2382, 2, 5, 10, 92, 21, 2, 3, 3, 10, ~
      $ lab_cul               <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ lab_sm                <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ smear                 <dbl> 167, 1136, 2463, 2951, 367, 2042, 3311, 20356, 7~
      $ lab_xpert             <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ xpert                 <dbl> 22, 200, 206, 2210, 7, 132, 280, 1545, 878, 226,~
      $ m_wrd                 <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ m_wrd_tests_performed <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ m_wrd_tests_positive  <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      
      --------------------------------------------------------------------------------
      
      Table: `gf_procurement`
      Primary key: `country_code`
      
      Rows: 49
      Columns: 3
      $ country_code      <chr> "ETH", "ETH", "ETH", "IND", "IND", "IND", "IND", "IN~
      $ product           <chr> "TB molecular diagnostics", "TB molecular diagnostic~
      $ total_numb_device <dbl> 91000, NA, 90950, 1026600, 1200, 2000, 45000, 45000,~
      
      --------------------------------------------------------------------------------

