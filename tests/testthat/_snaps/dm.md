# build_dm() `hbc` works

    Code
      dm::glimpse(dm)
    Output
      dm of 12 tables: `hbc`, `wb_tot_pop`, `wb_urb_pop`, `wb_density_pop`, `wb_gdp`, ...
      
      --------------------------------------------------------------------------------
      
      Table: `hbc`
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
      
      Rows: 30
      Columns: 2
      $ country_code <chr> "AGO", "BGD", "BRA", "CHN", "PRK", "COD", "ETH", "IND", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_tot_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 30
      Columns: 3
      $ country_code <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COD", "COG", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ pop_total    <dbl> 32353588, 165516222, 211782878, 16207746, 5209324, 140774~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_urb_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 30
      Columns: 3
      $ country_code   <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COD", "COG",~
      $ year           <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2~
      $ pop_urban_perc <dbl> 66.177, 37.405, 86.824, 23.805, 41.770, 60.308, 45.046,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_density_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 30
      Columns: 3
      $ country_code <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COD", "COG", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ pop_density  <dbl> 25.951382, 1271.538926, 25.338518, 91.818185, 8.361944, 1~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_gdp`
      Primary key: (`year`, `country_code`)
      
      Rows: 30
      Columns: 3
      $ country_code <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COD", "COG", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ gdp          <dbl> 6.930911e+10, 3.512384e+11, 1.873288e+12, 2.708939e+10, 2~
      
      --------------------------------------------------------------------------------
      
      Table: `who_notifications`
      Primary key: (`year`, `country_code`)
      
      Rows: 30
      Columns: 4
      $ country_code <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COG", "PRK", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ c_newinc     <dbl> 74105, 291595, 85523, 29906, 12046, 728265, 11802, 95722,~
      $ new_labconf  <dbl> 34887, 162195, 50073, 10045, 6483, 295225, 4160, 30496, 1~
      
      --------------------------------------------------------------------------------
      
      Table: `who_estimates`
      Primary key: (`year`, `country_code`)
      
      Rows: 30
      Columns: 8
      $ country_code  <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COG", "PRK", ~
      $ year          <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 20~
      $ c_cdr         <dbl> 65, 80, 89, 64, 43, 88, 57, 72, 62, 70, 73, 67, 62, 49, ~
      $ c_newinc_100k <dbl> 229, 176, 40, 185, 231, 51, 212, 372, 199, 97, 156, 208,~
      $ e_inc_100k    <dbl> 351, 221, 46, 287, 540, 58, 373, 513, 320, 140, 214, 312~
      $ e_inc_num     <dbl> 114000, 366000, 96000, 47000, 28000, 826000, 21000, 1320~
      $ e_mort_100k   <dbl> 62.0, 24.0, 3.3, 20.0, 158.0, 2.3, 92.0, NA, 60.0, 22.0,~
      $ e_pop_num     <dbl> 32353588, 165516222, 211782878, 16207746, 5209324, 14218~
      
      --------------------------------------------------------------------------------
      
      Table: `who_budget`
      Primary key: (`year`, `country_code`)
      
      Rows: 30
      Columns: 12
      $ country_code    <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COG", "PRK"~
      $ year            <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, ~
      $ budget_lab      <dbl> 17133500, 32123255, 7142388, 3000000, 495430, 33671641~
      $ budget_oth      <dbl> 4000000, 1807810, 117000, 2000000, 0, 0, 0, 10572573, ~
      $ budget_staff    <dbl> 1572700, 20323571, 660802, 8477562, 427639, 146348944,~
      $ cf_lab          <dbl> 7216284, 12753612, 7142388, 1420931, 495430, 33671641,~
      $ cf_staff        <dbl> 1572700, 21387575, 660802, 3343864, 427639, 146348944,~
      $ cf_tot_domestic <dbl> 13692478, 18153743, 38052385, 5184850, 772672, 6641805~
      $ cf_tot_gf       <dbl> 2416285, 36966056, NA, 5000000, 1036438, 0, 870356, 40~
      $ cf_tot_grnt     <dbl> 4000000, 0, 117000, 1230000, 80000, 6837963, 0, 273220~
      $ cf_tot_sources  <dbl> 20108763, 68101153, 38169385, 12414850, 1949110, 67101~
      $ cf_tot_usaid    <dbl> 0, 12981354, NA, 1000000, 60000, 0, 0, 0, 2242963, 114~
      
      --------------------------------------------------------------------------------
      
      Table: `who_community`
      Primary key: (`year`, `country_code`)
      
      Rows: 27
      Columns: 9
      $ country_code           <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "COG", "COD"~
      $ year                   <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019,~
      $ bmu                    <dbl> 340, 857, NA, 100, 89, 41, 517, 950, 6532, 514,~
      $ bmu_community_impl     <dbl> 9, 481, NA, 46, 25, 2, 389, 950, 6532, 211, 289~
      $ bmu_ref_data           <dbl> 9, 481, NA, 46, NA, 2, 389, 890, 1372, 211, 289~
      $ bmu_rxsupport_data     <dbl> NA, 481, NA, NA, 90, 2, 399, 950, 6093, 191, 29~
      $ bmu_rxsupport_data_coh <dbl> NA, 242334, NA, NA, 12065, 0, 50566, 108193, 22~
      $ notified_ref           <dbl> 5630, 242334, NA, 20281, NA, 11802, 150807, 107~
      $ notified_ref_community <dbl> 2742, 138110, NA, 9665, NA, 2219, 86411, 17146,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_sites`
      Primary key: (`year`, `country_code`)
      
      Rows: 30
      Columns: 11
      $ country_code          <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COG",~
      $ year                  <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, ~
      $ culture               <dbl> 0, 5, 386, 4, 1, 2382, 0, 2, 5, 10, 92, 21, 2, 1~
      $ lab_cul               <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ lab_sm                <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ smear                 <dbl> 167, 1136, 2463, 218, 85, 2951, 31, 367, 2042, 3~
      $ lab_xpert             <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ xpert                 <dbl> 22, 200, 206, 64, 4, 2210, 3, 7, 132, 280, 1545,~
      $ m_wrd                 <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ m_wrd_tests_performed <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ m_wrd_tests_positive  <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      
      --------------------------------------------------------------------------------
      
      Table: `who_expenditures`
      Primary key: (`year`, `country_code`)
      
      Rows: 30
      Columns: 9
      $ country_code      <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COG", "PR~
      $ year              <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019~
      $ rcvd_lab          <dbl> 784599, 9242380, 6774730, 1603700, 219619, 10816901,~
      $ rcvd_staff        <dbl> 173805, 16468442, 469186, 3347209, 317711, 146348944~
      $ rcvd_tot_domestic <dbl> 2856381, 13308192, 31904531, 5184850, 761742, 629915~
      $ rcvd_tot_gf       <dbl> 2416285, 36183130, 0, 4314045, 942771, NA, 5580454, ~
      $ rcvd_tot_grnt     <dbl> 120054, 0, 17000, 1700000, 60000, 5160563, 0, 640763~
      $ rcvd_tot_sources  <dbl> 5392720, 62991322, 31921531, 11798895, 1834513, 6350~
      $ rcvd_tot_usaid    <dbl> 0, 13500000, 0, 600000, 70000, NA, 0, 0, 2242963, 11~
      
      --------------------------------------------------------------------------------
      
      Table: `gf_procurement`
      Primary key: (`year`, `country_code`)
      
      Rows: 11
      Columns: 3
      $ country_code      <chr> "COG", "ETH", "IND", "KEN", "KHM", "MMR", "PAK", "PH~
      $ year              <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019~
      $ total_numb_device <dbl> 3450, 181950, 1213800, 5664, 58650, 159892, 150000, ~
      
      --------------------------------------------------------------------------------

---

    Code
      dm::dm_examine_constraints(dm)
    Message <cliMessage>
      ! Unsatisfied constraints:
    Output
      * Table `hbc`: foreign key `year`, `country_code` into table `who_community`: values of `hbc$year`, `hbc$country_code` not in `who_community$year`, `who_community$country_code`: 2019, CHN (1), 2019, PRK (1), 2019, RUS (1)
      * Table `hbc`: foreign key `year`, `country_code` into table `gf_procurement`: values of `hbc$year`, `hbc$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2019, AGO (1), 2019, BGD (1), 2019, BRA (1), 2019, CAF (1), 2019, CHN (1), ...

