# build_dm()

    Code
      dm::glimpse(dm)
    Output
      dm of 12 tables: `wb_tot_pop`, `wb_urb_pop`, `wb_density_pop`, `wb_gdp`, `who_no...
      
      --------------------------------------------------------------------------------
      
      Table: `wb_tot_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 190
      Columns: 3
      $ country_code <chr> "AFG", "ALB", "DZA", "AND", "AGO", "ARG", "ARM", "AUS", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ pop_total    <dbl> 37769499, 2854191, 42705368, 76343, 32353588, 44938712, 2~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_urb_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 190
      Columns: 3
      $ country_code   <chr> "AFG", "ALB", "DZA", "AND", "AGO", "ARG", "ARM", "AUS",~
      $ year           <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2~
      $ pop_urban_perc <dbl> 25.754, 61.229, 73.189, 87.984, 66.177, 91.991, 63.219,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_density_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 190
      Columns: 3
      $ country_code <chr> "AFG", "ALB", "DZA", "AND", "AGO", "ARG", "ARM", "AUS", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ pop_density  <dbl> 57.908252, 104.167555, 17.930316, 162.431915, 25.951382, ~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_gdp`
      Primary key: (`year`, `country_code`)
      
      Rows: 190
      Columns: 3
      $ country_code <chr> "AFG", "ALB", "DZA", "AND", "AGO", "ARG", "ARM", "AUS", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ gdp          <dbl> 1.890450e+10, 1.540183e+10, 1.717603e+11, 3.155149e+09, 6~
      
      --------------------------------------------------------------------------------
      
      Table: `who_notifications`
      Primary key: (`year`, `country_code`)
      
      Rows: 190
      Columns: 8
      $ country_code    <chr> "AFG", "ALB", "DZA", "AND", "AGO", "ARG", "ARM", "AUS"~
      $ year            <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, ~
      $ conf_rrmdr_tx   <dbl> 396, 2, NA, 0, 1523, 222, 65, 29, NA, 815, 1, 1243, 10~
      $ conf_xdr_tx     <dbl> 5, 0, NA, 0, 0, 4, 12, 1, NA, 186, 0, 7, 287, 0, 0, 1,~
      $ new_clindx      <dbl> 13698, 88, 968, NA, 32278, 2379, 142, 109, 25, 872, 28~
      $ ret_rel_labconf <dbl> 763, 14, 230, NA, 2299, 169, 31, 38, 16, 1000, 4, 6134~
      $ c_newinc        <dbl> 52438, 412, 20879, 5, 74105, 11446, 621, 1502, 464, 48~
      $ new_labconf     <dbl> 24358, 211, 5422, 4, 34887, 7226, 239, 771, 286, 1911,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_estimates`
      Primary key: (`year`, `country_code`)
      
      Rows: 190
      Columns: 8
      $ country_code  <chr> "AFG", "ALB", "DZA", "AND", "AGO", "ARG", "ARM", "AUS", ~
      $ year          <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 20~
      $ c_cdr         <dbl> 74, 87, 81, 87, 65, 87, 84, 87, 87, 79, 87, 80, 78, 87, ~
      $ c_newinc_100k <dbl> 139.0, 14.0, 49.0, 6.5, 229.0, 26.0, 22.0, 5.9, 5.2, 47.~
      $ e_inc_100k    <dbl> 189.0, 16.0, 61.0, 7.5, 351.0, 29.0, 26.0, 6.8, 6.0, 60.~
      $ e_inc_num     <dbl> 71000, 470, 26000, 6, 114000, 13000, 740, 1700, 530, 610~
      $ e_mort_100k   <dbl> 26.00, 0.35, 6.70, 0.61, 62.00, 1.80, 1.60, 0.24, 0.48, ~
      $ e_pop_num     <dbl> 37769499, 2873883, 42705368, 76343, 32353588, 44745520, ~
      
      --------------------------------------------------------------------------------
      
      Table: `who_budget`
      Primary key: (`year`, `country_code`)
      
      Rows: 190
      Columns: 12
      $ country_code    <chr> "AFG", "ALB", "DZA", "AND", "AGO", "ARG", "ARM", "AUS"~
      $ year            <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, ~
      $ budget_lab      <dbl> 2797414, NA, NA, NA, 17133500, 263032, 164346, NA, NA,~
      $ budget_oth      <dbl> 5344361, NA, NA, NA, 4000000, 0, 162174, NA, NA, 10796~
      $ budget_staff    <dbl> 915527, NA, NA, NA, 1572700, 0, 73866, NA, NA, 1032036~
      $ cf_lab          <dbl> 2208668, NA, NA, NA, 7216284, 263032, 164346, NA, NA, ~
      $ cf_staff        <dbl> 871931, NA, NA, NA, 1572700, 0, 73866, NA, NA, 1032036~
      $ cf_tot_domestic <dbl> 511854, NA, NA, NA, 13692478, 2510552, 74089, NA, NA, ~
      $ cf_tot_gf       <dbl> 6533095, NA, NA, NA, 2416285, 0, 1130669, NA, NA, 4397~
      $ cf_tot_grnt     <dbl> 3608394, NA, NA, NA, 4000000, 0, 0, NA, NA, NA, NA, 0,~
      $ cf_tot_sources  <dbl> 13419792, NA, NA, NA, 20108763, 2510552, 1204758, NA, ~
      $ cf_tot_usaid    <dbl> 2766449, NA, NA, NA, 0, 0, 0, NA, NA, NA, NA, 12981354~
      
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
      
      Table: `who_sites`
      Primary key: (`year`, `country_code`)
      
      Rows: 190
      Columns: 11
      $ country_code          <chr> "AFG", "ALB", "DZA", "AND", "AGO", "ARG", "ARM",~
      $ year                  <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, ~
      $ culture               <dbl> 4, 1, 29, 7, 0, 148, 1, NA, NA, 7, 1, 5, 16, 101~
      $ lab_cul               <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ lab_sm                <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ smear                 <dbl> 873, 12, 240, 7, 167, 729, 25, NA, NA, 55, 1, 11~
      $ lab_xpert             <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ xpert                 <dbl> 47, 1, 4, 3, 22, 12, 13, NA, NA, 11, 0, 200, 26,~
      $ m_wrd                 <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ m_wrd_tests_performed <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ m_wrd_tests_positive  <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      
      --------------------------------------------------------------------------------
      
      Table: `who_expenditures`
      Primary key: (`year`, `country_code`)
      
      Rows: 190
      Columns: 9
      $ country_code      <chr> "AFG", "ALB", "DZA", "AND", "AGO", "ARG", "ARM", "AU~
      $ year              <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019~
      $ rcvd_lab          <dbl> 2165197, NA, NA, NA, 784599, 0, 171472, NA, NA, 6420~
      $ rcvd_staff        <dbl> 1956088, NA, NA, NA, 173805, 0, 85257, NA, NA, 88275~
      $ rcvd_tot_domestic <dbl> 284773, NA, NA, NA, 2856381, 2532872, 3119098, NA, N~
      $ rcvd_tot_gf       <dbl> 6573762, NA, NA, NA, 2416285, 0, 1474278, NA, NA, 35~
      $ rcvd_tot_grnt     <dbl> 4826365, NA, NA, NA, 120054, 0, NA, NA, NA, NA, NA, ~
      $ rcvd_tot_sources  <dbl> 14984900, NA, NA, NA, 5392720, 2532872, 4593376, NA,~
      $ rcvd_tot_usaid    <dbl> 3300000, NA, NA, NA, 0, 0, NA, NA, NA, NA, NA, 13500~
      
      --------------------------------------------------------------------------------
      
      Table: `gf_procurement`
      Primary key: (`year`, `country_code`)
      
      Rows: 39
      Columns: 3
      $ country_code      <chr> "ALB", "BDI", "BFA", "BLR", "BLZ", "BTN", "COG", "ER~
      $ year              <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019~
      $ total_numb_device <dbl> 2002, 9300, 310000, 3360, 850, 2552, 3450, 17693, 18~
      
      --------------------------------------------------------------------------------
      
      Table: `country`
      Primary key: (`year`, `country_code`)
      11 outgoing foreign key(s):
        (`year`, `country_code`) -> (`wb_tot_pop$year`, `wb_tot_pop$country_code`) no_...
        (`year`, `country_code`) -> (`wb_urb_pop$year`, `wb_urb_pop$country_code`) no_...
        (`year`, `country_code`) -> (`wb_density_pop$year`, `wb_density_pop$country_co...
        (`year`, `country_code`) -> (`wb_gdp$year`, `wb_gdp$country_code`) no_action
        (`year`, `country_code`) -> (`who_notifications$year`, `who_notifications$coun...
        (`year`, `country_code`) -> (`who_estimates$year`, `who_estimates$country_code...
        (`year`, `country_code`) -> (`who_budget$year`, `who_budget$country_code`) no_...
        (`year`, `country_code`) -> (`who_community$year`, `who_community$country_code...
        (`year`, `country_code`) -> (`who_sites$year`, `who_sites$country_code`) no_ac...
        (`year`, `country_code`) -> (`who_expenditures$year`, `who_expenditures$countr...
        (`year`, `country_code`) -> (`gf_procurement$year`, `gf_procurement$country_co...
      
      Rows: 190
      Columns: 4
      $ country_code <chr> "AGO", "BGD", "BRA", "CAF", "CHN", "COD", "COG", "ETH", "~
      $ country      <chr> "Angola", "Bangladesh", "Brazil", "Central African Republ~
      $ year         <int> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ is_hbc       <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ~
      
      --------------------------------------------------------------------------------

---

    Code
      dm::dm_examine_constraints(dm)
    Message
      ! Unsatisfied constraints:
    Output
      * Table `country`: foreign key `year`, `country_code` into table `who_community`: values of `country$year`, `country$country_code` not in `who_community$year`, `who_community$country_code`: 2019, ALB (1), 2019, AND (1), 2019, ARE (1), 2019, ARG (1), 2019, ARM (1), ...
      * Table `country`: foreign key `year`, `country_code` into table `gf_procurement`: values of `country$year`, `country$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2019, AFG (1), 2019, AGO (1), 2019, AND (1), 2019, ARE (1), 2019, ARG (1), ...

---

    Code
      writeLines(dplyr::pull(dplyr::filter(tibble::as_tibble(dm::dm_examine_constraints(
        dm)), problem != ""), problem))
    Output
      values of `country$year`, `country$country_code` not in `who_community$year`, `who_community$country_code`: 2019, ALB (1), 2019, AND (1), 2019, ARE (1), 2019, ARG (1), 2019, ARM (1), ...
      values of `country$year`, `country$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2019, AFG (1), 2019, AGO (1), 2019, AND (1), 2019, ARE (1), 2019, ARG (1), ...

# build_dm() works and returns a time series

    Code
      dm::glimpse(dm)
    Output
      dm of 12 tables: `wb_tot_pop`, `wb_urb_pop`, `wb_density_pop`, `wb_gdp`, `who_no...
      
      --------------------------------------------------------------------------------
      
      Table: `wb_tot_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,520
      Columns: 3
      $ country_code <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "~
      $ year         <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2022, 202~
      $ pop_total    <dbl> 41128771, 40099462, 38972230, 37769499, 36686784, 3564341~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_urb_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,520
      Columns: 3
      $ country_code   <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG",~
      $ year           <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2022, 2~
      $ pop_urban_perc <dbl> 26.616, 26.314, 26.026, 25.754, 25.495, 25.250, 25.020,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_density_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,520
      Columns: 3
      $ country_code <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "~
      $ year         <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2022, 202~
      $ pop_density  <dbl> NA, 61.48055, 59.75228, 57.90825, 56.24823, 54.64854, 53.~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_gdp`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,520
      Columns: 3
      $ country_code <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "~
      $ year         <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2022, 202~
      $ gdp          <dbl> NA, 14583135237, 20143451706, 18904502222, 18418860354, 1~
      
      --------------------------------------------------------------------------------
      
      Table: `who_notifications`
      Primary key: (`year`, `country_code`)
      
      Rows: 8,067
      Columns: 8
      $ country_code    <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG"~
      $ year            <dbl> 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, ~
      $ conf_rrmdr_tx   <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA~
      $ conf_xdr_tx     <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA~
      $ new_clindx      <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA~
      $ ret_rel_labconf <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA~
      $ c_newinc        <dbl> 71685, 71554, 41752, 52502, 18784, 10742, 14351, 18091~
      $ new_labconf     <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA~
      
      --------------------------------------------------------------------------------
      
      Table: `who_estimates`
      Primary key: (`year`, `country_code`)
      
      Rows: 4,157
      Columns: 8
      $ country_code  <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", ~
      $ year          <dbl> 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 20~
      $ c_cdr         <dbl> 19, 27, 35, 32, 41, 47, 53, 59, 57, 50, 53, 51, 50, 51, ~
      $ c_newinc_100k <dbl> 36, 51, 66, 61, 78, 89, 100, 111, 107, 95, 99, 96, 94, 9~
      $ e_inc_100k    <dbl> 190, 189, 189, 189, 189, 189, 189, 189, 189, 189, 189, 1~
      $ e_inc_num     <dbl> 37000, 37000, 40000, 43000, 44000, 46000, 48000, 49000, ~
      $ e_mort_100k   <dbl> 68.00, 63.00, 57.00, 58.00, 52.00, 47.00, 43.00, 39.00, ~
      $ e_pop_num     <dbl> 19542982, 19688632, 21000256, 22645130, 23553551, 244111~
      
      --------------------------------------------------------------------------------
      
      Table: `who_budget`
      Primary key: (`year`, `country_code`)
      
      Rows: 950
      Columns: 12
      $ country_code    <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "ALB", "ALB", "ALB"~
      $ year            <dbl> 2018, 2019, 2020, 2021, 2022, 2018, 2019, 2020, 2021, ~
      $ budget_lab      <dbl> 2543262, 2797414, 3200000, 1696418, 515246, NA, NA, NA~
      $ budget_oth      <dbl> NA, 5344361, 4000000, 3606831, 3529753, NA, NA, NA, NA~
      $ budget_staff    <dbl> 761828, 915527, 2300000, 570776, 729629, NA, NA, NA, N~
      $ cf_lab          <dbl> 2473391, 2208668, 3188713, 1696418, 715071, NA, NA, NA~
      $ cf_staff        <dbl> 741545, 871931, 2248593, 570776, 672737, NA, NA, NA, N~
      $ cf_tot_domestic <dbl> 533779, 511854, 1171864, NA, 269339, NA, NA, NA, NA, N~
      $ cf_tot_gf       <dbl> 3178499, 6533095, 6935551, 7638546, 6876137, NA, NA, N~
      $ cf_tot_grnt     <dbl> 2523675, 3608394, 6871009, 2995053, 1898528, NA, NA, N~
      $ cf_tot_sources  <dbl> 10698483, 13419792, 17978424, 10633599, 10599950, NA, ~
      $ cf_tot_usaid    <dbl> 4462530, 2766449, 3000000, NA, 1555946, NA, NA, NA, NA~
      
      --------------------------------------------------------------------------------
      
      Table: `who_community`
      Primary key: (`year`, `country_code`)
      
      Rows: 814
      Columns: 9
      $ country_code           <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG"~
      $ year                   <dbl> 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020,~
      $ bmu                    <dbl> NA, 722, 708, 778, 817, 887, 873, 857, 852, 28,~
      $ bmu_community_impl     <dbl> NA, NA, 539, 778, 817, 887, 719, 857, 718, 28, ~
      $ bmu_ref_data           <dbl> NA, 661, 539, 778, 817, 887, 719, 857, 718, NA,~
      $ bmu_rxsupport_data     <dbl> 661, 506, 750, 778, 778, 719, NA, 718, NA, NA, ~
      $ bmu_rxsupport_data_coh <dbl> NA, 811, 37001, 43046, 46640, 5869, 873, 4981, ~
      $ notified_ref           <dbl> NA, 15946, 35878, 19710, 47406, 48421, 7248, 46~
      $ notified_ref_community <dbl> NA, 1088, 1146, 1857, 5214, 7021, 3052, 7529, 5~
      
      --------------------------------------------------------------------------------
      
      Table: `who_sites`
      Primary key: (`year`, `country_code`)
      
      Rows: 2,468
      Columns: 11
      $ country_code          <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG",~
      $ year                  <dbl> 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, ~
      $ culture               <dbl> NA, NA, NA, NA, NA, NA, 4, 5, 4, 4, 4, 4, 3, NA,~
      $ lab_cul               <dbl> NA, 1, 3, 2, 3, 3, NA, NA, NA, NA, NA, NA, NA, N~
      $ lab_sm                <dbl> 596, 600, 600, 603, 667, 720, NA, NA, NA, NA, NA~
      $ smear                 <dbl> NA, NA, NA, NA, NA, NA, 708, 778, 817, 887, 873,~
      $ lab_xpert             <dbl> NA, NA, NA, 1, 1, 1, NA, NA, NA, NA, NA, NA, NA,~
      $ xpert                 <dbl> NA, NA, NA, NA, NA, NA, 1, 6, 20, 42, 47, NA, NA~
      $ m_wrd                 <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 76, ~
      $ m_wrd_tests_performed <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ m_wrd_tests_positive  <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      
      --------------------------------------------------------------------------------
      
      Table: `who_expenditures`
      Primary key: (`year`, `country_code`)
      
      Rows: 950
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
      
      Table: `gf_procurement`
      Primary key: (`year`, `country_code`)
      
      Rows: 194
      Columns: 3
      $ country_code      <chr> "AFG", "AFG", "AGO", "AGO", "AGO", "ALB", "ARM", "AR~
      $ year              <dbl> 2020, 2021, 2020, 2021, 2022, 2019, 2020, 2023, 2021~
      $ total_numb_device <dbl> 55000, 90800, 30000, 43890, 11000, 2002, 300, 4500, ~
      
      --------------------------------------------------------------------------------
      
      Table: `country`
      Primary key: (`year`, `country_code`)
      11 outgoing foreign key(s):
        (`year`, `country_code`) -> (`wb_tot_pop$year`, `wb_tot_pop$country_code`) no_...
        (`year`, `country_code`) -> (`wb_urb_pop$year`, `wb_urb_pop$country_code`) no_...
        (`year`, `country_code`) -> (`wb_density_pop$year`, `wb_density_pop$country_co...
        (`year`, `country_code`) -> (`wb_gdp$year`, `wb_gdp$country_code`) no_action
        (`year`, `country_code`) -> (`who_notifications$year`, `who_notifications$coun...
        (`year`, `country_code`) -> (`who_estimates$year`, `who_estimates$country_code...
        (`year`, `country_code`) -> (`who_budget$year`, `who_budget$country_code`) no_...
        (`year`, `country_code`) -> (`who_community$year`, `who_community$country_code...
        (`year`, `country_code`) -> (`who_sites$year`, `who_sites$country_code`) no_ac...
        (`year`, `country_code`) -> (`who_expenditures$year`, `who_expenditures$countr...
        (`year`, `country_code`) -> (`gf_procurement$year`, `gf_procurement$country_co...
      
      Rows: 1,140
      Columns: 4
      $ country_code <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "BGD", "BGD", "~
      $ country      <chr> "Angola", "Angola", "Angola", "Angola", "Angola", "Angola~
      $ year         <int> 2016, 2017, 2018, 2019, 2020, 2021, 2016, 2017, 2018, 201~
      $ is_hbc       <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ~
      
      --------------------------------------------------------------------------------

---

    Code
      dm::dm_examine_constraints(dm)
    Message
      ! Unsatisfied constraints:
    Output
      * Table `country`: foreign key `year`, `country_code` into table `who_budget`: values of `country$year`, `country$country_code` not in `who_budget$year`, `who_budget$country_code`: 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), 2016, ARE (1), ...
      * Table `country`: foreign key `year`, `country_code` into table `who_community`: values of `country$year`, `country$country_code` not in `who_community$year`, `who_community$country_code`: 2016, AND (1), 2016, ARE (1), 2016, ARG (1), 2016, AUS (1), 2016, AUT (1), ...
      * Table `country`: foreign key `year`, `country_code` into table `who_expenditures`: values of `country$year`, `country$country_code` not in `who_expenditures$year`, `who_expenditures$country_code`: 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), 2016, ARE (1), ...
      * Table `country`: foreign key `year`, `country_code` into table `gf_procurement`: values of `country$year`, `country$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), 2016, ARE (1), ...

---

    Code
      writeLines(dplyr::pull(dplyr::filter(tibble::as_tibble(dm::dm_examine_constraints(
        dm)), problem != ""), problem))
    Output
      values of `country$year`, `country$country_code` not in `who_budget$year`, `who_budget$country_code`: 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), 2016, ARE (1), ...
      values of `country$year`, `country$country_code` not in `who_community$year`, `who_community$country_code`: 2016, AND (1), 2016, ARE (1), 2016, ARG (1), 2016, AUS (1), 2016, AUT (1), ...
      values of `country$year`, `country$country_code` not in `who_expenditures$year`, `who_expenditures$country_code`: 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), 2016, ARE (1), ...
      values of `country$year`, `country$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2016, AFG (1), 2016, AGO (1), 2016, ALB (1), 2016, AND (1), 2016, ARE (1), ...

