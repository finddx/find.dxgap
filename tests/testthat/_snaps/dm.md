# findtb_build_dm() `hbc` works

    Code
      dm::glimpse(dm)
    Output
      dm of 11 tables: `hbc`, `wb_tot_pop`, `wb_urb_pop`, `wb_density_pop`, `wb_gdp`, ...
      
      --------------------------------------------------------------------------------
      
      Table: `hbc`
      Primary key: `country_code`
      10 outgoing foreign key(s):
        `country_code` -> `wb_tot_pop$country_code` no_action
        `country_code` -> `wb_urb_pop$country_code` no_action
        `country_code` -> `wb_density_pop$country_code` no_action
        `country_code` -> `wb_gdp$country_code` no_action
        `country_code` -> `who_notifications$country_code` no_action
        `country_code` -> `who_estimates$country_code` no_action
        `country_code` -> `who_budget$country_code` no_action
        `country_code` -> `who_community$country_code` no_action
        `country_code` -> `who_sites$country_code` no_action
        `country_code` -> `gf_procurement$country_code` no_action
      
      Rows: 30
      Columns: 1
      $ country_code <chr> "AGO", "BGD", "BRA", "CHN", "PRK", "COD", "ETH", "IND", "~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_tot_pop`
      Primary key: `country_code`
      
      Rows: 30
      Columns: 2
      $ country_code <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COD", "COG", "~
      $ pop_total    <dbl> 32353588, 165516222, 211782878, 16207746, 5209324, 140774~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_urb_pop`
      Primary key: `country_code`
      
      Rows: 30
      Columns: 2
      $ country_code   <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COD", "COG",~
      $ pop_urban_perc <dbl> 66.177, 37.405, 86.824, 23.805, 41.770, 60.308, 45.046,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_density_pop`
      Primary key: `country_code`
      
      Rows: 30
      Columns: 2
      $ country_code <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COD", "COG", "~
      $ pop_density  <dbl> 25.951382, 1271.538926, 25.338518, 91.818185, 8.361944, 1~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_gdp`
      Primary key: `country_code`
      
      Rows: 30
      Columns: 2
      $ country_code <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COD", "COG", "~
      $ gdp          <dbl> 6.930911e+10, 3.512384e+11, 1.873288e+12, 2.708939e+10, 2~
      
      --------------------------------------------------------------------------------
      
      Table: `who_notifications`
      Primary key: `country_code`
      
      Rows: 30
      Columns: 3
      $ country_code <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COG", "PRK", "~
      $ c_newinc     <dbl> 74105, 291595, 85523, 29906, 12046, 728265, 11802, 95722,~
      $ new_labconf  <dbl> 34887, 162195, 50073, 10045, 6483, 295225, 4160, 30496, 1~
      
      --------------------------------------------------------------------------------
      
      Table: `who_estimates`
      Primary key: `country_code`
      
      Rows: 30
      Columns: 7
      $ country_code  <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COG", "PRK", ~
      $ c_cdr         <dbl> 65, 80, 89, 64, 43, 88, 57, 72, 62, 70, 73, 67, 62, 49, ~
      $ c_newinc_100k <dbl> 229, 176, 40, 185, 231, 51, 212, 372, 199, 97, 156, 208,~
      $ e_inc_100k    <dbl> 351, 221, 46, 287, 540, 58, 373, 513, 320, 140, 214, 312~
      $ e_inc_num     <dbl> 114000, 366000, 96000, 47000, 28000, 826000, 21000, 1320~
      $ e_mort_100k   <dbl> 62.0, 24.0, 3.3, 20.0, 158.0, 2.3, 92.0, NA, 60.0, 22.0,~
      $ e_pop_num     <dbl> 32353588, 165516222, 211782878, 16207746, 5209324, 14218~
      
      --------------------------------------------------------------------------------
      
      Table: `who_budget`
      Primary key: `country_code`
      
      Rows: 30
      Columns: 11
      $ country_code    <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COG", "PRK"~
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
      Primary key: `country_code`
      
      Rows: 27
      Columns: 8
      $ country_code           <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "COG", "COD"~
      $ bmu                    <dbl> 340, 857, NA, 100, 89, 41, 517, 950, 6532, 514,~
      $ bmu_community_impl     <dbl> 9, 481, NA, 46, 25, 2, 389, 950, 6532, 211, 289~
      $ bmu_ref_data           <dbl> 9, 481, NA, 46, NA, 2, 389, 890, 1372, 211, 289~
      $ bmu_rxsupport_data     <dbl> NA, 481, NA, NA, 90, 2, 399, 950, 6093, 191, 29~
      $ bmu_rxsupport_data_coh <dbl> NA, 242334, NA, NA, 12065, 0, 50566, 108193, 22~
      $ notified_ref           <dbl> 5630, 242334, NA, 20281, NA, 11802, 150807, 107~
      $ notified_ref_community <dbl> 2742, 138110, NA, 9665, NA, 2219, 86411, 17146,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_sites`
      Primary key: `country_code`
      
      Rows: 30
      Columns: 10
      $ country_code          <chr> "AGO", "BGD", "BRA", "KHM", "CAF", "CHN", "COG",~
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
      
      Table: `gf_procurement`
      Primary key: `country_code`
      
      Rows: 11
      Columns: 2
      $ country_code      <chr> "COG", "ETH", "IND", "KEN", "KHM", "MMR", "PAK", "PH~
      $ total_numb_device <dbl> 3450, 181950, 1213800, 5664, 58650, 159892, 150000, ~
      
      --------------------------------------------------------------------------------