---

    Code
      writeLines(dplyr::pull(dplyr::filter(tibble::as_tibble(dm::dm_examine_constraints(
        dm)), problem != ""), problem))
    Output
      values of `hbc$year`, `hbc$country_code` not in `who_community$year`, `who_community$country_code`: 2019, CHN (1), 2019, PRK (1), 2019, RUS (1)
      values of `hbc$year`, `hbc$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2019, AGO (1), 2019, BGD (1), 2019, BRA (1), 2019, CAF (1), 2019, CHN (1), ...

# build_dm() `non_hbc` works

    Code
      dm::glimpse(dm)
    Output
      dm of 12 tables: `wb_tot_pop`, `wb_urb_pop`, `wb_density_pop`, `wb_gdp`, `who_no...
      
      --------------------------------------------------------------------------------
      
      Table: `wb_tot_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 185
      Columns: 3
      $ country_code <chr> "AFG", "ALB", "DZA", "ASM", "AND", "ATG", "ARG", "ARM", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ pop_total    <dbl> 37769499, 2854191, 42705368, 47321, 76343, 92117, 4493871~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_urb_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 185
      Columns: 3
      $ country_code   <chr> "AFG", "ALB", "DZA", "ASM", "AND", "ATG", "ARG", "ARM",~
      $ year           <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2~
      $ pop_urban_perc <dbl> 25.754, 61.229, 73.189, 87.147, 87.984, 24.506, 91.991,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_density_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 185
      Columns: 3
      $ country_code <chr> "AFG", "ALB", "DZA", "ASM", "AND", "ATG", "ARG", "ARM", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ pop_density  <dbl> 57.908252, 104.167555, 17.930316, 236.605000, 162.431915,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_gdp`
      Primary key: (`year`, `country_code`)
      
      Rows: 185
      Columns: 3
      $ country_code <chr> "AFG", "ALB", "DZA", "ASM", "AND", "ATG", "ARG", "ARM", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ gdp          <dbl> 1.890450e+10, 1.540183e+10, 1.717603e+11, 6.470000e+08, 3~
      
      --------------------------------------------------------------------------------
      
      Table: `who_notifications`
      Primary key: (`year`, `country_code`)
      
      Rows: 185
      Columns: 4
      $ country_code <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AIA", "ATG", "ARG", "~
      $ year         <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      $ c_newinc     <dbl> 52438, 412, 20879, 1, 5, NA, 0, 11446, 621, 2, 1502, 464,~
      $ new_labconf  <dbl> 24358, 211, 5422, 1, 4, NA, 0, 7226, 239, 1, 771, 286, 19~
      
      --------------------------------------------------------------------------------
      
      Table: `who_estimates`
      Primary key: (`year`, `country_code`)
      
      Rows: 185
      Columns: 8
      $ country_code  <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AIA", "ATG", "ARG", ~
      $ year          <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 20~
      $ c_cdr         <dbl> 74, 87, 81, 100, 87, NA, NA, 87, 84, 87, 87, 87, 79, 87,~
      $ c_newinc_100k <dbl> 139.0, 14.0, 49.0, 2.1, 6.5, NA, 0.0, 26.0, 22.0, 1.9, 5~
      $ e_inc_100k    <dbl> 189.0, 16.0, 61.0, 2.1, 7.5, 22.0, 0.0, 29.0, 26.0, 2.2,~
      $ e_inc_num     <dbl> 71000, 470, 26000, 1, 6, 3, 0, 13000, 740, 2, 1700, 530,~
      $ e_mort_100k   <dbl> 26.00, 0.35, 6.70, 0.17, 0.61, 8.50, 1.20, 1.80, 1.60, 0~
      $ e_pop_num     <dbl> 37769499, 2873883, 42705368, 47321, 76343, 15380, 92117,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_budget`
      Primary key: (`year`, `country_code`)
      
      Rows: 185
      Columns: 12
      $ country_code    <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AIA", "ATG", "ARG"~
      $ year            <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, ~
      $ budget_lab      <dbl> 2797414, NA, NA, NA, NA, NA, NA, 263032, 164346, NA, N~
      $ budget_oth      <dbl> 5344361, NA, NA, NA, NA, NA, NA, 0, 162174, NA, NA, NA~
      $ budget_staff    <dbl> 915527, NA, NA, NA, NA, NA, NA, 0, 73866, NA, NA, NA, ~
      $ cf_lab          <dbl> 2208668, NA, NA, NA, NA, NA, NA, 263032, 164346, NA, N~
      $ cf_staff        <dbl> 871931, NA, NA, NA, NA, NA, NA, 0, 73866, NA, NA, NA, ~
      $ cf_tot_domestic <dbl> 511854, NA, NA, NA, NA, NA, NA, 2510552, 74089, NA, NA~
      $ cf_tot_gf       <dbl> 6533095, NA, NA, NA, NA, NA, NA, 0, 1130669, NA, NA, N~
      $ cf_tot_grnt     <dbl> 3608394, NA, NA, NA, NA, NA, NA, 0, 0, NA, NA, NA, NA,~
      $ cf_tot_sources  <dbl> 13419792, NA, NA, NA, NA, NA, NA, 2510552, 1204758, NA~
      $ cf_tot_usaid    <dbl> 2766449, NA, NA, NA, NA, NA, NA, 0, 0, NA, NA, NA, NA,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_community`
      Primary key: (`year`, `country_code`)
      
      Rows: 72
      Columns: 9
      $ country_code           <chr> "AFG", "DZA", "AZE", "BLR", "BEN", "BTN", "BIH"~
      $ year                   <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019,~
      $ bmu                    <dbl> 873, 240, 68, 8, 82, 32, 79, 27, 30, 111, 170, ~
      $ bmu_community_impl     <dbl> 719, 0, 0, 8, 82, 0, NA, 27, 23, 96, 170, 0, 20~
      $ bmu_ref_data           <dbl> 719, NA, NA, NA, NA, NA, NA, 0, 23, 96, 170, NA~
      $ bmu_rxsupport_data     <dbl> NA, NA, NA, NA, NA, NA, NA, NA, 23, 102, 18, NA~
      $ bmu_rxsupport_data_coh <dbl> 873, NA, NA, NA, NA, NA, NA, NA, 1344, 6166, 68~
      $ notified_ref           <dbl> 7248, NA, NA, NA, NA, NA, NA, 0, 1288, 4809, 67~
      $ notified_ref_community <dbl> 3052, NA, NA, NA, NA, NA, NA, 0, 1288, 73, 419,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_sites`
      Primary key: (`year`, `country_code`)
      
      Rows: 185
      Columns: 11
      $ country_code          <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AIA", "ATG",~
      $ year                  <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, ~
      $ culture               <dbl> 4, 1, 29, NA, 7, NA, 0, 148, 1, NA, NA, NA, 7, 1~
      $ lab_cul               <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ lab_sm                <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ smear                 <dbl> 873, 12, 240, NA, 7, NA, 1, 729, 25, NA, NA, NA,~
      $ lab_xpert             <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ xpert                 <dbl> 47, 1, 4, NA, 3, NA, 1, 12, 13, NA, NA, NA, 11, ~
      $ m_wrd                 <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ m_wrd_tests_performed <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ m_wrd_tests_positive  <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      
      --------------------------------------------------------------------------------
      
      Table: `who_expenditures`
      Primary key: (`year`, `country_code`)
      
      Rows: 185
      Columns: 9
      $ country_code      <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AIA", "ATG", "AR~
      $ year              <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019~
      $ rcvd_lab          <dbl> 2165197, NA, NA, NA, NA, NA, NA, 0, 171472, NA, NA, ~
      $ rcvd_staff        <dbl> 1956088, NA, NA, NA, NA, NA, NA, 0, 85257, NA, NA, N~
      $ rcvd_tot_domestic <dbl> 284773, NA, NA, NA, NA, NA, NA, 2532872, 3119098, NA~
      $ rcvd_tot_gf       <dbl> 6573762, NA, NA, NA, NA, NA, NA, 0, 1474278, NA, NA,~
      $ rcvd_tot_grnt     <dbl> 4826365, NA, NA, NA, NA, NA, NA, 0, NA, NA, NA, NA, ~
      $ rcvd_tot_sources  <dbl> 14984900, NA, NA, NA, NA, NA, NA, 2532872, 4593376, ~
      $ rcvd_tot_usaid    <dbl> 3300000, NA, NA, NA, NA, NA, NA, 0, NA, NA, NA, NA, ~
      
      --------------------------------------------------------------------------------
      
      Table: `gf_procurement`
      Primary key: (`year`, `country_code`)
      
      Rows: 30
      Columns: 3
      $ country_code      <chr> "ALB", "BDI", "BFA", "BLR", "BLZ", "BTN", "COM", "ER~
      $ year              <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019~
      $ total_numb_device <dbl> 2002, 9300, 310000, 3360, 850, 2552, 2, 17693, 3500,~
      
      --------------------------------------------------------------------------------
      
      Table: `non_hbc`
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
      
      Rows: 191
      Columns: 2
      $ country_code <chr> "ABW", "AFG", "AIA", "ALB", "AND", "ARE", "ARG", "ARM", "~
      $ year         <int> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 201~
      
      --------------------------------------------------------------------------------

---

    Code
      writeLines(dplyr::pull(dplyr::filter(tibble::as_tibble(dm::dm_examine_constraints(
        dm)), problem != ""), problem))
    Output
      values of `non_hbc$year`, `non_hbc$country_code` not in `wb_tot_pop$year`, `wb_tot_pop$country_code`: 2019, AIA (1), 2019, COK (1), 2019, MSR (1), 2019, NIU (1), 2019, TKL (1), 2019, WLF (1)
      values of `non_hbc$year`, `non_hbc$country_code` not in `wb_urb_pop$year`, `wb_urb_pop$country_code`: 2019, AIA (1), 2019, COK (1), 2019, MSR (1), 2019, NIU (1), 2019, TKL (1), 2019, WLF (1)
      values of `non_hbc$year`, `non_hbc$country_code` not in `wb_density_pop$year`, `wb_density_pop$country_code`: 2019, AIA (1), 2019, COK (1), 2019, MSR (1), 2019, NIU (1), 2019, TKL (1), 2019, WLF (1)
      values of `non_hbc$year`, `non_hbc$country_code` not in `wb_gdp$year`, `wb_gdp$country_code`: 2019, AIA (1), 2019, COK (1), 2019, MSR (1), 2019, NIU (1), 2019, TKL (1), 2019, WLF (1)
      values of `non_hbc$year`, `non_hbc$country_code` not in `who_notifications$year`, `who_notifications$country_code`: 2019, FRO (1), 2019, GIB (1), 2019, IMN (1), 2019, LIE (1), 2019, MAF (1), 2019, VIR (1)
      values of `non_hbc$year`, `non_hbc$country_code` not in `who_estimates$year`, `who_estimates$country_code`: 2019, FRO (1), 2019, GIB (1), 2019, IMN (1), 2019, LIE (1), 2019, MAF (1), 2019, VIR (1)
      values of `non_hbc$year`, `non_hbc$country_code` not in `who_budget$year`, `who_budget$country_code`: 2019, FRO (1), 2019, GIB (1), 2019, IMN (1), 2019, LIE (1), 2019, MAF (1), 2019, VIR (1)
      values of `non_hbc$year`, `non_hbc$country_code` not in `who_community$year`, `who_community$country_code`: 2019, ABW (1), 2019, AIA (1), 2019, ALB (1), 2019, AND (1), 2019, ARE (1), ...
      values of `non_hbc$year`, `non_hbc$country_code` not in `who_sites$year`, `who_sites$country_code`: 2019, FRO (1), 2019, GIB (1), 2019, IMN (1), 2019, LIE (1), 2019, MAF (1), 2019, VIR (1)
      values of `non_hbc$year`, `non_hbc$country_code` not in `who_expenditures$year`, `who_expenditures$country_code`: 2019, FRO (1), 2019, GIB (1), 2019, IMN (1), 2019, LIE (1), 2019, MAF (1), 2019, VIR (1)
      values of `non_hbc$year`, `non_hbc$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2019, ABW (1), 2019, AFG (1), 2019, AIA (1), 2019, AND (1), 2019, ARE (1), ...

