# compute_completion_rate() works

    Code
      constructive::construct(complete_rate_df_country)
    Output
      tibble::tibble(
        year = rep(c("2016", "2017", "2018", "2019", "2020", "2021"), each = 13L),
        var_name = c(
          "c_newinc", "country", "country_code", "culture", "e_inc_num", "e_mort_100k",
          "gdp", "is_hbc", "pop_density", "pop_total", "pop_urban_perc", "smear",
          "xpert", "c_newinc", "country", "country_code", "culture", "e_inc_num",
          "e_mort_100k", "gdp", "is_hbc", "pop_density", "pop_total", "pop_urban_perc",
          "smear", "xpert", "c_newinc", "country", "country_code", "culture",
          "e_inc_num", "e_mort_100k", "gdp", "is_hbc", "pop_density", "pop_total",
          "pop_urban_perc", "smear", "xpert", "c_newinc", "country", "country_code",
          "culture", "e_inc_num", "e_mort_100k", "gdp", "is_hbc", "pop_density",
          "pop_total", "pop_urban_perc", "smear", "xpert", "c_newinc", "country",
          "country_code", "culture", "e_inc_num", "e_mort_100k", "gdp", "is_hbc",
          "m_wrd", "pop_density", "pop_total", "pop_urban_perc", "smear", "c_newinc",
          "country", "country_code", "culture", "e_inc_num", "e_mort_100k", "gdp",
          "is_hbc", "m_wrd", "pop_density", "pop_total", "pop_urban_perc", "smear"
        ),
        completion_rate = c(
          1, 1, 1, 0.84, 1, 0.99, 0.98, 1, 1, 1, 1, 0.83, 0.81, 1, 1, 1, 0.82, 1, 0.99,
          0.98, 1, 1, 1, 1, 0.82, 0.8, 1, 1, 1, 0.83, 1, 0.99, 0.98, 1, 1, 1, 1, 0.82,
          0.8, 1, 1, 1, 0.83, 1, 0.99, 0.97, 1, 1, 1, 1, 0.82, 0.81, 1, 1, 1, 0.81, 1,
          0.99, 0.97, 1, 0.79, 1, 1, 1, 0.81, 1, 1, 1, 0.79, 1, 0.99, 0.95, 1, 0.79, 1,
          1, 1, 0.79
        ),
      )

---

    Code
      constructive::construct(complete_rate_df_is_hbc)
    Output
      tibble::tibble(
        year = rep(c("2016", "2017", "2018", "2019", "2020", "2021"), each = 24L),
        is_hbc = rep(rep(c("0", "1"), 6), each = 12L),
        var_name = c(
          "c_newinc", "country", "country_code", "culture", "e_inc_num", "e_mort_100k",
          "gdp", "pop_density", "pop_total", "pop_urban_perc", "smear", "xpert",
          "c_newinc", "country", "country_code", "culture", "e_inc_num", "e_mort_100k",
          "gdp", "pop_density", "pop_total", "pop_urban_perc", "smear", "xpert",
          "c_newinc", "country", "country_code", "culture", "e_inc_num", "e_mort_100k",
          "gdp", "pop_density", "pop_total", "pop_urban_perc", "smear", "xpert",
          "c_newinc", "country", "country_code", "culture", "e_inc_num", "e_mort_100k",
          "gdp", "pop_density", "pop_total", "pop_urban_perc", "smear", "xpert",
          "c_newinc", "country", "country_code", "culture", "e_inc_num", "e_mort_100k",
          "gdp", "pop_density", "pop_total", "pop_urban_perc", "smear", "xpert",
          "c_newinc", "country", "country_code", "culture", "e_inc_num", "e_mort_100k",
          "gdp", "pop_density", "pop_total", "pop_urban_perc", "smear", "xpert",
          "c_newinc", "country", "country_code", "culture", "e_inc_num", "e_mort_100k",
          "gdp", "pop_density", "pop_total", "pop_urban_perc", "smear", "xpert",
          "c_newinc", "country", "country_code", "culture", "e_inc_num", "e_mort_100k",
          "gdp", "pop_density", "pop_total", "pop_urban_perc", "smear", "xpert",
          "c_newinc", "country", "country_code", "culture", "e_inc_num", "e_mort_100k",
          "gdp", "m_wrd", "pop_density", "pop_total", "pop_urban_perc", "smear",
          "c_newinc", "country", "country_code", "culture", "e_inc_num", "e_mort_100k",
          "gdp", "m_wrd", "pop_density", "pop_total", "pop_urban_perc", "smear",
          "c_newinc", "country", "country_code", "culture", "e_inc_num", "e_mort_100k",
          "gdp", "m_wrd", "pop_density", "pop_total", "pop_urban_perc", "smear",
          "c_newinc", "country", "country_code", "culture", "e_inc_num", "e_mort_100k",
          "gdp", "m_wrd", "pop_density", "pop_total", "pop_urban_perc", "smear"
        ),
        completion_rate = rep(
          c(
            1, 0.81, 1, 0.98, 1, 0.81, 0.78, 1, 0.96, 1, 0.79, 1, 0.98, 1, 0.79, 0.77, 1,
            0.96, 1, 0.8, 1, 0.98, 1, 0.79, 0.77, 1, 0.96, 1, 0.8, 1, 0.98, 1, 0.79, 0.78,
            1, 0.96, 1, 0.78, 1, 0.98, 0.76, 1, 0.78, 1, 0.96, 1, 0.76, 1, 0.95, 0.75, 1,
            0.75, 1, 0.96, 1, 0.96, 1
          ),
          c(3L, 1L, 2L, 1L, 3L, 1L, 1L, 5L, 2L, 8L, 1L, 2L, 1L, 3L, 1L, 
          1L, 5L, 2L, 8L, 1L, 2L, 1L, 3L, 1L, 1L, 5L, 2L, 8L, 1L, 2L, 1L, 
          3L, 1L, 1L, 5L, 2L, 8L, 1L, 2L, 1L, 1L, 3L, 1L, 5L, 2L, 8L, 1L, 
          2L, 1L, 1L, 3L, 1L, 3L, 1L, 1L, 2L, 5L)
        ),
      )

