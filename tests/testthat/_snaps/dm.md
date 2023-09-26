# build_dm()

    Code
      dm::glimpse(dm)
    Output
      dm of 12 tables: `wb_tot_pop`, `wb_urb_pop`, `wb_density_pop`, `wb_gdp`, `who_no...
      
      --------------------------------------------------------------------------------
      
      Table: `wb_tot_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 108
      Columns: 3
      $ country_code <chr> "AGO", "ARG", "ARM", "AZE", "BGD", "BLR", "BEL", "BLZ", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ pop_total    <dbl> 32353588, 44938712, 2820602, 10024283, 165516222, 9419758~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_urb_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 108
      Columns: 3
      $ country_code   <chr> "AGO", "ARG", "ARM", "AZE", "BGD", "BLR", "BEL", "BLZ",~
      $ year           <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2~
      $ pop_urban_perc <dbl> 66.177, 91.991, 63.219, 56.031, 37.405, 79.044, 98.041,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_density_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 108
      Columns: 3
      $ country_code <chr> "AGO", "ARG", "ARM", "AZE", "BGD", "BLR", "BEL", "BLZ", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ pop_density  <dbl> 25.951382, 16.420827, 99.072778, 121.280071, 1271.538926,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_gdp`
      Primary key: (`year`, `country_code`)
      
      Rows: 108
      Columns: 3
      $ country_code <chr> "AGO", "ARG", "ARM", "AZE", "BGD", "BLR", "BEL", "BLZ", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ gdp          <dbl> 6.930911e+10, 4.477547e+11, 1.361929e+10, 4.817424e+10, 3~
      
      --------------------------------------------------------------------------------
      
      Table: `who_notifications`
      Primary key: (`year`, `country_code`)
      
      Rows: 108
      Columns: 4
      $ country_code <chr> "AGO", "ARG", "ARM", "AZE", "BGD", "BLR", "BEL", "BLZ", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ c_newinc     <dbl> 74105, 11446, 621, 4823, 291595, 2207, 895, 91, 4266, 100~
      $ new_labconf  <dbl> 34887, 7226, 239, 1911, 162195, 1490, 564, 63, 3335, 478,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_estimates`
      Primary key: (`year`, `country_code`)
      
      Rows: 108
      Columns: 8
      $ country_code  <chr> "AGO", "ARG", "ARM", "AZE", "BGD", "BLR", "BEL", "BLZ", ~
      $ year          <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 20~
      $ c_cdr         <dbl> 65, 87, 84, 79, 80, 78, 87, 87, 63, 80, 60, 64, 49, 89, ~
      $ c_newinc_100k <dbl> 229.0, 26.0, 22.0, 47.0, 176.0, 23.0, 7.8, 23.0, 35.0, 1~
      $ e_inc_100k    <dbl> 351.0, 29.0, 26.0, 60.0, 221.0, 29.0, 8.9, 27.0, 55.0, 1~
      $ e_inc_num     <dbl> 114000, 13000, 740, 6100, 366000, 2800, 1000, 100, 6800,~
      $ e_mort_100k   <dbl> 62.00, 1.80, 1.60, 6.10, 24.00, 3.20, 0.34, 2.70, 11.00,~
      $ e_pop_num     <dbl> 32353588, 44745520, 2820602, 10232753, 165516222, 967397~
      
      --------------------------------------------------------------------------------
      
      Table: `who_budget`
      Primary key: (`year`, `country_code`)
      
      Rows: 108
      Columns: 12
      $ country_code    <chr> "AGO", "ARG", "ARM", "AZE", "BGD", "BLR", "BEL", "BLZ"~
      $ year            <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, ~
      $ budget_lab      <dbl> 17133500, 263032, 164346, 896894, 32123255, 1901223, N~
      $ budget_oth      <dbl> 4000000, 0, 162174, 107963, 1807810, 609012, NA, NA, 0~
      $ budget_staff    <dbl> 1572700, 0, 73866, 10320365, 20323571, 54665, NA, 1827~
      $ cf_lab          <dbl> 7216284, 263032, 164346, 896894, 12753612, 1901223, NA~
      $ cf_staff        <dbl> 1572700, 0, 73866, 10320365, 21387575, 54665, NA, 1827~
      $ cf_tot_domestic <dbl> 13692478, 2510552, 74089, 16487435, 18153743, 4253882,~
      $ cf_tot_gf       <dbl> 2416285, 0, 1130669, 4397794, 36966056, 4148972, NA, 1~
      $ cf_tot_grnt     <dbl> 4000000, 0, 0, NA, 0, 1239941, NA, 0, 33439, 14757, 0,~
      $ cf_tot_sources  <dbl> 20108763, 2510552, 1204758, 20885229, 68101153, 964279~
      $ cf_tot_usaid    <dbl> 0, 0, 0, NA, 12981354, 0, NA, 0, 0, 0, 0, 0, 300000, 0~
      
      --------------------------------------------------------------------------------
      
      Table: `who_community`
      Primary key: (`year`, `country_code`)
      
      Rows: 57
      Columns: 9
      $ country_code           <chr> "AGO", "AZE", "BGD", "BLR", "BEN", "BTN", "BIH"~
      $ year                   <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019,~
      $ bmu                    <dbl> 340, 68, 857, 8, 82, 32, 79, 27, 30, 170, 100, ~
      $ bmu_community_impl     <dbl> 9, 0, 481, 8, 82, 0, NA, 27, 23, 170, 46, 20, 1~
      $ bmu_ref_data           <dbl> 9, NA, 481, NA, NA, NA, NA, 0, 23, 170, 46, 20,~
      $ bmu_rxsupport_data     <dbl> NA, NA, 481, NA, NA, NA, NA, NA, 23, 18, NA, 6,~
      $ bmu_rxsupport_data_coh <dbl> NA, NA, 242334, NA, NA, NA, NA, NA, 1344, 6828,~
      $ notified_ref           <dbl> 5630, NA, 242334, NA, NA, NA, NA, 0, 1288, 6753~
      $ notified_ref_community <dbl> 2742, NA, 138110, NA, NA, NA, NA, 0, 1288, 419,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_sites`
      Primary key: (`year`, `country_code`)
      
      Rows: 108
      Columns: 11
      $ country_code          <chr> "AGO", "ARG", "ARM", "AZE", "BGD", "BLR", "BEL",~
      $ year                  <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, ~
      $ culture               <dbl> 0, 148, 1, 7, 5, 16, 101, 0, 1, 1, 83, 12, 1, 30~
      $ lab_cul               <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ lab_sm                <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ smear                 <dbl> 167, 729, 25, 55, 1136, 116, 101, 6, 82, 40, 660~
      $ lab_xpert             <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ xpert                 <dbl> 22, 12, 13, 11, 200, 26, 27, 2, 29, 8, 14, 1, 36~
      $ m_wrd                 <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ m_wrd_tests_performed <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ m_wrd_tests_positive  <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      
      --------------------------------------------------------------------------------
      
      Table: `who_expenditures`
      Primary key: (`year`, `country_code`)
      
      Rows: 108
      Columns: 9
      $ country_code      <chr> "AGO", "ARG", "ARM", "AZE", "BGD", "BLR", "BEL", "BL~
      $ year              <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019~
      $ rcvd_lab          <dbl> 784599, 0, 171472, 642024, 9242380, 692040, NA, 5390~
      $ rcvd_staff        <dbl> 173805, 0, 85257, 8827541, 16468442, 25905469, NA, 1~
      $ rcvd_tot_domestic <dbl> 2856381, 2532872, 3119098, 16519343, 13308192, 65606~
      $ rcvd_tot_gf       <dbl> 2416285, 0, 1474278, 3522493, 36183130, 2104056, NA,~
      $ rcvd_tot_grnt     <dbl> 120054, 0, NA, NA, 0, 840357, NA, 0, 10793, 0, 0, NA~
      $ rcvd_tot_sources  <dbl> 5392720, 2532872, 4593376, 20041836, 62991322, 68550~
      $ rcvd_tot_usaid    <dbl> 0, 0, NA, NA, 13500000, 0, NA, 0, 0, 0, 0, NA, 30000~
      
      --------------------------------------------------------------------------------
      
      Table: `gf_procurement`
      Primary key: (`year`, `country_code`)
      
      Rows: 21
      Columns: 3
      $ country_code      <chr> "BDI", "BLR", "BLZ", "BTN", "COG", "GTM", "IND", "IR~
      $ year              <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019~
      $ total_numb_device <dbl> 9300, 3360, 850, 2552, 3450, 1, 1213800, 1000, 10694~
      
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
      
      Rows: 108
      Columns: 4
      $ country_code <chr> "AGO", "BGD", "COD", "IND", "MOZ", "MMR", "NGA", "PHL", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ country      <chr> "Angola", "Bangladesh", "Congo - Kinshasa", "India", "Moz~
      $ is_hbc       <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, ~
      
      --------------------------------------------------------------------------------

---

    Code
      dm::dm_examine_constraints(dm)
    Message <cliMessage>
      ! Unsatisfied constraints:
    Output
      * Table `country`: foreign key `year`, `country_code` into table `who_community`: values of `country$year`, `country$country_code` not in `who_community$year`, `who_community$country_code`: 2019, ARG (1), 2019, ARM (1), 2019, BEL (1), 2019, BLZ (1), 2019, BOL (1), ...
      * Table `country`: foreign key `year`, `country_code` into table `gf_procurement`: values of `country$year`, `country$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2019, AGO (1), 2019, ARG (1), 2019, ARM (1), 2019, AZE (1), 2019, BEL (1), ...