# build_dm() `hbc` works and returns a time series

    Code
      dm::glimpse(dm)
    Output
      dm of 12 tables: `hbc`, `wb_tot_pop`, `wb_urb_pop`, `wb_density_pop`, `wb_gdp`, ...
      
      --------------------------------------------------------------------------------
      
      Table: `hbc`
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
      
      Rows: 300
      Columns: 2
      $ country_code <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "BGD", "BGD", "BGD", "~
      $ year         <dbl> 2016, 2017, 2018, 2019, 2020, 2016, 2017, 2018, 2019, 202~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_tot_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 210
      Columns: 3
      $ country_code <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "BGD", "~
      $ year         <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2022, 2021, 202~
      $ pop_total    <dbl> 35588987, 34503774, 33428486, 32353588, 31273533, 3020862~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_urb_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 210
      Columns: 3
      $ country_code   <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "BGD",~
      $ year           <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2022, 2021, 2~
      $ pop_urban_perc <dbl> 68.081, 67.460, 66.825, 66.177, 65.514, 64.839, 64.149,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_density_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 210
      Columns: 3
      $ country_code <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "BGD", "~
      $ year         <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2022, 2021, 202~
      $ pop_density  <dbl> NA, NA, 26.81358, 25.95138, 25.08505, 24.23087, 23.38553,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_gdp`
      Primary key: (`year`, `country_code`)
      
      Rows: 210
      Columns: 3
      $ country_code <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "BGD", "~
      $ year         <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2022, 2021, 202~
      $ gdp          <dbl> 1.067136e+11, 6.568544e+10, 5.024137e+10, 6.930911e+10, 7~
      
      --------------------------------------------------------------------------------
      
      Table: `who_notifications`
      Primary key: (`year`, `country_code`)
      
      Rows: 180
      Columns: 4
      $ country_code <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "BGD", "BGD", "~
      $ year         <dbl> 2016, 2017, 2018, 2019, 2020, 2021, 2016, 2017, 2018, 201~
      $ c_newinc     <dbl> 59513, 54401, 66189, 74105, 63147, 61691, 222248, 242639,~
      $ new_labconf  <dbl> 24603, 24490, 31098, 34887, 31268, 31113, 124604, 140755,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_estimates`
      Primary key: (`year`, `country_code`)
      
      Rows: 180
      Columns: 8
      $ country_code  <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "BGD", "BGD", ~
      $ year          <dbl> 2016, 2017, 2018, 2019, 2020, 2021, 2016, 2017, 2018, 20~
      $ c_cdr         <dbl> 56, 50, 60, 65, 57, 55, 63, 68, 74, 80, 62, 82, 87, 87, ~
      $ c_newinc_100k <dbl> 204, 180, 212, 229, 189, 179, 139, 150, 163, 176, 137, 1~
      $ e_inc_100k    <dbl> 362, 359, 355, 351, 329, 325, 221, 221, 221, 221, 221, 2~
      $ e_inc_num     <dbl> 106000, 108000, 111000, 114000, 110000, 112000, 353000, ~
      $ e_mort_100k   <dbl> 88.0, 96.0, 72.0, 62.0, 59.0, 60.0, 39.0, 34.0, 29.0, 24~
      $ e_pop_num     <dbl> 29154746, 30208628, 31273533, 32353588, 33428486, 345037~
      
      --------------------------------------------------------------------------------
      
      Table: `who_budget`
      Primary key: (`year`, `country_code`)
      
      Rows: 150
      Columns: 12
      $ country_code    <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "BGD", "BGD", "BGD"~
      $ year            <dbl> 2018, 2019, 2020, 2021, 2022, 2018, 2019, 2020, 2021, ~
      $ budget_lab      <dbl> 1526820, 17133500, 742078, 16412210, 16412210, 2236885~
      $ budget_oth      <dbl> 4000000, 4000000, NA, 0, 0, 8695031, 1807810, 2089628,~
      $ budget_staff    <dbl> 1572700, 1572700, 173805, 173805, 2582160, 17313659, 2~
      $ cf_lab          <dbl> 500000, 7216284, 742078, 2100360, 2500360, 8004443, 12~
      $ cf_staff        <dbl> 1572700, 1572700, 173805, 173805, 2081059, 15660486, 2~
      $ cf_tot_domestic <dbl> 3293147, 13692478, 17672192, 6041429, 10831930, 949816~
      $ cf_tot_gf       <dbl> 4972863, 2416285, 1897542, 4213441, 4213441, 36651484,~
      $ cf_tot_grnt     <dbl> 689553, 4000000, 737293, NA, NA, 0, 0, 0, 0, 0, 0, 117~
      $ cf_tot_sources  <dbl> 8955563, 20108763, 20307027, 10254870, 15045371, 46149~
      $ cf_tot_usaid    <dbl> 0, 0, 0, NA, NA, 0, 12981354, 13500000, 130717, 210000~
      
      --------------------------------------------------------------------------------
      
      Table: `who_community`
      Primary key: (`year`, `country_code`)
      
      Rows: 159
      Columns: 9
      $ country_code           <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "BGD"~
      $ year                   <dbl> 2016, 2017, 2018, 2019, 2020, 2021, 2016, 2017,~
      $ bmu                    <dbl> 302, 302, 333, 340, 157, 155, 854, 866, 865, 85~
      $ bmu_community_impl     <dbl> 280, 0, 9, 9, 0, 26, 480, 480, 480, 481, 856, 8~
      $ bmu_ref_data           <dbl> NA, NA, 9, 9, NA, 22, 480, 480, 480, 481, 677, ~
      $ bmu_rxsupport_data     <dbl> NA, 0, 9, NA, 6, NA, 480, 480, 480, 481, 701, N~
      $ bmu_rxsupport_data_coh <dbl> NA, 0, 2730, NA, 168, NA, 187896, 202584, 22125~
      $ notified_ref           <dbl> NA, NA, 5276, 5630, NA, 23138, 186557, 202584, ~
      $ notified_ref_community <dbl> NA, NA, 5276, 2742, NA, 1000, 96255, 112379, 12~
      
      --------------------------------------------------------------------------------
      
      Table: `who_sites`
      Primary key: (`year`, `country_code`)
      
      Rows: 180
      Columns: 11
      $ country_code          <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "AGO", "BGD",~
      $ year                  <dbl> 2016, 2017, 2018, 2019, 2020, 2021, 2016, 2017, ~
      $ culture               <dbl> 3, 3, 0, 0, 4, 1, 4, 4, 5, 5, 4, 6, 257, 363, 34~
      $ lab_cul               <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ lab_sm                <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ smear                 <dbl> 155, 302, 177, 167, 171, 170, 1116, 1149, 1140, ~
      $ lab_xpert             <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ~
      $ xpert                 <dbl> 15, 15, 22, 22, NA, NA, 38, 47, 164, 200, NA, NA~
      $ m_wrd                 <dbl> NA, NA, NA, NA, 53, 16, NA, NA, NA, NA, 324, 448~
      $ m_wrd_tests_performed <dbl> NA, NA, NA, NA, NA, 8830, NA, NA, NA, NA, NA, 75~
      $ m_wrd_tests_positive  <dbl> NA, NA, NA, NA, NA, 3832, NA, NA, NA, NA, NA, 87~
      
      --------------------------------------------------------------------------------
      
      Table: `who_expenditures`
      Primary key: (`year`, `country_code`)
      
      Rows: 150
      Columns: 9
      $ country_code      <chr> "AGO", "AGO", "AGO", "AGO", "AGO", "BGD", "BGD", "BG~
      $ year              <dbl> 2017, 2018, 2019, 2020, 2021, 2017, 2018, 2019, 2020~
      $ rcvd_lab          <dbl> 550000, 550000, 784599, 0, 213166, 4218465, 15593760~
      $ rcvd_staff        <dbl> 990000, 990000, 173805, 173805, 173805, 14096313, 14~
      $ rcvd_tot_domestic <dbl> 27985663, 25830058, 2856381, 5373932, 5587098, 68860~
      $ rcvd_tot_gf       <dbl> 4972863, 3758779, 2416285, 1897542, 1897542, 3231192~
      $ rcvd_tot_grnt     <dbl> 0, 8672452, 120054, 153754, 153754, 0, 0, 0, 0, 0, N~
      $ rcvd_tot_sources  <dbl> 32958526, 38261289, 5392720, 7425228, 7638394, 42581~
      $ rcvd_tot_usaid    <dbl> 0, NA, 0, 0, 0, 3383472, 13500000, 13500000, 1550000~
      
      --------------------------------------------------------------------------------
      
      Table: `gf_procurement`
      Primary key: (`year`, `country_code`)
      
      Rows: 57
      Columns: 3
      $ country_code      <chr> "AGO", "AGO", "AGO", "BGD", "BGD", "CAF", "CAF", "CO~
      $ year              <dbl> 2020, 2021, 2022, 2020, 2021, 2020, 2022, 2020, 2019~
      $ total_numb_device <dbl> 30000, 43890, 11000, 402000, 111400, 3300, 7, 18250,~
      
      --------------------------------------------------------------------------------

