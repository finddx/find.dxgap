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
          -0.05316880629063138, -0.4493317998672884, -0.09722776100947737,
          -0.13989149346535476, 0.18466947375232612, 0.39883763754392587,
          0.6698500062542782, -0.2824167935138182, -0.0811019412330919,
          0.008382569623425535, -0.040583334833498144, -0.4325620285283231,
          -0.08801680250122901, -0.13061679991832342, 0.20484462677205145,
          0.39864701185435236, 0.6703209275771139, -0.2673840738639208,
          -0.0731925585589783, -0.0013366138945024111, -0.04369227833124242,
          -0.4367547203086767, -0.08653496148168267, -0.13089870569397644,
          0.20393529944139516, 0.3906167428591728, 0.6161518925331257,
          -0.2296204882819942, -0.07903536271573387, 0.0699320690528971,
          -0.0512566176548998, -0.3885545259946957, -0.08970213810898857,
          -0.12476341949218815, 0.18305599694147498, 0.35992988480765137,
          0.6555994016366902, -0.20901804464899235, -0.09478522186763114,
          0.06561694111460076, 0.005327053356920536, -0.25505402710562014,
          -0.09586364626145982, -0.11786972929723245, 0.20022273522932377,
          0.2974732136429075, 0.4294583607516788, -0.07850166180937637,
          0.029692810523490494, 0.14006225017134094, -0.0952076339211785,
          -0.34121046450534886, -0.11644253897191068, -0.18351801510641721,
          0.11549840792889751, 0.2536852940775692, 0.4890255915453964,
          -0.19199268369488184, -0.01769104494822476, 0.0778241591119579
        ),
      )

