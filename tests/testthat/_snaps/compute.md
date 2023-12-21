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
          0.11894738934080014, 0.2945113470785911, 0.037215462389324216,
          -0.38579886124964907, -0.09809073760759902, -0.13187939909994653,
          0.10933688854366293, 0.15446736485010745, 0.5790219726080416,
          -0.10873756178024074, 0.08193290845309606, 0.0644982926544106,
          0.04395434905998995
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
          0.4025233174631992, 0.06987241857071333, -0.47692110334355514,
          -0.10021042143955505, -0.14088709658436513, 0.17027086245294135,
          0.216291630348346, 0.6644868431442982, -0.1314258267772402,
          0.14517399218862898, 0.07179409686700597, 0.3886138031478452,
          0.0727084961620808, -0.4599014246975246, -0.09265253003170765,
          -0.13286995180753483, 0.1771671683234237, 0.21716823213105935,
          0.6736271383793082, -0.14415199693944172, 0.1480621683386807,
          0.13758058271806076, 0.3314200990932067, 0.02170716849363825,
          -0.45003984455047696, -0.09154477240973878, -0.1480904479044613,
          0.11019153705268238, 0.15506673806065308, 0.6401984977476047,
          -0.1570475369474713, 0.07497163731828387, 0.07278797650543353,
          0.29698396529829807, 0.002280430707777175, -0.4034115189867949,
          -0.09535179413867138, -0.13662812113301112, 0.07066930533275023,
          0.11724211797908893, 0.6552457505337493, -0.13376018742347284,
          0.029892131899281766, 0.03044538642496129, 0.21576034263740324,
          0.053435178821985285, -0.2820750094514286, -0.09893146190837432,
          -0.10743054526539401, 0.11092489197408854, 0.13940666794610473,
          0.4621209004263924, -0.05761859170148429, 0.08600245841938829,
          0.0662443389340199, 0.2065607429971509, 0.0011854967071416543,
          -0.3523459856913007, -0.12072801882432402, -0.15932865779302247,
          0.06460965555055356, 0.10491680469396329, 0.5135666460431196,
          -0.07814287094622026, 0.030509289843896073, 0.02677284596106965
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

# compute_dx_gap() fails correctly

    Code
      compute_dx_gap(tbl, e_inc_num)
    Condition
      Error in `compute_dx_gap()`:
      ! `notified` is absent but must be supplied.

---

    Code
      compute_dx_gap(tbl, c_newinc)
    Condition
      Error in `compute_dx_gap()`:
      ! `notified` is absent but must be supplied.

---

    Code
      compute_dx_gap(tbl, e_inc_num, c_newinc)
    Condition
      Error in `check_any_zero()`:
      ! `0` values found in `e_inc_num`.
      i Dividing by `0` generates `Inf` values.

---

    Code
      compute_dx_gap(dplyr::mutate(tbl, e_inc_num = dplyr::na_if(e_inc_num, 0)),
      e_inc_num, c_newinc)
    Condition
      Error in `check_any_na()`:
      ! `NA` values found in `e_inc_num`.