---

    Code
      dm::dm_examine_constraints(dm)
    Message <cliMessage>
      ! Unsatisfied constraints:
    Output
      * Table `hbc`: foreign key `year`, `country_code` into table `wb_tot_pop`: values of `hbc$year`, `hbc$country_code` not in `wb_tot_pop$year`, `wb_tot_pop$country_code`: 2023, AGO (1), 2023, BGD (1), 2023, BRA (1), 2023, CAF (1), 2023, CHN (1), ...
      * Table `hbc`: foreign key `year`, `country_code` into table `wb_urb_pop`: values of `hbc$year`, `hbc$country_code` not in `wb_urb_pop$year`, `wb_urb_pop$country_code`: 2023, AGO (1), 2023, BGD (1), 2023, BRA (1), 2023, CAF (1), 2023, CHN (1), ...
      * Table `hbc`: foreign key `year`, `country_code` into table `wb_density_pop`: values of `hbc$year`, `hbc$country_code` not in `wb_density_pop$year`, `wb_density_pop$country_code`: 2023, AGO (1), 2023, BGD (1), 2023, BRA (1), 2023, CAF (1), 2023, CHN (1), ...
      * Table `hbc`: foreign key `year`, `country_code` into table `wb_gdp`: values of `hbc$year`, `hbc$country_code` not in `wb_gdp$year`, `wb_gdp$country_code`: 2023, AGO (1), 2023, BGD (1), 2023, BRA (1), 2023, CAF (1), 2023, CHN (1), ...
      * Table `hbc`: foreign key `year`, `country_code` into table `who_notifications`: values of `hbc$year`, `hbc$country_code` not in `who_notifications$year`, `who_notifications$country_code`: 2022, AGO (1), 2022, BGD (1), 2022, BRA (1), 2022, CAF (1), 2022, CHN (1), ...
      * Table `hbc`: foreign key `year`, `country_code` into table `who_estimates`: values of `hbc$year`, `hbc$country_code` not in `who_estimates$year`, `who_estimates$country_code`: 2022, AGO (1), 2022, BGD (1), 2022, BRA (1), 2022, CAF (1), 2022, CHN (1), ...
      * Table `hbc`: foreign key `year`, `country_code` into table `who_budget`: values of `hbc$year`, `hbc$country_code` not in `who_budget$year`, `who_budget$country_code`: 2016, AGO (1), 2016, BGD (1), 2016, BRA (1), 2016, CAF (1), 2016, CHN (1), ...
      * Table `hbc`: foreign key `year`, `country_code` into table `who_community`: values of `hbc$year`, `hbc$country_code` not in `who_community$year`, `who_community$country_code`: 2016, CHN (1), 2016, PRK (1), 2017, CHN (1), 2017, PRK (1), 2018, CHN (1), ...
      * Table `hbc`: foreign key `year`, `country_code` into table `who_sites`: values of `hbc$year`, `hbc$country_code` not in `who_sites$year`, `who_sites$country_code`: 2022, AGO (1), 2022, BGD (1), 2022, BRA (1), 2022, CAF (1), 2022, CHN (1), ...
      * Table `hbc`: foreign key `year`, `country_code` into table `who_expenditures`: values of `hbc$year`, `hbc$country_code` not in `who_expenditures$year`, `who_expenditures$country_code`: 2016, AGO (1), 2016, BGD (1), 2016, BRA (1), 2016, CAF (1), 2016, CHN (1), ...
      * Table `hbc`: foreign key `year`, `country_code` into table `gf_procurement`: values of `hbc$year`, `hbc$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2016, AGO (1), 2016, BGD (1), 2016, BRA (1), 2016, CAF (1), 2016, CHN (1), ...

---

    Code
      writeLines(dplyr::pull(dplyr::filter(tibble::as_tibble(dm::dm_examine_constraints(
        dm)), problem != ""), problem))
    Output
      values of `hbc$year`, `hbc$country_code` not in `wb_tot_pop$year`, `wb_tot_pop$country_code`: 2023, AGO (1), 2023, BGD (1), 2023, BRA (1), 2023, CAF (1), 2023, CHN (1), ...
      values of `hbc$year`, `hbc$country_code` not in `wb_urb_pop$year`, `wb_urb_pop$country_code`: 2023, AGO (1), 2023, BGD (1), 2023, BRA (1), 2023, CAF (1), 2023, CHN (1), ...
      values of `hbc$year`, `hbc$country_code` not in `wb_density_pop$year`, `wb_density_pop$country_code`: 2023, AGO (1), 2023, BGD (1), 2023, BRA (1), 2023, CAF (1), 2023, CHN (1), ...
      values of `hbc$year`, `hbc$country_code` not in `wb_gdp$year`, `wb_gdp$country_code`: 2023, AGO (1), 2023, BGD (1), 2023, BRA (1), 2023, CAF (1), 2023, CHN (1), ...
      values of `hbc$year`, `hbc$country_code` not in `who_notifications$year`, `who_notifications$country_code`: 2022, AGO (1), 2022, BGD (1), 2022, BRA (1), 2022, CAF (1), 2022, CHN (1), ...
      values of `hbc$year`, `hbc$country_code` not in `who_estimates$year`, `who_estimates$country_code`: 2022, AGO (1), 2022, BGD (1), 2022, BRA (1), 2022, CAF (1), 2022, CHN (1), ...
      values of `hbc$year`, `hbc$country_code` not in `who_budget$year`, `who_budget$country_code`: 2016, AGO (1), 2016, BGD (1), 2016, BRA (1), 2016, CAF (1), 2016, CHN (1), ...
      values of `hbc$year`, `hbc$country_code` not in `who_community$year`, `who_community$country_code`: 2016, CHN (1), 2016, PRK (1), 2017, CHN (1), 2017, PRK (1), 2018, CHN (1), ...
      values of `hbc$year`, `hbc$country_code` not in `who_sites$year`, `who_sites$country_code`: 2022, AGO (1), 2022, BGD (1), 2022, BRA (1), 2022, CAF (1), 2022, CHN (1), ...
      values of `hbc$year`, `hbc$country_code` not in `who_expenditures$year`, `who_expenditures$country_code`: 2016, AGO (1), 2016, BGD (1), 2016, BRA (1), 2016, CAF (1), 2016, CHN (1), ...
      values of `hbc$year`, `hbc$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2016, AGO (1), 2016, BGD (1), 2016, BRA (1), 2016, CAF (1), 2016, CHN (1), ...

