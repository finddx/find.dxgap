# compute_completion_rate() works

    Code
      constructive::construct(dplyr::arrange(complete_rate_df_country, year, var_name))
    Output
      tibble::tibble(
        year = rep(c("2016", "2017", "2018", "2019", "2020", "2021"), each = 13L),
        var_name = c(
          "c_newinc", "country_code", "culture", "dx_gap", "e_inc_num", "e_mort_100k",
          "gdp", "is_hbc", "pop_density", "pop_total", "pop_urban_perc", "smear",
          "xpert", "c_newinc", "country_code", "culture", "dx_gap", "e_inc_num",
          "e_mort_100k", "gdp", "is_hbc", "pop_density", "pop_total", "pop_urban_perc",
          "smear", "xpert", "c_newinc", "country_code", "culture", "dx_gap",
          "e_inc_num", "e_mort_100k", "gdp", "is_hbc", "pop_density", "pop_total",
          "pop_urban_perc", "smear", "xpert", "c_newinc", "country_code", "culture",
          "dx_gap", "e_inc_num", "e_mort_100k", "gdp", "is_hbc", "pop_density",
          "pop_total", "pop_urban_perc", "smear", "xpert", "c_newinc", "country_code",
          "culture", "dx_gap", "e_inc_num", "e_mort_100k", "gdp", "is_hbc", "m_wrd",
          "pop_density", "pop_total", "pop_urban_perc", "smear", "c_newinc",
          "country_code", "culture", "dx_gap", "e_inc_num", "e_mort_100k", "gdp",
          "is_hbc", "m_wrd", "pop_density", "pop_total", "pop_urban_perc", "smear"
        ),
        completion_rate = c(
          1, 1, 0.84, 1, 1, 0.99, 0.98, 1, 1, 1, 1, 0.84, 0.82, 1, 1, 0.83, 1, 1, 0.99,
          0.98, 1, 1, 1, 1, 0.82, 0.81, 1, 1, 0.83, 1, 1, 0.99, 0.98, 1, 1, 1, 1, 0.83,
          0.81, 1, 1, 0.83, 1, 1, 0.99, 0.97, 1, 1, 1, 1, 0.82, 0.81, 1, 1, 0.82, 1, 1,
          0.99, 0.97, 1, 0.79, 1, 1, 1, 0.81, 1, 1, 0.79, 1, 1, 0.99, 0.95, 1, 0.79, 1,
          1, 1, 0.79
        ),
      )

---

    Code
      constructive::construct(dplyr::arrange(complete_rate_df_is_hbc, year, var_name))
    Output
      tibble::tibble(
        year = rep(c("2016", "2017", "2018", "2019", "2020", "2021"), each = 24L),
        is_hbc = rep(c("0", "1"), 72),
        var_name = rep(
          c(
            "c_newinc", "country_code", "culture", "dx_gap", "e_inc_num", "e_mort_100k",
            "gdp", "pop_density", "pop_total", "pop_urban_perc", "smear", "xpert",
            "c_newinc", "country_code", "culture", "dx_gap", "e_inc_num", "e_mort_100k",
            "gdp", "pop_density", "pop_total", "pop_urban_perc", "smear", "xpert",
            "c_newinc", "country_code", "culture", "dx_gap", "e_inc_num", "e_mort_100k",
            "gdp", "pop_density", "pop_total", "pop_urban_perc", "smear", "xpert",
            "c_newinc", "country_code", "culture", "dx_gap", "e_inc_num", "e_mort_100k",
            "gdp", "pop_density", "pop_total", "pop_urban_perc", "smear", "xpert",
            "c_newinc", "country_code", "culture", "dx_gap", "e_inc_num", "e_mort_100k",
            "gdp", "m_wrd", "pop_density", "pop_total", "pop_urban_perc", "smear",
            "c_newinc", "country_code", "culture", "dx_gap", "e_inc_num", "e_mort_100k",
            "gdp", "m_wrd", "pop_density", "pop_total", "pop_urban_perc", "smear"
          ),
          each = 2L
        ),
        completion_rate = rep(
          c(
            1, 0.81, 1, 0.97, 0.98, 0.97, 1, 0.8, 1, 0.78, 1, 0.79, 1, 0.97, 0.98, 0.97,
            1, 0.78, 1, 0.76, 1, 0.8, 1, 0.97, 0.98, 0.97, 1, 0.8, 1, 0.76, 1, 0.8, 1,
            0.97, 1, 0.78, 1, 0.77, 1, 0.78, 1, 0.97, 0.75, 1, 0.77, 1, 0.75, 0.97, 1,
            0.97, 0.95, 0.97, 0.75, 1, 0.75, 1
          ),
          c(4L, 1L, 6L, 1L, 1L, 1L, 6L, 1L, 1L, 1L, 5L, 1L, 6L, 1L, 1L, 
          1L, 6L, 1L, 1L, 1L, 5L, 1L, 6L, 1L, 1L, 1L, 6L, 1L, 1L, 1L, 5L, 
          1L, 6L, 3L, 6L, 1L, 1L, 1L, 5L, 1L, 6L, 3L, 1L, 7L, 1L, 5L, 1L, 
          1L, 5L, 1L, 1L, 1L, 1L, 7L, 1L, 1L)
        ),
      )