---

    Code
      dm::dm_examine_constraints(dm)
    Message <cliMessage>
      ! Unsatisfied constraints:
    Output
      * Table `hbc`: foreign key `country_code` into table `who_community`: values of `hbc$country_code` not in `who_community$country_code`: CHN (1), PRK (1), RUS (1)
      * Table `hbc`: foreign key `country_code` into table `gf_procurement`: values of `hbc$country_code` not in `gf_procurement$country_code`: AGO (1), BGD (1), BRA (1), CAF (1), CHN (1), ...

---

    Code
      writeLines(dplyr::pull(dplyr::filter(tibble::as_tibble(dm::dm_examine_constraints(
        dm)), problem != ""), problem))
    Output
      values of `hbc$country_code` not in `who_community$country_code`: CHN (1), PRK (1), RUS (1)
      values of `hbc$country_code` not in `gf_procurement$country_code`: AGO (1), BGD (1), BRA (1), CAF (1), CHN (1), ...

# findtb_build_dm() `non_hbc` works

    Code
      dm::glimpse(dm)
    Output
      dm of 11 tables: `wb_tot_pop`, `wb_urb_pop`, `wb_density_pop`, `wb_gdp`, `who_no...
      
      --------------------------------------------------------------------------------
      
      Table: `wb_tot_pop`
      Primary key: `country_code`
      
      Rows: 185
      Columns: 2
      $ country_code <chr> "AFG", "ALB", "DZA", "ASM", "AND", "ATG", "ARG", "ARM", "~
      $ pop_total    <dbl> 37769499, 2854191, 42705368, 47321, 76343, 92117, 4493871~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_urb_pop`
      Primary key: `country_code`
      
      Rows: 185
      Columns: 2
      $ country_code   <chr> "AFG", "ALB", "DZA", "ASM", "AND", "ATG", "ARG", "ARM",~
      $ pop_urban_perc <dbl> 25.754, 61.229, 73.189, 87.147, 87.984, 24.506, 91.991,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_density_pop`
      Primary key: `country_code`
      
      Rows: 185
      Columns: 2
      $ country_code <chr> "AFG", "ALB", "DZA", "ASM", "AND", "ATG", "ARG", "ARM", "~
      $ pop_density  <dbl> 57.908252, 104.167555, 17.930316, 236.605000, 162.431915,~
      
      --------------------------------------------------------------------------------
      
      Table: `wb_gdp`
      Primary key: `country_code`
      
      Rows: 185
      Columns: 2
      $ country_code <chr> "AFG", "ALB", "DZA", "ASM", "AND", "ATG", "ARG", "ARM", "~
      $ gdp          <dbl> 1.890450e+10, 1.540183e+10, 1.717603e+11, 6.470000e+08, 3~
      
      --------------------------------------------------------------------------------
      
      Table: `who_notifications`
      Primary key: `country_code`
      
      Rows: 185
      Columns: 3
      $ country_code <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AIA", "ATG", "ARG", "~
      $ c_newinc     <dbl> 52438, 412, 20879, 1, 5, NA, 0, 11446, 621, 2, 1502, 464,~
      $ new_labconf  <dbl> 24358, 211, 5422, 1, 4, NA, 0, 7226, 239, 1, 771, 286, 19~
      
      --------------------------------------------------------------------------------
      
      Table: `who_estimates`
      Primary key: `country_code`
      
      Rows: 185
      Columns: 7
      $ country_code  <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AIA", "ATG", "ARG", ~
      $ c_cdr         <dbl> 74, 87, 81, 100, 87, NA, NA, 87, 84, 87, 87, 87, 79, 87,~
      $ c_newinc_100k <dbl> 139.0, 14.0, 49.0, 2.1, 6.5, NA, 0.0, 26.0, 22.0, 1.9, 5~
      $ e_inc_100k    <dbl> 189.0, 16.0, 61.0, 2.1, 7.5, 22.0, 0.0, 29.0, 26.0, 2.2,~
      $ e_inc_num     <dbl> 71000, 470, 26000, 1, 6, 3, 0, 13000, 740, 2, 1700, 530,~
      $ e_mort_100k   <dbl> 26.00, 0.35, 6.70, 0.17, 0.61, 8.50, 1.20, 1.80, 1.60, 0~
      $ e_pop_num     <dbl> 37769499, 2873883, 42705368, 47321, 76343, 15380, 92117,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_budget`
      Primary key: `country_code`
      
      Rows: 185
      Columns: 11
      $ country_code    <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AIA", "ATG", "ARG"~
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
      Primary key: `country_code`
      
      Rows: 72
      Columns: 8
      $ country_code           <chr> "AFG", "DZA", "AZE", "BLR", "BEN", "BTN", "BIH"~
      $ bmu                    <dbl> 873, 240, 68, 8, 82, 32, 79, 27, 30, 111, 170, ~
      $ bmu_community_impl     <dbl> 719, 0, 0, 8, 82, 0, NA, 27, 23, 96, 170, 0, 20~
      $ bmu_ref_data           <dbl> 719, NA, NA, NA, NA, NA, NA, 0, 23, 96, 170, NA~
      $ bmu_rxsupport_data     <dbl> NA, NA, NA, NA, NA, NA, NA, NA, 23, 102, 18, NA~
      $ bmu_rxsupport_data_coh <dbl> 873, NA, NA, NA, NA, NA, NA, NA, 1344, 6166, 68~
      $ notified_ref           <dbl> 7248, NA, NA, NA, NA, NA, NA, 0, 1288, 4809, 67~
      $ notified_ref_community <dbl> 3052, NA, NA, NA, NA, NA, NA, 0, 1288, 73, 419,~
      
      --------------------------------------------------------------------------------
      
      Table: `who_sites`
      Primary key: `country_code`
      
      Rows: 185
      Columns: 10
      $ country_code          <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AIA", "ATG",~
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
      
      Table: `gf_procurement`
      Primary key: `country_code`
      
      Rows: 30
      Columns: 2
      $ country_code      <chr> "ALB", "BDI", "BFA", "BLR", "BLZ", "BTN", "COM", "ER~
      $ total_numb_device <dbl> 2002, 9300, 310000, 3360, 850, 2552, 2, 17693, 3500,~
      
      --------------------------------------------------------------------------------
      
      Table: `non_hbc`
      Primary key: `country_code`
      10 outgoing foreign key(s):
        `country_code` -> `wb_tot_pop$country_code` no_action
        `country_code` -> `wb_urb_pop$country_code` no_action
        `country_code` -> `wb_density_pop$country_code` no_action
        `country_code` -> `wb_gdp$country_code` no_action
        `country_code` -> `who_notifications$country_code` no_action
        `country_code` -> `who_estimates$country_code` no_action
        `country_code` -> `who_budget$country_code` no_action
        `country_code` -> `who_community$country_code` no_action
        `country_code` -> `who_sites$country_code` no_action
        `country_code` -> `gf_procurement$country_code` no_action
      
      Rows: 219
      Columns: 1
      $ country_code <chr> "AFG", "ALB", "DZA", "ASM", "AND", "AIA", "ATA", "ATG", "~
      
      --------------------------------------------------------------------------------