# build_dm() `non_hbc` works and returns a time series

    Code
      dm::glimpse(dm)
    Output
      dm of 12 tables: `wb_tot_pop`, `wb_urb_pop`, `wb_density_pop`, `wb_gdp`, `who_no...
      
      --------------------------------------------------------------------------------
      
      Table: `wb_tot_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,456
      Columns: 3
      $ country_code <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "~
      $ year         <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2022, 202~
      $ pop_total    <dbl> 41128771, 40099462, 38972230, 37769499, 36686784, 3564341~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_urb_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,456
      Columns: 3
      $ country_code   <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG",~
      $ year           <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2022, 2~
      $ pop_urban_perc <dbl> 26.616, 26.314, 26.026, 25.754, 25.495, 25.250, 25.020,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_density_pop`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,456
      Columns: 3
      $ country_code <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "~
      $ year         <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2022, 202~
      $ pop_density  <dbl> NA, NA, 59.75228, 57.90825, 56.24823, 54.64854, 53.10428,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_gdp`
      Primary key: (`year`, `country_code`)
      
      Rows: 1,456
      Columns: 3
      $ country_code <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "~
      $ year         <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2022, 202~
      $ gdp          <dbl> NA, 14583135237, 20143451706, 18904502222, 18418860354, 1~
      
      --------------------------------------------------------------------------------
      
      Table: `who_notifications`
      Primary key: (`year`, `country_code`)
      
      Rows: 3,961
      Columns: 4
      $ country_code <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "~
      $ year         <dbl> 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 200~
      $ c_newinc     <dbl> 7107, 10139, 13794, 13808, 18404, 21844, 25475, 28769, 28~
      $ new_labconf  <dbl> NA, NA, 6509, 6510, 8273, 9949, 12468, 13213, 13136, 1249~
      
      --------------------------------------------------------------------------------
      
      Table: `who_estimates`
      Primary key: (`year`, `country_code`)
      
      Rows: 3,961
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
      
      Rows: 910
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
      
      Rows: 565
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
      
      Rows: 2,362
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
      
      Rows: 910
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
      
      Rows: 132
      Columns: 3
      $ country_code      <chr> "AFG", "AFG", "ALB", "ARM", "ARM", "AZE", "AZE", "BD~
      $ year              <dbl> 2020, 2021, 2019, 2020, 2023, 2021, 2022, 2019, 2021~
      $ total_numb_device <dbl> 55000, 90800, 2002, 300, 4500, 16500, 9806, 9300, 22~
      
      --------------------------------------------------------------------------------
      
      Table: `non_hbc`
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
      
      Rows: 18,800
      Columns: 2
      $ country_code <chr> "ABW", "ABW", "ABW", "ABW", "ABW", "ABW", "ABW", "ABW", "~
      $ year         <int> 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 200~
      
      --------------------------------------------------------------------------------