---

    Code
      constructive::construct(dplyr::arrange(complete_rate_df_cars, var_name))
    Output
      tibble::tibble(
        var_name = c("am", "car_name", "carb", "cyl", "disp", "drat", "gear", "hp", "mpg", "qsec", "vs", "wt"),
        completion_rate = rep(1, 12L),
      )

# compute_correlation() works

    Code
      constructive::construct(dplyr::arrange(corr_df, term))
    Output
      tibble::tibble(
        term = c(
          "c_newinc", "culture", "e_inc_num", "e_mort_100k", "gdp", "is_hbc", "m_wrd",
          "pop_density", "pop_total", "pop_urban_perc", "smear", "xpert", "year"
        ),
        dx_gap = c(
          0.10933688854366293, -0.10873756178024074, 0.15446736485010745,
          0.5790219726080416, -0.13187939909994653, 0.33423680493253966,
          0.04395434905998995, -0.09809073760759902, 0.037215462389324216,
          -0.38579886124964907, 0.08193290845309606, 0.0644982926544106,
          0.11894738934080014
        ),
      ) |>
        structure(class = c("cor_df", "tbl_df", "tbl", "data.frame"))

---

    Code
      constructive::construct(dplyr::arrange(corr_df_by, year, term))
    Output
      tibble::tibble(
        year = rep(seq(2016, 2021, by = 1), each = 11L),
        term = c(
          "c_newinc", "culture", "e_inc_num", "e_mort_100k", "gdp", "is_hbc",
          "pop_density", "pop_total", "pop_urban_perc", "smear", "xpert", "c_newinc",
          "culture", "e_inc_num", "e_mort_100k", "gdp", "is_hbc", "pop_density",
          "pop_total", "pop_urban_perc", "smear", "xpert", "c_newinc", "culture",
          "e_inc_num", "e_mort_100k", "gdp", "is_hbc", "pop_density", "pop_total",
          "pop_urban_perc", "smear", "xpert", "c_newinc", "culture", "e_inc_num",
          "e_mort_100k", "gdp", "is_hbc", "pop_density", "pop_total", "pop_urban_perc",
          "smear", "xpert", "c_newinc", "culture", "e_inc_num", "e_mort_100k", "gdp",
          "is_hbc", "m_wrd", "pop_density", "pop_total", "pop_urban_perc", "smear",
          "c_newinc", "culture", "e_inc_num", "e_mort_100k", "gdp", "is_hbc", "m_wrd",
          "pop_density", "pop_total", "pop_urban_perc", "smear"
        ),
        dx_gap = c(
          0.17027086245294135, -0.1314258267772402, 0.216291630348346,
          0.6644868431442982, -0.14088709658436513, 0.4278514657301908,
          -0.10021042143955505, 0.06987241857071333, -0.47692110334355514,
          0.14517399218862898, 0.07179409686700597, 0.1771671683234237,
          -0.14415199693944172, 0.21716823213105935, 0.6736271383793082,
          -0.13286995180753483, 0.4216672825787692, -0.09265253003170765,
          0.0727084961620808, -0.4599014246975246, 0.1480621683386807,
          0.13758058271806076, 0.11019153705268238, -0.1570475369474713,
          0.15506673806065308, 0.6401984977476047, -0.1480904479044613,
          0.37652568200467784, -0.09154477240973878, 0.02170716849363825,
          -0.45003984455047696, 0.07497163731828387, 0.07278797650543353,
          0.07066930533275023, -0.13376018742347284, 0.11724211797908893,
          0.6552457505337493, -0.13662812113301112, 0.3447645774492427,
          -0.09535179413867138, 0.002280430707777175, -0.4034115189867949,
          0.029892131899281766, 0.03044538642496129, 0.11092489197408854,
          -0.05761859170148429, 0.13940666794610473, 0.4621209004263924,
          -0.10743054526539401, 0.25463006944059674, 0.0662443389340199,
          -0.09893146190837432, 0.053435178821985285, -0.2820750094514286,
          0.08600245841938829, 0.06460965555055356, -0.07814287094622026,
          0.10491680469396329, 0.5135666460431196, -0.15932865779302247,
          0.26003073394987286, 0.02677284596106965, -0.12072801882432402,
          0.0011854967071416543, -0.3523459856913007, 0.030509289843896073
        ),
      )