---

    Code
      writeLines(dplyr::pull(dplyr::filter(tibble::as_tibble(dm::dm_examine_constraints(
        dm)), problem != ""), problem))
    Output
      values of `country$year`, `country$country_code` not in `who_community$year`, `who_community$country_code`: 2019, ARG (1), 2019, ARM (1), 2019, BEL (1), 2019, BLZ (1), 2019, BOL (1), ...
      values of `country$year`, `country$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2019, AGO (1), 2019, ARG (1), 2019, ARM (1), 2019, AZE (1), 2019, BEL (1), ...

# build_dm() works and returns a time series

    Code
      dm::glimpse(dm)
    Output
      dm of 12 tables: `wb_tot_pop`, `wb_urb_pop`, `wb_density_pop`, `wb_gdp`, `who_no...
      
      --------------------------------------------------------------------------------
      
      Table: `wb_tot_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 864
      Columns: 3
      $ country_code <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "~
      $ year         <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2022, 202~
      $ pop_total    <dbl> 35588987, 34503774, 33428486, 32353588, 31273533, 3020862~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_urb_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 864
      Columns: 3
      $ country_code   <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO",~
      $ year           <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2022, 2~
      $ pop_urban_perc <dbl> 68.081, 67.460, 66.825, 66.177, 65.514, 64.839, 64.149,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_density_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 864
      Columns: 3
      $ country_code <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "~
      $ year         <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2022, 202~
      $ pop_density  <dbl> NA, NA, 26.81358, 25.95138, 25.08505, 24.23087, 23.38553,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_gdp`
      Primary key: (`year`, `country_code`)
      
      Rows: 864
      Columns: 3
      $ country_code <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "~
      $ year         <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2022, 202~
      $ gdp          <dbl> 106713618735, 65685435100, 50241368244, 69309110146, 7779~
      
      --------------------------------------------------------------------------------
      
      Table: `who_notifications`
      Primary key: (`year`, `country_code`)
      
      Rows: 4,536
      Columns: 4
      $ country_code <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "~
      $ year         <dbl> 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 198~
      $ c_newinc     <dbl> 10117, 7501, 7911, 6625, 10153, 8653, 9363, 8510, 8184, 9~
      $ new_labconf  <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N~
      
      --------------------------------------------------------------------------------
      
      Table: `who_estimates`
      Primary key: (`year`, `country_code`)
      
      Rows: 2,376
      Columns: 8
      $ country_code  <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", ~
      $ year          <dbl> 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 20~
      $ c_cdr         <dbl> 33, 42, 53, 60, 54, 52, 66, 52, 54, 48, 50, 51, 54, 60, ~
      $ c_newinc_100k <dbl> 98, 128, 171, 199, 189, 191, 250, 197, 205, 183, 191, 19~
      $ e_inc_100k    <dbl> 297, 308, 320, 334, 350, 368, 377, 379, 382, 385, 384, 3~
      $ e_inc_num     <dbl> 49000, 52000, 56000, 61000, 66000, 72000, 76000, 79000, ~
      $ e_mort_100k   <dbl> 87.0, 91.0, 78.0, 73.0, 86.0, 95.0, 74.0, 91.0, 99.0, 99~
      $ e_pop_num     <dbl> 16394062, 16941587, 17516139, 18124342, 18771125, 194509~
      
      --------------------------------------------------------------------------------
      
      Table: `who_budget`
      Primary key: (`year`, `country_code`)
      
      Rows: 540
      Columns: 12
      $ country_code    <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "ARG", "ARG", "ARG"~
      $ year            <dbl> 2018, 2019, 2020, 2021, 2022, 2018, 2019, 2020, 2021, ~
      $ budget_lab      <dbl> 1526820, 17133500, 742078, 16412210, 16412210, 263032,~
      $ budget_oth      <dbl> 4000000, 4000000, NA, 0, 0, 0, 0, 0, 0, NA, 2378816, 1~
      $ budget_staff    <dbl> 1572700, 1572700, 173805, 173805, 2582160, 0, 0, 0, 0,~
      $ cf_lab          <dbl> 500000, 7216284, 742078, 2100360, 2500360, 263032, 263~
      $ cf_staff        <dbl> 1572700, 1572700, 173805, 173805, 2081059, 0, 0, 0, 0,~
      $ cf_tot_domestic <dbl> 3293147, 13692478, 17672192, 6041429, 10831930, 518923~
      $ cf_tot_gf       <dbl> 4972863, 2416285, 1897542, 4213441, 4213441, 0, 0, 0, ~
      $ cf_tot_grnt     <dbl> 689553, 4000000, 737293, NA, NA, 0, 0, 0, 0, NA, 0, 0,~
      $ cf_tot_sources  <dbl> 8955563, 20108763, 20307027, 10254870, 15045371, 51892~
      $ cf_tot_usaid    <dbl> 0, 0, 0, NA, NA, 0, 0, 0, 0, NA, 0, 0, NA, NA, NA, NA,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_community`
      Primary key: (`year`, `country_code`)
      
      Rows: 454
      Columns: 9
      $ country_code           <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO"~
      $ year                   <dbl> 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021,~
      $ bmu                    <dbl> 193, 283, 302, 302, 333, 340, 157, 155, NA, 66,~
      $ bmu_community_impl     <dbl> NA, NA, 280, 0, 9, 9, 0, 26, NA, NA, 0, 0, 0, N~
      $ bmu_ref_data           <dbl> NA, NA, NA, NA, 9, 9, NA, 22, NA, 66, NA, NA, N~
      $ bmu_rxsupport_data     <dbl> NA, NA, NA, 0, 9, NA, 6, NA, 66, NA, NA, NA, NA~
      $ bmu_rxsupport_data_coh <dbl> NA, NA, NA, 0, 2730, NA, 168, NA, NA, NA, NA, N~
      $ notified_ref           <dbl> NA, NA, NA, NA, 5276, 5630, NA, 23138, NA, 1342~
      $ notified_ref_community <dbl> NA, NA, NA, NA, 5276, 2742, NA, 1000, NA, 0, NA~
      
      --------------------------------------------------------------------------------
      
      Table: `who_sites`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,404
      Columns: 11
      $ country_code          <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO",~
      $ year                  <dbl> 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, ~
      $ culture               <dbl> NA, NA, NA, NA, NA, NA, 3, 3, 3, 0, 0, 4, 1, NA,~
      $ lab_cul               <dbl> 1, 1, 3, 2, 2, 2, NA, NA, NA, NA, NA, NA, NA, 11~
      $ lab_sm                <dbl> 148, 146, 143, 131, 95, 90, NA, NA, NA, NA, NA, ~
      $ smear                 <dbl> NA, NA, NA, NA, NA, NA, 136, 155, 302, 177, 167,~
      $ lab_xpert             <dbl> NA, NA, 0, NA, 0, 1, NA, NA, NA, NA, NA, NA, NA,~
      $ xpert                 <dbl> NA, NA, NA, NA, NA, NA, 1, 15, 15, 22, 22, NA, N~
      $ m_wrd                 <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 53, ~
      $ m_wrd_tests_performed <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ m_wrd_tests_positive  <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      
      --------------------------------------------------------------------------------
      
      Table: `who_expenditures`
      Primary key: (`year`, `country_code`)
      
      Rows: 540
      Columns: 9
      $ country_code      <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "ARG", "ARG", "AR~
      $ year              <dbl> 2017, 2018, 2019, 2020, 2021, 2017, 2018, 2019, 2020~
      $ rcvd_lab          <dbl> 550000, 550000, 784599, 0, 213166, 0, 0, 0, 272888, ~
      $ rcvd_staff        <dbl> 990000, 990000, 173805, 173805, 173805, 0, 0, 0, 0, ~
      $ rcvd_tot_domestic <dbl> 27985663, 25830058, 2856381, 5373932, 5587098, 32761~
      $ rcvd_tot_gf       <dbl> 4972863, 3758779, 2416285, 1897542, 1897542, 0, 0, 0~
      $ rcvd_tot_grnt     <dbl> 0, 8672452, 120054, 153754, 153754, 0, 0, 0, 0, NA, ~
      $ rcvd_tot_sources  <dbl> 32958526, 38261289, 5392720, 7425228, 7638394, 32761~
      $ rcvd_tot_usaid    <dbl> 0, NA, 0, 0, 0, 0, 0, 0, 0, NA, 0, 0, NA, NA, NA, NA~
      
      --------------------------------------------------------------------------------
      
      Table: `gf_procurement`
      Primary key: (`year`, `country_code`)
      
      Rows: 113
      Columns: 3
      $ country_code      <chr> "AGO", "AGO", "AGO", "ARM", "ARM", "AZE", "AZE", "BD~
      $ year              <dbl> 2020, 2021, 2022, 2020, 2023, 2021, 2022, 2019, 2021~
      $ total_numb_device <dbl> 30000, 43890, 11000, 300, 4500, 16500, 9806, 9300, 2~
      
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
      
      Rows: 648
      Columns: 4
      $ country_code <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "BGD", "BGD", "BGD", "~
      $ year         <dbl> 2016, 2017, 2018, 2019, 2020, 2016, 2017, 2018, 2019, 202~
      $ country      <chr> "Angola", "Angola", "Angola", "Angola", "Angola", "Bangla~
      $ is_hbc       <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ~
      
      --------------------------------------------------------------------------------

---

    Code
      dm::dm_examine_constraints(dm)
    Message <cliMessage>
      ! Unsatisfied constraints:
    Output
      * Table `country`: foreign key `year`, `country_code` into table `who_budget`: values of `country$year`, `country$country_code` not in `who_budget$year`, `who_budget$country_code`: 2016, AGO (1), 2016, ARG (1), 2016, ARM (1), 2016, AZE (1), 2016, BDI (1), ...
      * Table `country`: foreign key `year`, `country_code` into table `who_community`: values of `country$year`, `country$country_code` not in `who_community$year`, `who_community$country_code`: 2016, ARG (1), 2016, BEL (1), 2016, BLZ (1), 2016, CAN (1), 2016, CHE (1), ...
      * Table `country`: foreign key `year`, `country_code` into table `who_expenditures`: values of `country$year`, `country$country_code` not in `who_expenditures$year`, `who_expenditures$country_code`: 2016, AGO (1), 2016, ARG (1), 2016, ARM (1), 2016, AZE (1), 2016, BDI (1), ...
      * Table `country`: foreign key `year`, `country_code` into table `gf_procurement`: values of `country$year`, `country$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2016, AGO (1), 2016, ARG (1), 2016, ARM (1), 2016, AZE (1), 2016, BDI (1), ...

---

    Code
      writeLines(dplyr::pull(dplyr::filter(tibble::as_tibble(dm::dm_examine_constraints(
        dm)), problem != ""), problem))
    Output
      values of `country$year`, `country$country_code` not in `who_budget$year`, `who_budget$country_code`: 2016, AGO (1), 2016, ARG (1), 2016, ARM (1), 2016, AZE (1), 2016, BDI (1), ...
      values of `country$year`, `country$country_code` not in `who_community$year`, `who_community$country_code`: 2016, ARG (1), 2016, BEL (1), 2016, BLZ (1), 2016, CAN (1), 2016, CHE (1), ...
      values of `country$year`, `country$country_code` not in `who_expenditures$year`, `who_expenditures$country_code`: 2016, AGO (1), 2016, ARG (1), 2016, ARM (1), 2016, AZE (1), 2016, BDI (1), ...
      values of `country$year`, `country$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2016, AGO (1), 2016, ARG (1), 2016, ARM (1), 2016, AZE (1), 2016, BDI (1), ...