---

    Code
      writeLines(dplyr::pull(dplyr::filter(tibble::as_tibble(dm::dm_examine_constraints(
        dm)), problem != ""), problem))
    Output
      values of `non_hbc$country_code` not in `wb_tot_pop$country_code`: AIA (1), ALA (1), ATA (1), ATF (1), BES (1), ...
      values of `non_hbc$country_code` not in `wb_urb_pop$country_code`: AIA (1), ALA (1), ATA (1), ATF (1), BES (1), ...
      values of `non_hbc$country_code` not in `wb_density_pop$country_code`: AIA (1), ALA (1), ATA (1), ATF (1), BES (1), ...
      values of `non_hbc$country_code` not in `wb_gdp$country_code`: AIA (1), ALA (1), ATA (1), ATF (1), BES (1), ...
      values of `non_hbc$country_code` not in `who_notifications$country_code`: ALA (1), ATA (1), ATF (1), BES (1), BLM (1), ...
      values of `non_hbc$country_code` not in `who_estimates$country_code`: ALA (1), ATA (1), ATF (1), BES (1), BLM (1), ...
      values of `non_hbc$country_code` not in `who_budget$country_code`: ALA (1), ATA (1), ATF (1), BES (1), BLM (1), ...
      values of `non_hbc$country_code` not in `who_community$country_code`: ABW (1), AIA (1), ALA (1), ALB (1), AND (1), ...
      values of `non_hbc$country_code` not in `who_sites$country_code`: ALA (1), ATA (1), ATF (1), BES (1), BLM (1), ...
      values of `non_hbc$country_code` not in `gf_procurement$country_code`: ABW (1), AFG (1), AIA (1), ALA (1), AND (1), ...