---

    Code
      constructive::construct(dplyr::arrange(corr_df_by2, year, term, is_hbc))
    Output
      tibble::tibble(
        year = rep(seq(2016, 2021, by = 1), each = 20L),
        is_hbc = rep(c(0, 1), 60),
        term = rep(
          c(
            "c_newinc", "culture", "e_inc_num", "e_mort_100k", "gdp", "pop_density",
            "pop_total", "pop_urban_perc", "smear", "xpert", "c_newinc", "culture",
            "e_inc_num", "e_mort_100k", "gdp", "pop_density", "pop_total",
            "pop_urban_perc", "smear", "xpert", "c_newinc", "culture", "e_inc_num",
            "e_mort_100k", "gdp", "pop_density", "pop_total", "pop_urban_perc", "smear",
            "xpert", "c_newinc", "culture", "e_inc_num", "e_mort_100k", "gdp",
            "pop_density", "pop_total", "pop_urban_perc", "smear", "xpert", "c_newinc",
            "culture", "e_inc_num", "e_mort_100k", "gdp", "m_wrd", "pop_density",
            "pop_total", "pop_urban_perc", "smear", "c_newinc", "culture", "e_inc_num",
            "e_mort_100k", "gdp", "m_wrd", "pop_density", "pop_total", "pop_urban_perc",
            "smear"
          ),
          each = 2L
        ),
        dx_gap = c(
          0.3126683073563916, -0.053265825235439254, -0.24339697111229874,
          -0.399108637264936, 0.49786524493054846, 0.06853870810107437,
          0.6853792722771838, 0.42611088153193033, -0.1326432734858148,
          -0.3949691064566762, -0.09698886347214049, 0.0026638070871200376,
          -0.016958824894770446, -0.1862949725565924, -0.4696962455341419,
          -0.11614691282203905, 0.06210464267651029, -0.07780906470819503,
          0.10675554821576044, -0.2416214163881716, 0.3135636759601282,
          -0.04936088278593169, -0.23395057067345046, -0.4169873172242373,
          0.4874297933148423, 0.06703391863975254, 0.6826086352884617,
          0.48347178907470273, -0.12253105642246043, -0.38078279533404563,
          -0.08702916980083561, -0.02384082650038765, -0.007455363046416689,
          -0.17788446048286824, -0.45923110391444893, -0.059075169361631374,
          0.04355086389869805, -0.06875854993445146, 0.0820525275760441,
          -0.10473932268610409, 0.3175467838616386, -0.14826104901340467,
          -0.1815060852351033, -0.4078883173785264, 0.4824693710747964,
          -0.05037267636773091, 0.6316434065650867, 0.496580788328173,
          -0.12282187003637465, -0.3902989950261995, -0.08528577716136884,
          -0.08858692899774273, -0.005182152166437768, -0.2575788755888357,
          -0.4711672283299822, 0.003901938407770198, 0.05346983893247391,
          -0.1756897788669361, 0.19133536283523322, -0.24854121994697523,
          0.3073889408365345, -0.1883268174943122, -0.14920751818744,
          -0.3535301113028801, 0.4625408141214491, -0.11263678391998241,
          0.6731116593014136, 0.5317086247986226, -0.11627453907241554,
          -0.34369697033590435, -0.0888587857798078, -0.15964379284252347,
          -0.00708197023515779, -0.27310156023959065, -0.42314769641429273,
          0.03796210161240005, 0.05955635445275805, -0.21646390432929138,
          0.188409046440588, -0.2662671007470407, 0.26671504244501804,
          -0.03658016681777542, -0.04628319846146768, -0.28148702544531434,
          0.34611936549327077, 0.057728719811150846, 0.4369010005680202,
          0.5009924203049978, -0.11309500193938771, -0.2522623462864307,
          0.21344167035618145, -0.11973548721861164, -0.09332396726036966,
          0.019943936457487262, 0.02197731696637204, -0.14114465210561503,
          -0.26451469231887503, 0.08257269535819468, 0.14658436664981037,
          -0.025459215779734812, 0.2021412844295154, -0.1357887980181463,
          -0.1843029767695668, -0.21943835049595448, 0.31419446432624487,
          -0.05568663634203571, 0.5086130404262051, 0.4658848073832231,
          -0.18280839435181423, -0.21913668913448256, 0.18240612343151735,
          -0.15177414442751508, -0.11624299279390243, -0.20634367229222986,
          -0.07517891308390984, -0.2084000511759271, -0.36495493635558407,
          0.07536511055099186, 0.14468559533929098, -0.1469933135507194
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