---

    Code
      constructive::construct(complete_rate_df_cars)
    Output
      tibble::tibble(
        var_name = c("am", "car_name", "carb", "cyl", "disp", "drat", "gear", "hp", "mpg", "qsec", "vs", "wt"),
        completion_rate = rep(1, 12L),
      )

# compute_correlation() works

    Code
      constructive::construct(corr_df)
    Output
      tibble::tibble(
        term = c(
          "year", "is_hbc", "pop_total", "pop_urban_perc", "pop_density", "gdp",
          "c_newinc", "e_inc_num", "e_mort_100k", "culture", "smear", "xpert", "m_wrd"
        ),
        who_dx_gap = c(
          0.11772736971005, 0.2943366010368778, 0.03825958382525363,
          -0.38789344365076022791, -0x1.8f6e51c7cb36ep-4, -0.1311094443943,
          0.10976354216044006, 0.15477360681849828, 0.5789371012803733,
          -0x1.be60c6a90f31fp-4, 0.08171214180877566, 0.06417741306244987,
          0.0438811346862509
        ),
      ) |>
        structure(class = c("cor_df", "tbl_df", "tbl", "data.frame"))

---

    Code
      constructive::construct(corr_df_by)
    Output
      tibble::tibble(
        year = rep(seq(2016, 2021, by = 1), each = 11L),
        term = c(
          "is_hbc", "pop_total", "pop_urban_perc", "pop_density", "gdp", "c_newinc",
          "e_inc_num", "e_mort_100k", "culture", "smear", "xpert", "is_hbc",
          "pop_total", "pop_urban_perc", "pop_density", "gdp", "c_newinc", "e_inc_num",
          "e_mort_100k", "culture", "smear", "xpert", "is_hbc", "pop_total",
          "pop_urban_perc", "pop_density", "gdp", "c_newinc", "e_inc_num",
          "e_mort_100k", "culture", "smear", "xpert", "is_hbc", "pop_total",
          "pop_urban_perc", "pop_density", "gdp", "c_newinc", "e_inc_num",
          "e_mort_100k", "culture", "smear", "xpert", "is_hbc", "pop_total",
          "pop_urban_perc", "pop_density", "gdp", "c_newinc", "e_inc_num",
          "e_mort_100k", "culture", "smear", "m_wrd", "is_hbc", "pop_total",
          "pop_urban_perc", "pop_density", "gdp", "c_newinc", "e_inc_num",
          "e_mort_100k", "culture", "smear", "m_wrd"
        ),
        who_dx_gap = c(
          0.40128067816866025, 0.07069841660586727, -0.4794331990550047551,
          -0.09988343583685104, -0.14026038919994638, 0.17036195138519705,
          0.21619585578954983, 0.6636714104487842, -0.13179281904597986,
          0.14474289402887278, 0.07109112243552859, 0.3877066529416991481,
          0.0736123797307378, -0.46223048199296135, -0.0922360888055241,
          -0.13212164949690894, 0.17736420306516962, 0x1.bcc9d36cff338p-3,
          0.6728999352333133, -0.14452021757656708, 0.14767600029783212,
          0.13705513450123205, 0.330553963742412, 0.022626280834951232,
          -0.4524471271791903, -0x1.75dd49be4107bp-4, -0.14767392803234786,
          0.1103976523241601, 0.1551596942148979, 0.6394382824918429,
          -0.15741563728380414, 0.0749716373182839, 0.07263822736051623,
          0.29650054702597195, 0.0034968057730319314, -0.4060634976467573,
          -0.0948139624455223, -0.135916297687205, 0.0710934257928503,
          0.11757301114847028, 0.6545109878765357, -0.13410995250482444,
          0.02960379237530874, 0.03053392745551542636351, 0.2159526192902046,
          0.05451836490961818, -0.2847277407063805, -0.09828615281376664,
          -0.1066940919885618, 0x1.c861704d8d32ap-4, 0.1398115703289308,
          0.4624686326315029, -0.05783607555881497, 0.08574168966475504,
          0.06607511888138251, 0.20804315260205308, 0.00254512774485586,
          -0.3521129545174658, -0.11938923585034420805, -0.15763477097940365,
          0.06554847819708313, 0.10581586942940048, 0.5146942197617685,
          -0.07788094229161488, 0.03069419956869684, 0.026874563510380502
        ),
      )

