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
          1, 1, 1, 0.84, 1, 0.99, 0.98, 1, 1, 1, 1, 0.84, 0.82, 1, 1, 1, 0.83, 1, 0.99,
          0.98, 1, 1, 1, 1, 0.82, 0.81, 1, 1, 1, 0.83, 1, 0.99, 0.98, 1, 1, 1, 1, 0.83,
          0.81, 1, 1, 1, 0.83, 1, 0.99, 0.97, 1, 1, 1, 1, 0.82, 0.81, 1, 1, 1, 0.82, 1,
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
            1, 0.82, 1, 0.98, 1, 0.81, 0.79, 1, 0.96, 1, 0.8, 1, 0.98, 1, 0.79, 0.77, 1,
            0.96, 1, 0.8, 1, 0.98, 1, 0.8, 0.77, 1, 0.96, 1, 0.8, 1, 0.98, 1, 0.79, 0.78,
            1, 0.96, 1, 0.79, 1, 0.98, 0.76, 1, 0.78, 1, 0.96, 1, 0.76, 1, 0.95, 0.75, 1,
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
        dx_gap = c(
          0.11772736971005009, 0.29433660103687803, 0.038259583825253685,
          -0.3878934436507605, -0.09751731820570123, -0.1311094443942999,
          0.10976354216043945, 0.15477360681849722, 0.578937101280374,
          -0.10897901155199195, 0.08171214180877515, 0.06417741306244974,
          0.04388113468625088
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
        dx_gap = c(
          0.4012806781686599, 0.07069841660586727, -0.4794331990550044,
          -0.09988343583685107, -0.1402603891999463, 0.1703619513851972,
          0.21619585578954995, 0.6636714104487844, -0.13179281904597978,
          0.14474289402887258, 0.07109112243552856, 0.3877066529416994,
          0.07361237973073784, -0.4622304819929616, -0.09223608880552418,
          -0.132121649496909, 0.17736420306516948, 0.21718182731992822,
          0.6728999352333134, -0.14452021757656716, 0.14767600029783215,
          0.1370551345012321, 0.3305539637424118, 0.02262628083495124,
          -0.45244712717919033, -0.09127548986367791, -0.1476739280323479,
          0.11039765232415981, 0.15515969421489792, 0.6394382824918431,
          -0.15741563728380387, 0.07497163731828387, 0.07263822736051627,
          0.29650054702597217, 0.003496805773031918, -0.40606349764675737,
          -0.09481396244552234, -0.135916297687205, 0.07109342579285004,
          0.11757301114847042, 0.6545109878765363, -0.13410995250482433,
          0.02960379237530873, 0.030533927455515406, 0.21595261929020443,
          0.05451836490961817, -0.2847277407063805, -0.09828615281376661,
          -0.10669409198856179, 0.11142104976972843, 0.1398115703289308,
          0.46246863263150295, -0.05783607555881494, 0.08574168966475502,
          0.06607511888138247, 0.20804315260205306, 0.0025451277448558605,
          -0.3521129545174658, -0.11938923585034407, -0.15763477097940376,
          0.06554847819708313, 0.1058158694294003, 0.5146942197617687,
          -0.07788094229161491, 0.030694199568696852, 0.02687456351038053
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
        dx_gap = c(
          -0.21687918259380382, -0.17366604501448663, -0.03299781358668422,
          -0.4603595043529857, -0.07149844168100176, 0.06706142591238386,
          0.4646059912395926, -0.42663808407134024, 0.07692115407366129,
          -0.23618774010120194, -0.19888190400145836, -0.15495658538295098,
          -0.049969675046512535, -0.42378464469640514, -0.05782639114489833,
          0.07575108993113794, 0.5374697929749048, -0.43736316662860364,
          0.08392123396576807, -0.06913802210774314, -0.2831268937639842,
          -0.1028723396061054, -0.09771238851862869, -0.4314197997641499,
          -0.16388546065432882, -0.048258190309939164, 0.6040052732309308,
          -0.4383124872229851, -0.0570475113901078, -0.23799740773950687,
          -0.29486309869554084, -0.09111010853050917, -0.163885127976429,
          -0.3695740620226069, -0.20807266485699835, -0.11767327119504069,
          0.6345947017029985, -0.3674188754063972, -0.12442588910966469,
          -0.2736034248713276, -0.12186825644928845, -0.0634104385041224,
          0.07750254152856552, -0.255592293294703, -0.005348529165802091,
          0.1028676978134303, 0.5672875667030042, -0.2841712897187147,
          0.08122163545125442, -0.09374136874856061, -0.19956642766976682,
          -0.048319045915196805, -0.17821501063230044, -0.2210631950474228,
          -0.11626775689078074, -0.019188039329363436, 0.596042168419229,
          -0.22103713656848356, -0.06194061854536884, -0.13037482991676,
          -0.05888048433851968, -0.44522925490623694, -0.09726045457238457,
          -0.14032251396873235, 0.17736710923176924, 0.3931480947597416,
          0.6706525024396112, -0.28121785601690985, -0.082361658667961,
          0.008936796587864986, -0.04613481733782065, -0.42876898541907565,
          -0.08815395396143781, -0.13119292922320563, 0.1981307137749547,
          0.39356498305343646, 0.6710705978249188, -0.26622147810157,
          -0.07415733403791967, -0.0022218144132771424, -0.04898342756346011,
          -0.4331471293395615, -0.08653465363396287, -0.13101271198703274,
          0.19774326754251306, 0.3858939280293905, 0.6168071808917789,
          -0.2284989895367206, -0.07903536271573387, 0.0663525056375684,
          -0.057054724015022394, -0.3848105184374282, -0.09004844326666678,
          -0.12523804640521322, 0.17679370305340358, 0.3550059496662829,
          0.6563221179068378, -0.20806609735808207, -0.09574668241138462,
          0.059787900714630686, 0.0008647913652034618, -0.25171999876612616,
          -0.09637637885258411, -0.11845412848391716, 0.1956958779780723,
          0.29365895466579833, 0.4289210541959685, -0.07782252444393385,
          0.02961491764489039, 0.13870595505043168, -0.0985918791775484,
          -0.3416142952406924, -0.11775032642781738, -0.18516512581733846,
          0.1132882897478274, 0.2522002136465311, 0.48794669442186606,
          -0.19259513105946854, -0.01732739007021885, 0.08026418021820486
        ),
      )

