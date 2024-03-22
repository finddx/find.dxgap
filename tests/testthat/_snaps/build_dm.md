# build_dm()

    Code
      dm::glimpse(dm)
    Output
      dm of 13 tables: `gf_procurement`, `wb_gdp`, `wb_pop_density`, `wb_pop_total`, `...
      
      --------------------------------------------------------------------------------
      
      Table: `gf_procurement`
      Primary key: (`year`, `country_code`)
      
      Rows: 41
      Columns: 3
      $ country_code      <chr> "ALB", "BDI", "BFA", "BLR", "BLZ", "BTN", "COG", "CO~
      $ year              <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019~
      $ total_numb_device <dbl> 2002, 9300, 310000, 3360, 850, 2552, 3450, 2, 17693,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_gdp`
      Primary key: (`year`, `country_code`)
      
      Rows: 201
      Columns: 3
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ country_code <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG", "ARM", "~
      $ gdp          <dbl> 1.890450e+10, 1.540183e+10, 1.717603e+11, 6.470000e+08, 3~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_pop_density`
      Primary key: (`year`, `country_code`)
      
      Rows: 201
      Columns: 3
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ country_code <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG", "ARM", "~
      $ pop_density  <dbl> 57.908252, 104.167555, 17.930316, 236.605000, 162.431915,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_pop_total`
      Primary key: (`year`, `country_code`)
      
      Rows: 201
      Columns: 3
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ country_code <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG", "ARM", "~
      $ pop_total    <dbl> 37769499, 2854191, 42705368, 47321, 76343, 32353588, 4493~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_pop_urban`
      Primary key: (`year`, `country_code`)
      
      Rows: 201
      Columns: 3
      $ year           <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2~
      $ country_code   <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG", "ARM",~
      $ pop_urban_perc <dbl> 25.754, 61.229, 73.189, 87.147, 87.984, 66.177, 91.991,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_budget`
      Primary key: (`year`, `country_code`)
      
      Rows: 203
      Columns: 12
      $ country_code    <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG", "ARM"~
      $ year            <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, ~
      $ budget_lab      <dbl> 2797414, NA, NA, NA, NA, 17133500, 263032, 164346, NA,~
      $ budget_oth      <dbl> 5344361, NA, NA, NA, NA, 4000000, 0, 162174, NA, NA, N~
      $ budget_staff    <dbl> 915527, NA, NA, NA, NA, 1572700, 0, 73866, NA, NA, NA,~
      $ cf_lab          <dbl> 2208668, NA, NA, NA, NA, 7216284, 263032, 164346, NA, ~
      $ cf_staff        <dbl> 871931, NA, NA, NA, NA, 1572700, 0, 73866, NA, NA, NA,~
      $ cf_tot_domestic <dbl> 511854, NA, NA, NA, NA, 13692478, 2510552, 74089, NA, ~
      $ cf_tot_gf       <dbl> 6533095, NA, NA, NA, NA, 2416285, 0, 1130669, NA, NA, ~
      $ cf_tot_grnt     <dbl> 3608394, NA, NA, NA, NA, 4000000, 0, 0, NA, NA, NA, NA~
      $ cf_tot_sources  <dbl> 13419792, NA, NA, NA, NA, 20108763, 2510552, 1204758, ~
      $ cf_tot_usaid    <dbl> 2766449, NA, NA, NA, NA, 0, 0, 0, NA, NA, NA, NA, NA, ~
      
      --------------------------------------------------------------------------------
      
      Table: `who_community`
      Primary key: (`year`, `country_code`)
      
      Rows: 99
      Columns: 9
      $ country_code           <chr> "AFG", "DZA", "AGO", "AZE", "BGD", "BLR", "BEN"~
      $ year                   <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019,~
      $ bmu                    <dbl> 873, 240, 340, 68, 857, 8, 82, 32, 79, 27, NA, ~
      $ bmu_community_impl     <dbl> 719, 0, 9, 0, 481, 8, 82, 0, NA, 27, NA, 23, 96~
      $ bmu_ref_data           <dbl> 719, NA, 9, NA, 481, NA, NA, NA, NA, 0, NA, 23,~
      $ bmu_rxsupport_data     <dbl> NA, NA, NA, NA, 481, NA, NA, NA, NA, NA, NA, 23~
      $ bmu_rxsupport_data_coh <dbl> 873, NA, NA, NA, 242334, NA, NA, NA, NA, NA, NA~
      $ notified_ref           <dbl> 7248, NA, 5630, NA, 242334, NA, NA, NA, NA, 0, ~
      $ notified_ref_community <dbl> 3052, NA, 2742, NA, 138110, NA, NA, NA, NA, 0, ~
      
      --------------------------------------------------------------------------------
      
      Table: `who_estimates`
      Primary key: (`year`, `country_code`)
      
      Rows: 203
      Columns: 8
      $ country_code  <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG", "ARM", ~
      $ year          <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 20~
      $ c_cdr         <dbl> 74, 87, 81, 100, 87, 65, 87, 84, 87, 87, 87, 79, 87, 87,~
      $ c_newinc_100k <dbl> 139.0, 14.0, 49.0, 2.1, 6.5, 229.0, 26.0, 22.0, 1.9, 5.9~
      $ e_inc_100k    <dbl> 189.0, 16.0, 61.0, 2.1, 7.5, 351.0, 29.0, 26.0, 2.2, 6.8~
      $ e_inc_num     <dbl> 71000, 470, 26000, 1, 6, 114000, 13000, 740, 2, 1700, 53~
      $ e_mort_100k   <dbl> 26.00, 0.35, 6.70, 0.17, 0.61, 62.00, 1.80, 1.60, 0.18, ~
      $ e_pop_num     <dbl> 37769499, 2873883, 42705368, 47321, 76343, 32353588, 447~
      
      --------------------------------------------------------------------------------
      
      Table: `who_expenditures`
      Primary key: (`year`, `country_code`)
      
      Rows: 203
      Columns: 9
      $ country_code      <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG", "AR~
      $ year              <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019~
      $ rcvd_lab          <dbl> 2165197, NA, NA, NA, NA, 784599, 0, 171472, NA, NA, ~
      $ rcvd_staff        <dbl> 1956088, NA, NA, NA, NA, 173805, 0, 85257, NA, NA, N~
      $ rcvd_tot_domestic <dbl> 284773, NA, NA, NA, NA, 2856381, 2532872, 3119098, N~
      $ rcvd_tot_gf       <dbl> 6573762, NA, NA, NA, NA, 2416285, 0, 1474278, NA, NA~
      $ rcvd_tot_grnt     <dbl> 4826365, NA, NA, NA, NA, 120054, 0, NA, NA, NA, NA, ~
      $ rcvd_tot_sources  <dbl> 14984900, NA, NA, NA, NA, 5392720, 2532872, 4593376,~
      $ rcvd_tot_usaid    <dbl> 3300000, NA, NA, NA, NA, 0, 0, NA, NA, NA, NA, NA, N~
      
      --------------------------------------------------------------------------------
      
      Table: `who_laboratories`
      Primary key: (`year`, `country_code`)
      
      Rows: 203
      Columns: 11
      $ country_code          <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG",~
      $ year                  <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, ~
      $ culture               <dbl> 4, 1, 29, NA, 7, 0, 148, 1, NA, NA, NA, 7, 1, NA~
      $ lab_cul               <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ lab_sm                <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ smear                 <dbl> 873, 12, 240, NA, 7, 167, 729, 25, NA, NA, NA, 5~
      $ lab_xpert             <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ xpert                 <dbl> 47, 1, 4, NA, 3, 22, 12, 13, NA, NA, NA, 11, 0, ~
      $ m_wrd                 <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ m_wrd_tests_performed <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ m_wrd_tests_positive  <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      
      --------------------------------------------------------------------------------
      
      Table: `who_notifications`
      Primary key: (`year`, `country_code`)
      
      Rows: 203
      Columns: 8
      $ country_code    <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG", "ARM"~
      $ year            <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, ~
      $ conf_rrmdr_tx   <dbl> 396, 2, NA, 0, 0, 1523, 222, 65, 0, 29, NA, 815, 1, 2,~
      $ conf_xdr_tx     <dbl> 5, 0, NA, 0, 0, 0, 4, 12, 0, 1, NA, 186, 0, 0, 7, 287,~
      $ new_clindx      <dbl> 13698, 88, 968, 0, NA, 32278, 2379, 142, 0, 109, 25, 8~
      $ ret_rel_labconf <dbl> 763, 14, 230, 0, NA, 2299, 169, 31, NA, 38, 16, 1000, ~
      $ c_newinc        <dbl> 52438, 412, 20879, 1, 5, 74105, 11446, 621, 2, 1502, 4~
      $ new_labconf     <dbl> 24358, 211, 5422, 1, 4, 34887, 7226, 239, 1, 771, 286,~
      
      --------------------------------------------------------------------------------
      
      Table: `country`
      Primary key: (`year`, `country_code`)
      12 outgoing foreign key(s):
        (`year`, `country_code`) -> (`gf_procurement$year`, `gf_procurement$country_co...
        (`year`, `country_code`) -> (`wb_gdp$year`, `wb_gdp$country_code`) no_action
        (`year`, `country_code`) -> (`wb_pop_density$year`, `wb_pop_density$country_co...
        (`year`, `country_code`) -> (`wb_pop_total$year`, `wb_pop_total$country_code`)...
        (`year`, `country_code`) -> (`wb_pop_urban$year`, `wb_pop_urban$country_code`)...
        (`year`, `country_code`) -> (`who_budget$year`, `who_budget$country_code`) no_...
        (`year`, `country_code`) -> (`who_community$year`, `who_community$country_code...
        (`year`, `country_code`) -> (`who_estimates$year`, `who_estimates$country_code...
        (`year`, `country_code`) -> (`who_expenditures$year`, `who_expenditures$countr...
        (`year`, `country_code`) -> (`who_laboratories$year`, `who_laboratories$countr...
        (`year`, `country_code`) -> (`who_notifications$year`, `who_notifications$coun...
        `country_code` -> `hbc$country_code` no_action
      
      Rows: 203
      Columns: 2
      $ country_code <chr> "ABW", "AFG", "AGO", "ALB", "AND", "ARE", "ARG", "ARM", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      
      --------------------------------------------------------------------------------
      
      Table: `hbc`
      Primary key: `country_code`
      
      Rows: 203
      Columns: 2
      $ country_code <chr> "ABW", "AFG", "AGO", "ALB", "AND", "ARE", "ARG", "ARM", "~
      $ is_hbc       <dbl> 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, ~
      
      --------------------------------------------------------------------------------

---

    Code
      dm::dm_examine_constraints(dm)
    Message
      ! Unsatisfied constraints:
    Output
      * Table `country`: foreign key `year`, `country_code` into table `gf_procurement`: values of `country$year`, `country$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2019, ABW (1), 2019, AFG (1), 2019, AGO (1), 2019, AND (1), 2019, ARE (1), ...
      * Table `country`: foreign key `year`, `country_code` into table `wb_gdp`: values of `country$year`, `country$country_code` not in `wb_gdp$year`, `wb_gdp$country_code`: 2019, COK (1), 2019, WLF (1)
      * Table `country`: foreign key `year`, `country_code` into table `wb_pop_density`: values of `country$year`, `country$country_code` not in `wb_pop_density$year`, `wb_pop_density$country_code`: 2019, COK (1), 2019, WLF (1)
      * Table `country`: foreign key `year`, `country_code` into table `wb_pop_total`: values of `country$year`, `country$country_code` not in `wb_pop_total$year`, `wb_pop_total$country_code`: 2019, COK (1), 2019, WLF (1)
      * Table `country`: foreign key `year`, `country_code` into table `wb_pop_urban`: values of `country$year`, `country$country_code` not in `wb_pop_urban$year`, `wb_pop_urban$country_code`: 2019, COK (1), 2019, WLF (1)
      * Table `country`: foreign key `year`, `country_code` into table `who_community`: values of `country$year`, `country$country_code` not in `who_community$year`, `who_community$country_code`: 2019, ABW (1), 2019, ALB (1), 2019, AND (1), 2019, ARE (1), 2019, ARG (1), ...

---

    Code
      writeLines(dplyr::pull(dplyr::filter(tibble::as_tibble(dm::dm_examine_constraints(
        dm)), problem != ""), problem))
    Output
      values of `country$year`, `country$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2019, ABW (1), 2019, AFG (1), 2019, AGO (1), 2019, AND (1), 2019, ARE (1), ...
      values of `country$year`, `country$country_code` not in `wb_gdp$year`, `wb_gdp$country_code`: 2019, COK (1), 2019, WLF (1)
      values of `country$year`, `country$country_code` not in `wb_pop_density$year`, `wb_pop_density$country_code`: 2019, COK (1), 2019, WLF (1)
      values of `country$year`, `country$country_code` not in `wb_pop_total$year`, `wb_pop_total$country_code`: 2019, COK (1), 2019, WLF (1)
      values of `country$year`, `country$country_code` not in `wb_pop_urban$year`, `wb_pop_urban$country_code`: 2019, COK (1), 2019, WLF (1)
      values of `country$year`, `country$country_code` not in `who_community$year`, `who_community$country_code`: 2019, ABW (1), 2019, ALB (1), 2019, AND (1), 2019, ARE (1), 2019, ARG (1), ...

# build_dm() works and returns a time series

    Code
      dm::glimpse(dm)
    Output
      dm of 13 tables: `gf_procurement`, `wb_gdp`, `wb_pop_density`, `wb_pop_total`, `...
      
      --------------------------------------------------------------------------------
      
      Table: `gf_procurement`
      Primary key: (`year`, `country_code`)
      
      Rows: 137
      Columns: 3
      $ country_code      <chr> "AFG", "AFG", "AGO", "AGO", "ALB", "ARM", "AZE", "BD~
      $ year              <dbl> 2020, 2021, 2020, 2021, 2019, 2020, 2021, 2019, 2021~
      $ total_numb_device <dbl> 55000, 90800, 30000, 43890, 2002, 300, 16500, 9300, ~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_gdp`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,176
      Columns: 3
      $ year         <dbl> 2021, 2020, 2019, 2018, 2017, 2016, 2021, 2020, 2019, 201~
      $ country_code <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "ALB", "ALB", "~
      $ gdp          <dbl> 14583135237, 20143451706, 18904502222, 18418860354, 18896~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_pop_density`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,176
      Columns: 3
      $ year         <dbl> 2021, 2020, 2019, 2018, 2017, 2016, 2021, 2020, 2019, 201~
      $ country_code <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "ALB", "ALB", "~
      $ pop_density  <dbl> 61.48055, 59.75228, 57.90825, 56.24823, 54.64854, 53.1042~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_pop_total`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,176
      Columns: 3
      $ year         <dbl> 2021, 2020, 2019, 2018, 2017, 2016, 2021, 2020, 2019, 201~
      $ country_code <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "ALB", "ALB", "~
      $ pop_total    <dbl> 40099462, 38972230, 37769499, 36686784, 35643418, 3463620~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_pop_urban`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,176
      Columns: 3
      $ year           <dbl> 2021, 2020, 2019, 2018, 2017, 2016, 2021, 2020, 2019, 2~
      $ country_code   <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "ALB", "ALB",~
      $ pop_urban_perc <dbl> 26.314, 26.026, 25.754, 25.495, 25.250, 25.020, 62.969,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_budget`
      Primary key: (`year`, `country_code`)
      
      Rows: 784
      Columns: 12
      $ country_code    <chr> "AFG", "AFG", "AFG", "AFG", "ALB", "ALB", "ALB", "ALB"~
      $ year            <dbl> 2018, 2019, 2020, 2021, 2018, 2019, 2020, 2021, 2018, ~
      $ budget_lab      <dbl> 2543262, 2797414, 3200000, 1696418, NA, NA, NA, NA, NA~
      $ budget_oth      <dbl> NA, 5344361, 4000000, 3606831, NA, NA, NA, NA, NA, NA,~
      $ budget_staff    <dbl> 761828, 915527, 2300000, 570776, NA, NA, NA, NA, NA, N~
      $ cf_lab          <dbl> 2473391, 2208668, 3188713, 1696418, NA, NA, NA, NA, NA~
      $ cf_staff        <dbl> 741545, 871931, 2248593, 570776, NA, NA, NA, NA, NA, N~
      $ cf_tot_domestic <dbl> 533779, 511854, 1171864, NA, NA, NA, NA, NA, NA, NA, N~
      $ cf_tot_gf       <dbl> 3178499, 6533095, 6935551, 7638546, NA, NA, NA, NA, NA~
      $ cf_tot_grnt     <dbl> 2523675, 3608394, 6871009, 2995053, NA, NA, NA, NA, NA~
      $ cf_tot_sources  <dbl> 10698483, 13419792, 17978424, 10633599, NA, NA, NA, NA~
      $ cf_tot_usaid    <dbl> 4462530, 2766449, 3000000, NA, NA, NA, NA, NA, NA, NA,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_community`
      Primary key: (`year`, `country_code`)
      
      Rows: 581
      Columns: 9
      $ country_code           <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "ALB"~
      $ year                   <dbl> 2016, 2017, 2018, 2019, 2020, 2021, 2016, 2016,~
      $ bmu                    <dbl> 778, 817, 887, 873, 857, 852, 28, 240, 250, 247~
      $ bmu_community_impl     <dbl> 778, 817, 887, 719, 857, 718, NA, 240, 17, NA, ~
      $ bmu_ref_data           <dbl> 778, 817, 887, 719, 857, 718, NA, 0, NA, NA, NA~
      $ bmu_rxsupport_data     <dbl> 778, 778, 719, NA, 718, NA, NA, NA, NA, NA, NA,~
      $ bmu_rxsupport_data_coh <dbl> 43046, 46640, 5869, 873, 4981, NA, NA, NA, NA, ~
      $ notified_ref           <dbl> 19710, 47406, 48421, 7248, 46058, 5195, NA, 0, ~
      $ notified_ref_community <dbl> 1857, 5214, 7021, 3052, 7529, 5195, NA, 0, NA, ~
      
      --------------------------------------------------------------------------------
      
      Table: `who_estimates`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,176
      Columns: 8
      $ country_code  <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "ALB", "ALB", ~
      $ year          <dbl> 2016, 2017, 2018, 2019, 2020, 2021, 2016, 2017, 2018, 20~
      $ c_cdr         <dbl> 64, 69, 70, 74, 62, 66, 87, 87, 87, 87, 54, 56, 80, 80, ~
      $ c_newinc_100k <dbl> 121.0, 131.0, 132.0, 139.0, 118.0, 125.0, 14.0, 17.0, 15~
      $ e_inc_100k    <dbl> 189.0, 189.0, 189.0, 189.0, 189.0, 189.0, 17.0, 20.0, 18~
      $ e_inc_num     <dbl> 65000, 67000, 69000, 71000, 74000, 76000, 480, 580, 500,~
      $ e_mort_100k   <dbl> 34.00, 30.00, 29.00, 26.00, 34.00, 31.00, 0.37, 0.38, 0.~
      $ e_pop_num     <dbl> 34636207, 35643418, 36686784, 37769499, 38972230, 400994~
      
      --------------------------------------------------------------------------------
      
      Table: `who_expenditures`
      Primary key: (`year`, `country_code`)
      
      Rows: 980
      Columns: 9
      $ country_code      <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "ALB", "ALB", "AL~
      $ year              <dbl> 2017, 2018, 2019, 2020, 2021, 2017, 2018, 2019, 2020~
      $ rcvd_lab          <dbl> 2463321, 1471438, 2165197, 1540184, 900000, NA, NA, ~
      $ rcvd_staff        <dbl> 625971, 706095, 1956088, 509385, 300000, NA, NA, NA,~
      $ rcvd_tot_domestic <dbl> NA, 551664, 284773, 0, 726302, NA, NA, NA, NA, NA, 8~
      $ rcvd_tot_gf       <dbl> 4088013, 3946378, 6573762, 7613450, 6187410, NA, NA,~
      $ rcvd_tot_grnt     <dbl> 4583464, 3826357, 4826365, 4118876, 1709510, NA, NA,~
      $ rcvd_tot_sources  <dbl> 12071477, 12400144, 14984900, 11732326, 8623222, NA,~
      $ rcvd_tot_usaid    <dbl> 3400000, 4075745, 3300000, NA, NA, NA, NA, NA, NA, N~
      
      --------------------------------------------------------------------------------
      
      Table: `who_laboratories`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,176
      Columns: 11
      $ country_code          <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "ALB",~
      $ year                  <dbl> 2016, 2017, 2018, 2019, 2020, 2021, 2016, 2017, ~
      $ culture               <dbl> 5, 4, 4, 4, 4, 3, 1, 1, 1, 1, 1, 1, 29, 30, 28, ~
      $ lab_cul               <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ lab_sm                <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ smear                 <dbl> 778, 817, 887, 873, 857, 852, 12, 12, 12, 12, 12~
      $ lab_xpert             <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ xpert                 <dbl> 6, 20, 42, 47, NA, NA, 0, 0, 0, 1, NA, NA, 1, 2,~
      $ m_wrd                 <dbl> NA, NA, NA, NA, 76, 84, NA, NA, NA, NA, 1, 1, NA~
      $ m_wrd_tests_performed <dbl> NA, NA, NA, NA, NA, 55909, NA, NA, NA, NA, NA, 1~
      $ m_wrd_tests_positive  <dbl> NA, NA, NA, NA, NA, 18981, NA, NA, NA, NA, NA, 2~
      
      --------------------------------------------------------------------------------
      
      Table: `who_notifications`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,176
      Columns: 8
      $ country_code    <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "ALB", "ALB"~
      $ year            <dbl> 2016, 2017, 2018, 2019, 2020, 2021, 2016, 2017, 2018, ~
      $ conf_rrmdr_tx   <dbl> 153, 198, 317, 396, NA, NA, 1, 0, 4, 2, NA, NA, 31, 40~
      $ conf_xdr_tx     <dbl> 0, 5, 8, 5, NA, NA, 0, 0, 0, 0, NA, NA, 5, 4, 4, NA, N~
      $ new_clindx      <dbl> 11506, 13029, 12436, 13698, 10917, 12254, 92, 131, 118~
      $ ret_rel_labconf <dbl> 1328, 1467, 1477, 763, 435, 501, 7, 15, 10, 14, 13, 5,~
      $ c_newinc        <dbl> 41954, 46640, 48420, 52438, 45818, 50324, 415, 503, 44~
      $ new_labconf     <dbl> 18382, 19479, 20485, 24358, 22888, 24715, 200, 195, 19~
      
      --------------------------------------------------------------------------------
      
      Table: `country`
      Primary key: (`year`, `country_code`)
      12 outgoing foreign key(s):
        (`year`, `country_code`) -> (`gf_procurement$year`, `gf_procurement$country_co...
        (`year`, `country_code`) -> (`wb_gdp$year`, `wb_gdp$country_code`) no_action
        (`year`, `country_code`) -> (`wb_pop_density$year`, `wb_pop_density$country_co...
        (`year`, `country_code`) -> (`wb_pop_total$year`, `wb_pop_total$country_code`)...
        (`year`, `country_code`) -> (`wb_pop_urban$year`, `wb_pop_urban$country_code`)...
        (`year`, `country_code`) -> (`who_budget$year`, `who_budget$country_code`) no_...
        (`year`, `country_code`) -> (`who_community$year`, `who_community$country_code...
        (`year`, `country_code`) -> (`who_estimates$year`, `who_estimates$country_code...
        (`year`, `country_code`) -> (`who_expenditures$year`, `who_expenditures$countr...
        (`year`, `country_code`) -> (`who_laboratories$year`, `who_laboratories$countr...
        (`year`, `country_code`) -> (`who_notifications$year`, `who_notifications$coun...
        `country_code` -> `hbc$country_code` no_action
      
      Rows: 1,176
      Columns: 2
      $ country_code <chr> "ABW", "ABW", "ABW", "ABW", "ABW", "ABW", "AFG", "AFG", "~
      $ year         <int> 2016, 2017, 2018, 2019, 2020, 2021, 2016, 2017, 2018, 201~
      
      --------------------------------------------------------------------------------
      
      Table: `hbc`
      Primary key: `country_code`
      
      Rows: 196
      Columns: 2
      $ country_code <chr> "ABW", "AFG", "AGO", "ALB", "AND", "ARE", "ARG", "ARM", "~
      $ is_hbc       <dbl> 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, ~
      
      --------------------------------------------------------------------------------

---

    Code
      dm::dm_examine_constraints(dm)
    Message
      ! Unsatisfied constraints:
    Output
      * Table `country`: foreign key `year`, `country_code` into table `gf_procurement`: values of `country$year`, `country$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2016, ABW (1), 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), ...
      * Table `country`: foreign key `year`, `country_code` into table `who_budget`: values of `country$year`, `country$country_code` not in `who_budget$year`, `who_budget$country_code`: 2016, ABW (1), 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), ...
      * Table `country`: foreign key `year`, `country_code` into table `who_community`: values of `country$year`, `country$country_code` not in `who_community$year`, `who_community$country_code`: 2016, ABW (1), 2016, AND (1), 2016, ARE (1), 2016, ARG (1), 2016, AUS (1), ...
      * Table `country`: foreign key `year`, `country_code` into table `who_expenditures`: values of `country$year`, `country$country_code` not in `who_expenditures$year`, `who_expenditures$country_code`: 2016, ABW (1), 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), ...

---

    Code
      writeLines(dplyr::pull(dplyr::filter(tibble::as_tibble(dm::dm_examine_constraints(
        dm)), problem != ""), problem))
    Output
      values of `country$year`, `country$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2016, ABW (1), 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), ...
      values of `country$year`, `country$country_code` not in `who_budget$year`, `who_budget$country_code`: 2016, ABW (1), 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), ...
      values of `country$year`, `country$country_code` not in `who_community$year`, `who_community$country_code`: 2016, ABW (1), 2016, AND (1), 2016, ARE (1), 2016, ARG (1), 2016, AUS (1), ...
      values of `country$year`, `country$country_code` not in `who_expenditures$year`, `who_expenditures$country_code`: 2016, ABW (1), 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), ...

# build_dm() with `NULL` args.

    Code
      dm::glimpse(dm)
    Output
      dm of 13 tables: `gf_procurement`, `wb_gdp`, `wb_pop_density`, `wb_pop_total`, `...
      
      --------------------------------------------------------------------------------
      
      Table: `gf_procurement`
      Primary key: (`year`, `country_code`)
      
      Rows: 41
      Columns: 3
      $ country_code      <chr> "ALB", "BDI", "BFA", "BLR", "BLZ", "BTN", "COG", "CO~
      $ year              <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019~
      $ total_numb_device <dbl> 2002, 9300, 310000, 3360, 850, 2552, 3450, 2, 17693,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_gdp`
      Primary key: (`year`, `country_code`)
      
      Rows: 201
      Columns: 3
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ country_code <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG", "ARM", "~
      $ gdp          <dbl> 1.890450e+10, 1.540183e+10, 1.717603e+11, 6.470000e+08, 3~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_pop_density`
      Primary key: (`year`, `country_code`)
      
      Rows: 201
      Columns: 3
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ country_code <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG", "ARM", "~
      $ pop_density  <dbl> 57.908252, 104.167555, 17.930316, 236.605000, 162.431915,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_pop_total`
      Primary key: (`year`, `country_code`)
      
      Rows: 201
      Columns: 3
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ country_code <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG", "ARM", "~
      $ pop_total    <dbl> 37769499, 2854191, 42705368, 47321, 76343, 32353588, 4493~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_pop_urban`
      Primary key: (`year`, `country_code`)
      
      Rows: 201
      Columns: 3
      $ year           <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2~
      $ country_code   <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG", "ARM",~
      $ pop_urban_perc <dbl> 25.754, 61.229, 73.189, 87.147, 87.984, 66.177, 91.991,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_budget`
      Primary key: (`year`, `country_code`)
      
      Rows: 203
      Columns: 12
      $ country_code    <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG", "ARM"~
      $ year            <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, ~
      $ budget_lab      <dbl> 2797414, NA, NA, NA, NA, 17133500, 263032, 164346, NA,~
      $ budget_oth      <dbl> 5344361, NA, NA, NA, NA, 4000000, 0, 162174, NA, NA, N~
      $ budget_staff    <dbl> 915527, NA, NA, NA, NA, 1572700, 0, 73866, NA, NA, NA,~
      $ cf_lab          <dbl> 2208668, NA, NA, NA, NA, 7216284, 263032, 164346, NA, ~
      $ cf_staff        <dbl> 871931, NA, NA, NA, NA, 1572700, 0, 73866, NA, NA, NA,~
      $ cf_tot_domestic <dbl> 511854, NA, NA, NA, NA, 13692478, 2510552, 74089, NA, ~
      $ cf_tot_gf       <dbl> 6533095, NA, NA, NA, NA, 2416285, 0, 1130669, NA, NA, ~
      $ cf_tot_grnt     <dbl> 3608394, NA, NA, NA, NA, 4000000, 0, 0, NA, NA, NA, NA~
      $ cf_tot_sources  <dbl> 13419792, NA, NA, NA, NA, 20108763, 2510552, 1204758, ~
      $ cf_tot_usaid    <dbl> 2766449, NA, NA, NA, NA, 0, 0, 0, NA, NA, NA, NA, NA, ~
      
      --------------------------------------------------------------------------------
      
      Table: `who_community`
      Primary key: (`year`, `country_code`)
      
      Rows: 99
      Columns: 9
      $ country_code           <chr> "AFG", "DZA", "AGO", "AZE", "BGD", "BLR", "BEN"~
      $ year                   <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019,~
      $ bmu                    <dbl> 873, 240, 340, 68, 857, 8, 82, 32, 79, 27, NA, ~
      $ bmu_community_impl     <dbl> 719, 0, 9, 0, 481, 8, 82, 0, NA, 27, NA, 23, 96~
      $ bmu_ref_data           <dbl> 719, NA, 9, NA, 481, NA, NA, NA, NA, 0, NA, 23,~
      $ bmu_rxsupport_data     <dbl> NA, NA, NA, NA, 481, NA, NA, NA, NA, NA, NA, 23~
      $ bmu_rxsupport_data_coh <dbl> 873, NA, NA, NA, 242334, NA, NA, NA, NA, NA, NA~
      $ notified_ref           <dbl> 7248, NA, 5630, NA, 242334, NA, NA, NA, NA, 0, ~
      $ notified_ref_community <dbl> 3052, NA, 2742, NA, 138110, NA, NA, NA, NA, 0, ~
      
      --------------------------------------------------------------------------------
      
      Table: `who_estimates`
      Primary key: (`year`, `country_code`)
      
      Rows: 203
      Columns: 8
      $ country_code  <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG", "ARM", ~
      $ year          <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 20~
      $ c_cdr         <dbl> 74, 87, 81, 100, 87, 65, 87, 84, 87, 87, 87, 79, 87, 87,~
      $ c_newinc_100k <dbl> 139.0, 14.0, 49.0, 2.1, 6.5, 229.0, 26.0, 22.0, 1.9, 5.9~
      $ e_inc_100k    <dbl> 189.0, 16.0, 61.0, 2.1, 7.5, 351.0, 29.0, 26.0, 2.2, 6.8~
      $ e_inc_num     <dbl> 71000, 470, 26000, 1, 6, 114000, 13000, 740, 2, 1700, 53~
      $ e_mort_100k   <dbl> 26.00, 0.35, 6.70, 0.17, 0.61, 62.00, 1.80, 1.60, 0.18, ~
      $ e_pop_num     <dbl> 37769499, 2873883, 42705368, 47321, 76343, 32353588, 447~
      
      --------------------------------------------------------------------------------
      
      Table: `who_expenditures`
      Primary key: (`year`, `country_code`)
      
      Rows: 203
      Columns: 9
      $ country_code      <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG", "AR~
      $ year              <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019~
      $ rcvd_lab          <dbl> 2165197, NA, NA, NA, NA, 784599, 0, 171472, NA, NA, ~
      $ rcvd_staff        <dbl> 1956088, NA, NA, NA, NA, 173805, 0, 85257, NA, NA, N~
      $ rcvd_tot_domestic <dbl> 284773, NA, NA, NA, NA, 2856381, 2532872, 3119098, N~
      $ rcvd_tot_gf       <dbl> 6573762, NA, NA, NA, NA, 2416285, 0, 1474278, NA, NA~
      $ rcvd_tot_grnt     <dbl> 4826365, NA, NA, NA, NA, 120054, 0, NA, NA, NA, NA, ~
      $ rcvd_tot_sources  <dbl> 14984900, NA, NA, NA, NA, 5392720, 2532872, 4593376,~
      $ rcvd_tot_usaid    <dbl> 3300000, NA, NA, NA, NA, 0, 0, NA, NA, NA, NA, NA, N~
      
      --------------------------------------------------------------------------------
      
      Table: `who_laboratories`
      Primary key: (`year`, `country_code`)
      
      Rows: 203
      Columns: 11
      $ country_code          <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG",~
      $ year                  <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, ~
      $ culture               <dbl> 4, 1, 29, NA, 7, 0, 148, 1, NA, NA, NA, 7, 1, NA~
      $ lab_cul               <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ lab_sm                <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ smear                 <dbl> 873, 12, 240, NA, 7, 167, 729, 25, NA, NA, NA, 5~
      $ lab_xpert             <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ xpert                 <dbl> 47, 1, 4, NA, 3, 22, 12, 13, NA, NA, NA, 11, 0, ~
      $ m_wrd                 <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ m_wrd_tests_performed <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ m_wrd_tests_positive  <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      
      --------------------------------------------------------------------------------
      
      Table: `who_notifications`
      Primary key: (`year`, `country_code`)
      
      Rows: 203
      Columns: 8
      $ country_code    <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AGO", "ARG", "ARM"~
      $ year            <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, ~
      $ conf_rrmdr_tx   <dbl> 396, 2, NA, 0, 0, 1523, 222, 65, 0, 29, NA, 815, 1, 2,~
      $ conf_xdr_tx     <dbl> 5, 0, NA, 0, 0, 0, 4, 12, 0, 1, NA, 186, 0, 0, 7, 287,~
      $ new_clindx      <dbl> 13698, 88, 968, 0, NA, 32278, 2379, 142, 0, 109, 25, 8~
      $ ret_rel_labconf <dbl> 763, 14, 230, 0, NA, 2299, 169, 31, NA, 38, 16, 1000, ~
      $ c_newinc        <dbl> 52438, 412, 20879, 1, 5, 74105, 11446, 621, 2, 1502, 4~
      $ new_labconf     <dbl> 24358, 211, 5422, 1, 4, 34887, 7226, 239, 1, 771, 286,~
      
      --------------------------------------------------------------------------------
      
      Table: `country`
      Primary key: (`year`, `country_code`)
      12 outgoing foreign key(s):
        (`year`, `country_code`) -> (`gf_procurement$year`, `gf_procurement$country_co...
        (`year`, `country_code`) -> (`wb_gdp$year`, `wb_gdp$country_code`) no_action
        (`year`, `country_code`) -> (`wb_pop_density$year`, `wb_pop_density$country_co...
        (`year`, `country_code`) -> (`wb_pop_total$year`, `wb_pop_total$country_code`)...
        (`year`, `country_code`) -> (`wb_pop_urban$year`, `wb_pop_urban$country_code`)...
        (`year`, `country_code`) -> (`who_budget$year`, `who_budget$country_code`) no_...
        (`year`, `country_code`) -> (`who_community$year`, `who_community$country_code...
        (`year`, `country_code`) -> (`who_estimates$year`, `who_estimates$country_code...
        (`year`, `country_code`) -> (`who_expenditures$year`, `who_expenditures$countr...
        (`year`, `country_code`) -> (`who_laboratories$year`, `who_laboratories$countr...
        (`year`, `country_code`) -> (`who_notifications$year`, `who_notifications$coun...
        `country_code` -> `hbc$country_code` no_action
      
      Rows: 203
      Columns: 2
      $ country_code <chr> "ABW", "AFG", "AGO", "ALB", "AND", "ARE", "ARG", "ARM", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      
      --------------------------------------------------------------------------------
      
      Table: `hbc`
      Primary key: `country_code`
      
      Rows: 203
      Columns: 2
      $ country_code <chr> "ABW", "AFG", "AGO", "ALB", "AND", "ARE", "ARG", "ARM", "~
      $ is_hbc       <dbl> 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, ~
      
      --------------------------------------------------------------------------------

---

    Code
      dm::dm_examine_constraints(dm)
    Message
      ! Unsatisfied constraints:
    Output
      * Table `country`: foreign key `year`, `country_code` into table `gf_procurement`: values of `country$year`, `country$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2019, ABW (1), 2019, AFG (1), 2019, AGO (1), 2019, AND (1), 2019, ARE (1), ...
      * Table `country`: foreign key `year`, `country_code` into table `wb_gdp`: values of `country$year`, `country$country_code` not in `wb_gdp$year`, `wb_gdp$country_code`: 2019, COK (1), 2019, WLF (1)
      * Table `country`: foreign key `year`, `country_code` into table `wb_pop_density`: values of `country$year`, `country$country_code` not in `wb_pop_density$year`, `wb_pop_density$country_code`: 2019, COK (1), 2019, WLF (1)
      * Table `country`: foreign key `year`, `country_code` into table `wb_pop_total`: values of `country$year`, `country$country_code` not in `wb_pop_total$year`, `wb_pop_total$country_code`: 2019, COK (1), 2019, WLF (1)
      * Table `country`: foreign key `year`, `country_code` into table `wb_pop_urban`: values of `country$year`, `country$country_code` not in `wb_pop_urban$year`, `wb_pop_urban$country_code`: 2019, COK (1), 2019, WLF (1)
      * Table `country`: foreign key `year`, `country_code` into table `who_community`: values of `country$year`, `country$country_code` not in `who_community$year`, `who_community$country_code`: 2019, ABW (1), 2019, ALB (1), 2019, AND (1), 2019, ARE (1), 2019, ARG (1), ...

---

    Code
      writeLines(dplyr::pull(dplyr::filter(tibble::as_tibble(dm::dm_examine_constraints(
        dm)), problem != ""), problem))
    Output
      values of `country$year`, `country$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2019, ABW (1), 2019, AFG (1), 2019, AGO (1), 2019, AND (1), 2019, ARE (1), ...
      values of `country$year`, `country$country_code` not in `wb_gdp$year`, `wb_gdp$country_code`: 2019, COK (1), 2019, WLF (1)
      values of `country$year`, `country$country_code` not in `wb_pop_density$year`, `wb_pop_density$country_code`: 2019, COK (1), 2019, WLF (1)
      values of `country$year`, `country$country_code` not in `wb_pop_total$year`, `wb_pop_total$country_code`: 2019, COK (1), 2019, WLF (1)
      values of `country$year`, `country$country_code` not in `wb_pop_urban$year`, `wb_pop_urban$country_code`: 2019, COK (1), 2019, WLF (1)
      values of `country$year`, `country$country_code` not in `who_community$year`, `who_community$country_code`: 2019, ABW (1), 2019, ALB (1), 2019, AND (1), 2019, ARE (1), 2019, ARG (1), ...

# build_dm() works and returns a time series with `NULL` args.

    Code
      dm::glimpse(dm)
    Output
      dm of 13 tables: `gf_procurement`, `wb_gdp`, `wb_pop_density`, `wb_pop_total`, `...
      
      --------------------------------------------------------------------------------
      
      Table: `gf_procurement`
      Primary key: (`year`, `country_code`)
      
      Rows: 137
      Columns: 3
      $ country_code      <chr> "AFG", "AFG", "AGO", "AGO", "ALB", "ARM", "AZE", "BD~
      $ year              <dbl> 2020, 2021, 2020, 2021, 2019, 2020, 2021, 2019, 2021~
      $ total_numb_device <dbl> 55000, 90800, 30000, 43890, 2002, 300, 16500, 9300, ~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_gdp`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,176
      Columns: 3
      $ year         <dbl> 2021, 2020, 2019, 2018, 2017, 2016, 2021, 2020, 2019, 201~
      $ country_code <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "ALB", "ALB", "~
      $ gdp          <dbl> 14583135237, 20143451706, 18904502222, 18418860354, 18896~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_pop_density`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,176
      Columns: 3
      $ year         <dbl> 2021, 2020, 2019, 2018, 2017, 2016, 2021, 2020, 2019, 201~
      $ country_code <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "ALB", "ALB", "~
      $ pop_density  <dbl> 61.48055, 59.75228, 57.90825, 56.24823, 54.64854, 53.1042~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_pop_total`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,176
      Columns: 3
      $ year         <dbl> 2021, 2020, 2019, 2018, 2017, 2016, 2021, 2020, 2019, 201~
      $ country_code <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "ALB", "ALB", "~
      $ pop_total    <dbl> 40099462, 38972230, 37769499, 36686784, 35643418, 3463620~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_pop_urban`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,176
      Columns: 3
      $ year           <dbl> 2021, 2020, 2019, 2018, 2017, 2016, 2021, 2020, 2019, 2~
      $ country_code   <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "ALB", "ALB",~
      $ pop_urban_perc <dbl> 26.314, 26.026, 25.754, 25.495, 25.250, 25.020, 62.969,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_budget`
      Primary key: (`year`, `country_code`)
      
      Rows: 784
      Columns: 12
      $ country_code    <chr> "AFG", "AFG", "AFG", "AFG", "ALB", "ALB", "ALB", "ALB"~
      $ year            <dbl> 2018, 2019, 2020, 2021, 2018, 2019, 2020, 2021, 2018, ~
      $ budget_lab      <dbl> 2543262, 2797414, 3200000, 1696418, NA, NA, NA, NA, NA~
      $ budget_oth      <dbl> NA, 5344361, 4000000, 3606831, NA, NA, NA, NA, NA, NA,~
      $ budget_staff    <dbl> 761828, 915527, 2300000, 570776, NA, NA, NA, NA, NA, N~
      $ cf_lab          <dbl> 2473391, 2208668, 3188713, 1696418, NA, NA, NA, NA, NA~
      $ cf_staff        <dbl> 741545, 871931, 2248593, 570776, NA, NA, NA, NA, NA, N~
      $ cf_tot_domestic <dbl> 533779, 511854, 1171864, NA, NA, NA, NA, NA, NA, NA, N~
      $ cf_tot_gf       <dbl> 3178499, 6533095, 6935551, 7638546, NA, NA, NA, NA, NA~
      $ cf_tot_grnt     <dbl> 2523675, 3608394, 6871009, 2995053, NA, NA, NA, NA, NA~
      $ cf_tot_sources  <dbl> 10698483, 13419792, 17978424, 10633599, NA, NA, NA, NA~
      $ cf_tot_usaid    <dbl> 4462530, 2766449, 3000000, NA, NA, NA, NA, NA, NA, NA,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_community`
      Primary key: (`year`, `country_code`)
      
      Rows: 581
      Columns: 9
      $ country_code           <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "ALB"~
      $ year                   <dbl> 2016, 2017, 2018, 2019, 2020, 2021, 2016, 2016,~
      $ bmu                    <dbl> 778, 817, 887, 873, 857, 852, 28, 240, 250, 247~
      $ bmu_community_impl     <dbl> 778, 817, 887, 719, 857, 718, NA, 240, 17, NA, ~
      $ bmu_ref_data           <dbl> 778, 817, 887, 719, 857, 718, NA, 0, NA, NA, NA~
      $ bmu_rxsupport_data     <dbl> 778, 778, 719, NA, 718, NA, NA, NA, NA, NA, NA,~
      $ bmu_rxsupport_data_coh <dbl> 43046, 46640, 5869, 873, 4981, NA, NA, NA, NA, ~
      $ notified_ref           <dbl> 19710, 47406, 48421, 7248, 46058, 5195, NA, 0, ~
      $ notified_ref_community <dbl> 1857, 5214, 7021, 3052, 7529, 5195, NA, 0, NA, ~
      
      --------------------------------------------------------------------------------
      
      Table: `who_estimates`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,176
      Columns: 8
      $ country_code  <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "ALB", "ALB", ~
      $ year          <dbl> 2016, 2017, 2018, 2019, 2020, 2021, 2016, 2017, 2018, 20~
      $ c_cdr         <dbl> 64, 69, 70, 74, 62, 66, 87, 87, 87, 87, 54, 56, 80, 80, ~
      $ c_newinc_100k <dbl> 121.0, 131.0, 132.0, 139.0, 118.0, 125.0, 14.0, 17.0, 15~
      $ e_inc_100k    <dbl> 189.0, 189.0, 189.0, 189.0, 189.0, 189.0, 17.0, 20.0, 18~
      $ e_inc_num     <dbl> 65000, 67000, 69000, 71000, 74000, 76000, 480, 580, 500,~
      $ e_mort_100k   <dbl> 34.00, 30.00, 29.00, 26.00, 34.00, 31.00, 0.37, 0.38, 0.~
      $ e_pop_num     <dbl> 34636207, 35643418, 36686784, 37769499, 38972230, 400994~
      
      --------------------------------------------------------------------------------
      
      Table: `who_expenditures`
      Primary key: (`year`, `country_code`)
      
      Rows: 980
      Columns: 9
      $ country_code      <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "ALB", "ALB", "AL~
      $ year              <dbl> 2017, 2018, 2019, 2020, 2021, 2017, 2018, 2019, 2020~
      $ rcvd_lab          <dbl> 2463321, 1471438, 2165197, 1540184, 900000, NA, NA, ~
      $ rcvd_staff        <dbl> 625971, 706095, 1956088, 509385, 300000, NA, NA, NA,~
      $ rcvd_tot_domestic <dbl> NA, 551664, 284773, 0, 726302, NA, NA, NA, NA, NA, 8~
      $ rcvd_tot_gf       <dbl> 4088013, 3946378, 6573762, 7613450, 6187410, NA, NA,~
      $ rcvd_tot_grnt     <dbl> 4583464, 3826357, 4826365, 4118876, 1709510, NA, NA,~
      $ rcvd_tot_sources  <dbl> 12071477, 12400144, 14984900, 11732326, 8623222, NA,~
      $ rcvd_tot_usaid    <dbl> 3400000, 4075745, 3300000, NA, NA, NA, NA, NA, NA, N~
      
      --------------------------------------------------------------------------------
      
      Table: `who_laboratories`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,176
      Columns: 11
      $ country_code          <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "ALB",~
      $ year                  <dbl> 2016, 2017, 2018, 2019, 2020, 2021, 2016, 2017, ~
      $ culture               <dbl> 5, 4, 4, 4, 4, 3, 1, 1, 1, 1, 1, 1, 29, 30, 28, ~
      $ lab_cul               <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ lab_sm                <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ smear                 <dbl> 778, 817, 887, 873, 857, 852, 12, 12, 12, 12, 12~
      $ lab_xpert             <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ xpert                 <dbl> 6, 20, 42, 47, NA, NA, 0, 0, 0, 1, NA, NA, 1, 2,~
      $ m_wrd                 <dbl> NA, NA, NA, NA, 76, 84, NA, NA, NA, NA, 1, 1, NA~
      $ m_wrd_tests_performed <dbl> NA, NA, NA, NA, NA, 55909, NA, NA, NA, NA, NA, 1~
      $ m_wrd_tests_positive  <dbl> NA, NA, NA, NA, NA, 18981, NA, NA, NA, NA, NA, 2~
      
      --------------------------------------------------------------------------------
      
      Table: `who_notifications`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,176
      Columns: 8
      $ country_code    <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "ALB", "ALB"~
      $ year            <dbl> 2016, 2017, 2018, 2019, 2020, 2021, 2016, 2017, 2018, ~
      $ conf_rrmdr_tx   <dbl> 153, 198, 317, 396, NA, NA, 1, 0, 4, 2, NA, NA, 31, 40~
      $ conf_xdr_tx     <dbl> 0, 5, 8, 5, NA, NA, 0, 0, 0, 0, NA, NA, 5, 4, 4, NA, N~
      $ new_clindx      <dbl> 11506, 13029, 12436, 13698, 10917, 12254, 92, 131, 118~
      $ ret_rel_labconf <dbl> 1328, 1467, 1477, 763, 435, 501, 7, 15, 10, 14, 13, 5,~
      $ c_newinc        <dbl> 41954, 46640, 48420, 52438, 45818, 50324, 415, 503, 44~
      $ new_labconf     <dbl> 18382, 19479, 20485, 24358, 22888, 24715, 200, 195, 19~
      
      --------------------------------------------------------------------------------
      
      Table: `country`
      Primary key: (`year`, `country_code`)
      12 outgoing foreign key(s):
        (`year`, `country_code`) -> (`gf_procurement$year`, `gf_procurement$country_co...
        (`year`, `country_code`) -> (`wb_gdp$year`, `wb_gdp$country_code`) no_action
        (`year`, `country_code`) -> (`wb_pop_density$year`, `wb_pop_density$country_co...
        (`year`, `country_code`) -> (`wb_pop_total$year`, `wb_pop_total$country_code`)...
        (`year`, `country_code`) -> (`wb_pop_urban$year`, `wb_pop_urban$country_code`)...
        (`year`, `country_code`) -> (`who_budget$year`, `who_budget$country_code`) no_...
        (`year`, `country_code`) -> (`who_community$year`, `who_community$country_code...
        (`year`, `country_code`) -> (`who_estimates$year`, `who_estimates$country_code...
        (`year`, `country_code`) -> (`who_expenditures$year`, `who_expenditures$countr...
        (`year`, `country_code`) -> (`who_laboratories$year`, `who_laboratories$countr...
        (`year`, `country_code`) -> (`who_notifications$year`, `who_notifications$coun...
        `country_code` -> `hbc$country_code` no_action
      
      Rows: 1,176
      Columns: 2
      $ country_code <chr> "ABW", "ABW", "ABW", "ABW", "ABW", "ABW", "AFG", "AFG", "~
      $ year         <int> 2016, 2017, 2018, 2019, 2020, 2021, 2016, 2017, 2018, 201~
      
      --------------------------------------------------------------------------------
      
      Table: `hbc`
      Primary key: `country_code`
      
      Rows: 196
      Columns: 2
      $ country_code <chr> "ABW", "AFG", "AGO", "ALB", "AND", "ARE", "ARG", "ARM", "~
      $ is_hbc       <dbl> 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, ~
      
      --------------------------------------------------------------------------------

---

    Code
      dm::dm_examine_constraints(dm)
    Message
      ! Unsatisfied constraints:
    Output
      * Table `country`: foreign key `year`, `country_code` into table `gf_procurement`: values of `country$year`, `country$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2016, ABW (1), 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), ...
      * Table `country`: foreign key `year`, `country_code` into table `who_budget`: values of `country$year`, `country$country_code` not in `who_budget$year`, `who_budget$country_code`: 2016, ABW (1), 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), ...
      * Table `country`: foreign key `year`, `country_code` into table `who_community`: values of `country$year`, `country$country_code` not in `who_community$year`, `who_community$country_code`: 2016, ABW (1), 2016, AND (1), 2016, ARE (1), 2016, ARG (1), 2016, AUS (1), ...
      * Table `country`: foreign key `year`, `country_code` into table `who_expenditures`: values of `country$year`, `country$country_code` not in `who_expenditures$year`, `who_expenditures$country_code`: 2016, ABW (1), 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), ...

---

    Code
      writeLines(dplyr::pull(dplyr::filter(tibble::as_tibble(dm::dm_examine_constraints(
        dm)), problem != ""), problem))
    Output
      values of `country$year`, `country$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2016, ABW (1), 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), ...
      values of `country$year`, `country$country_code` not in `who_budget$year`, `who_budget$country_code`: 2016, ABW (1), 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), ...
      values of `country$year`, `country$country_code` not in `who_community$year`, `who_community$country_code`: 2016, ABW (1), 2016, AND (1), 2016, ARE (1), 2016, ARG (1), 2016, AUS (1), ...
      values of `country$year`, `country$country_code` not in `who_expenditures$year`, `who_expenditures$country_code`: 2016, ABW (1), 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), ...