---

    Code
      writeLines(dplyr::pull(dplyr::filter(tibble::as_tibble(dm::dm_examine_constraints(
        dm)), problem != ""), problem))
    Output
      values of `non_hbc$year`, `non_hbc$country_code` not in `wb_tot_pop$year`, `wb_tot_pop$country_code`: 2000, ABW (1), 2000, AFG (1), 2000, AIA (1), 2000, ALB (1), 2000, AND (1), ...
      values of `non_hbc$year`, `non_hbc$country_code` not in `wb_urb_pop$year`, `wb_urb_pop$country_code`: 2000, ABW (1), 2000, AFG (1), 2000, AIA (1), 2000, ALB (1), 2000, AND (1), ...
      values of `non_hbc$year`, `non_hbc$country_code` not in `wb_density_pop$year`, `wb_density_pop$country_code`: 2000, ABW (1), 2000, AFG (1), 2000, AIA (1), 2000, ALB (1), 2000, AND (1), ...
      values of `non_hbc$year`, `non_hbc$country_code` not in `wb_gdp$year`, `wb_gdp$country_code`: 2000, ABW (1), 2000, AFG (1), 2000, AIA (1), 2000, ALB (1), 2000, AND (1), ...
      values of `non_hbc$year`, `non_hbc$country_code` not in `who_notifications$year`, `who_notifications$country_code`: 2000, CUW (1), 2000, FRO (1), 2000, GIB (1), 2000, IMN (1), 2000, LIE (1), ...
      values of `non_hbc$year`, `non_hbc$country_code` not in `who_estimates$year`, `who_estimates$country_code`: 2000, CUW (1), 2000, FRO (1), 2000, GIB (1), 2000, IMN (1), 2000, LIE (1), ...
      values of `non_hbc$year`, `non_hbc$country_code` not in `who_budget$year`, `who_budget$country_code`: 2000, ABW (1), 2000, AFG (1), 2000, AIA (1), 2000, ALB (1), 2000, AND (1), ...
      values of `non_hbc$year`, `non_hbc$country_code` not in `who_community$year`, `who_community$country_code`: 2000, ABW (1), 2000, AFG (1), 2000, AIA (1), 2000, ALB (1), 2000, AND (1), ...
      values of `non_hbc$year`, `non_hbc$country_code` not in `who_sites$year`, `who_sites$country_code`: 2000, ABW (1), 2000, AFG (1), 2000, AIA (1), 2000, ALB (1), 2000, AND (1), ...
      values of `non_hbc$year`, `non_hbc$country_code` not in `who_expenditures$year`, `who_expenditures$country_code`: 2000, ABW (1), 2000, AFG (1), 2000, AIA (1), 2000, ALB (1), 2000, AND (1), ...
      values of `non_hbc$year`, `non_hbc$country_code` not in `gf_procurement$year`, `gf_procurement$country_code`: 2000, ABW (1), 2000, AFG (1), 2000, AIA (1), 2000, ALB (1), 2000, AND (1), ...

