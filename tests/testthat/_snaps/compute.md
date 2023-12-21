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
          -0.10929532164330874, -0.2536255603554185, -0.028648042737097774,
          0.3100073818317842, 0.0829048139742735, 0.11150782670225179,
          -0.07645607146512208, -0.13183639121507976, -0.5759346875208728,
          0.0948904725975375, -0.06594370242773849, -0.08202562142833653,
          -0.02104461297270867
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
          -0.35915568639766066, -0.07421223804337608, 0.3774936684591879,
          0.08269871083944229, 0.10669047458619124, -0.13866505623619255,
          -0.19665822331492874, -0.6311834352644432, 0.10239339949804094,
          -0.14570172212594631, -0.1163427569629063, -0.34158696718501447,
          -0.07206306517958905, 0.35990248983141426, 0.07828424728494994,
          0.10394788041138987, -0.13924642058531414, -0.1920395021645703,
          -0.6516206669082341, 0.11320762439188002, -0.14337385517112947,
          -0.16091045015990582, -0.2667826275809509, -0.025442345459415826,
          0.31598967603041467, 0.07378726522339868, 0.10816506493984018,
          -0.06703845011594103, -0.12329644030720795, -0.6018216869447552,
          0.10938653501471177, -0.06347076226774948, -0.08220500204200926,
          -0.24223104491009506, -0.006102555477919479, 0.2918761702151543,
          0.07769977179270494, 0.10661475230057459, -0.03878340705529678,
          -0.09610871857748116, -0.6303746316464688, 0.10255354513933551,
          -0.022926121440011688, -0.03750883782249422, -0.1929434037412054,
          -0.027510471275346275, 0.2923551243248979, 0.09411341124678854,
          0.11967560020409157, -0.08349960046895859, -0.12554019426730598,
          -0.5213734935595745, 0.08236077621672895, -0.06191884943333162,
          -0.04778249940475785, -0.16526913218369232, 0.025219420666401596,
          0.2759787589382392, 0.09580027857332968, 0.13511841214649584,
          -0.03001046335583955, -0.07142308679464657, -0.5078022581221582,
          0.0801257742955543, 0.004820065806989113, -0.003206369820341424
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
          0.11196668346320558, 0.05063344631284226, 0.0372997404494658,
          0.25092758779572466, 0.07508249573573839, -0.04905396908875726,
          -0.3309122224612693, 0.2533980992369522, -0.07195710017324235,
          0.05466583056749433, 0.1021574359120228, 0.039681080852793975,
          0.04869171494869625, 0.24296089919202624, 0.07170431645834423,
          -0.048211292315530445, -0.41965167156254224, 0.2556811343759513,
          -0.07554674435520543, -0.03223204021745441, 0.1452324263685412,
          0.005256702019393302, 0.06449165003139247, 0.23108867053903273,
          0.1444206450951322, 0.033683412247719736, -0.43722735089217646,
          0.23363530372491756, 0.029469829314446666, 0.0989030164738958,
          0.1705878683619401, 0.015767385761426035, 0.09532020698032513,
          0.22147260322490042, 0.1719400577460527, 0.07431331431651937,
          -0.4918611234509521, 0.22080628808387862, 0.08490586358160915,
          0.1507911430724018, 0.10535889679091298, 0.04276579276288976,
          -0.0442644135124617, 0.20168750985756492, 0.04309716803273059,
          -0.06494257625961938, -0.558576904121325, 0.22030458065901876,
          -0.052799504561208584, 0.07128937938252311, 0.20350899359641592,
          0.12512810326899518, 0.13998508918340122, 0.20383168769821855,
          0.14184125228202343, 0.05452721290954796, -0.6479717742264429,
          0.1945169773548237, 0.09810259779475741, 0.14268348853906432,
          0.04664394593128121, 0.368733562278152, 0.08364628418494492,
          0.1136816059636376, -0.16869736549869863, -0.385862068573339,
          -0.6879516467494939, 0.22519383837534276, 0.05412343133252882,
          -0.06783345119556726, 0.04554218816005748, 0.3527007372967754,
          0.07831777877463648, 0.10936128180481819, -0.17516213414029277,
          -0.37573067977660896, -0.6945687449725593, 0.22130674852588778,
          0.055327344681247545, -0.0473145691893491, 0.04779852917380138,
          0.3159812738713189, 0.07320711898362829, 0.10361529465184834,
          -0.156790617318831, -0.344407581711219, -0.6384728494987082,
          0.17732118365028018, 0.05815653050991553, -0.09742853104184822,
          0.053859821907147644, 0.2873797662728829, 0.07695630091114711,
          0.10282387769527225, -0.1440309926691891, -0.3247754938924645,
          -0.6850379479019559, 0.16838956954221002, 0.07030152262016708,
          -0.09149025443802357, 0.04811648506903247, 0.2804674112786392,
          0.09558561517646301, 0.12868218748856622, -0.1351859182311582,
          -0.269930085990717, -0.5000082431023642, 0.13189577844418912,
          0.027006259701915496, -0.10878416481858796, 0.10294388315015694,
          0.25913088142417734, 0.0939875244229976, 0.14568490419133637,
          -0.06218989099321357, -0.2162714128702447, -0.47277828495951557,
          0.1816569241708328, 0.050508297050214694, -0.08121251968119308
        ),
      )