---

    Code
      constructive::construct(corr_df_by2)
    Output
      tibble::tibble(
        year = rep(rep(seq(2016, 2021, by = 1), 2), each = 10L),
        is_hbc = rep(c(1, 0), each = 60L),
        term = rep(
          c(
            "pop_total", "pop_urban_perc", "pop_density", "gdp", "c_newinc", "e_inc_num",
            "e_mort_100k", "culture", "smear", "xpert", "pop_total", "pop_urban_perc",
            "pop_density", "gdp", "c_newinc", "e_inc_num", "e_mort_100k", "culture",
            "smear", "xpert", "pop_total", "pop_urban_perc", "pop_density", "gdp",
            "c_newinc", "e_inc_num", "e_mort_100k", "culture", "smear", "xpert",
            "pop_total", "pop_urban_perc", "pop_density", "gdp", "c_newinc", "e_inc_num",
            "e_mort_100k", "culture", "smear", "xpert", "pop_total", "pop_urban_perc",
            "pop_density", "gdp", "c_newinc", "e_inc_num", "e_mort_100k", "culture",
            "smear", "m_wrd", "pop_total", "pop_urban_perc", "pop_density", "gdp",
            "c_newinc", "e_inc_num", "e_mort_100k", "culture", "smear", "m_wrd"
          ),
          2
        ),
        who_dx_gap = c(
          -0.21687918259380395, -0.1736660450144866, -0.032997813586684244,
          -0.4603595043529857, -0.07149844168100175, 0.06706142591238387,
          0.46460599123959234, -0x1.b4e09d29420d9p-2, 0.0769211540736613,
          -0.23618774010120205, -0x1.974f654b9eab4p-3, -0.15495658538295096,
          -0.04996967504651254, -0.4237846446964052, -0.05782639114489834,
          0.07575108993113794, 0.5374697929749049, -0.4373631666286038,
          0.08392123396576809, -0.06913802210774317, -0.28312689376398414,
          -0.10287233960610542, -0.09771238851862865115727, -0.4314197997641497,
          -0.16388546065432877, -0.04825819030993912, 0.6040052732309308,
          -0x1.c0d4fd18345ddp-2, -0.057047511390107816, -0.23799740773950664,
          -0.2948630986955409, -0.091110108530509187, -0.163885127976429,
          -0.369574062022606842, -0.20807266485699827, -0.11767327119504066,
          0.6345947017029986, -0.367418875406397449, -0.1244258891096647474,
          -0.2736034248713276, -0.12186825644928842, -0.06341043850412235,
          0.07750254152856555, -0.255592293294703, -0.005348529165802069,
          0.10286769781343034, 0.5672875667030043, -0.2841712897187147,
          0.08122163545125442, -0.09374136874856058, -0.1995664276697669,
          -0.048319045915196784, -0.1782150106323004, -0.22106319504742275,
          -0x1.dc3b9456cd8bep-4, -0.019188039329363422, 0.596042168419229,
          -0x1.c4af1e461ae02p-3, -0x1.fb6ae45e48aa4p-5, -0.13037482991675994,
          -0.05316880629063138, -0.4493317998672888, -0.09722776100947732,
          -0.13989149346535473, 0x1.7a33fd32afa8dp-3, 0.3988376375439259,
          0.669850006254278, -0.2824167935138183, -0.08110194123309189,
          0.008382569623425488, -0.04058333483349812, -0.4325620285283231,
          -0.08801680250122897, -0.1306167999183234, 0x1.a3859465fa71ep-3,
          0.39864701185435225, 0.670320927577114, -0.2673840738639207681,
          -0.07319255855897831, -0.0013366138945023734, -0.04369227833124241,
          -0.43675472030867684703, -0.08653496148168262, -0.13089870569397646,
          0.2039352994413951, 0.3906167428591728, 0.6161518925331254,
          -0x1.d643443d4d3e1p-3, -0.07903536271573385, 0.06993206905289712,
          -0.05125661765489981, -0.38855452599469575, -0.08970213810898854,
          -0x1.ff07ed674c17bp-4, 0.1830559969414748, 0.3599298848076513,
          0.6555994016366901, -0.209018044648992263, -0.09478522186763118,
          0.06561694111460077, 0.005327053356920543, -0.2550540271056203,
          -0.09586364626145982, -0.117869729297232509, 0.20022273522932377,
          0.2974732136429076, 0.42945836075167904, -0.0785016618093763,
          0.029692810523490487, 0.14006225017134094, -0.09520763392117844,
          -0.341210464505349, -0.11644253897191066, -0.18351801510641724,
          0.11549840792889758, 0.25368529407756907, 0.4890255915453958,
          -0.19199268369488187, -0.017691044948224766, 0.07782415911195789
        ),
      )

