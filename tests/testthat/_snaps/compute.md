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
          1, 1, 0.83, 1, 1, 0.99, 0.98, 1, 1, 1, 1, 0.82, 0.8, 1, 1, 0.81, 1, 1, 0.99,
          0.98, 1, 1, 1, 1, 0.81, 0.79, 1, 1, 0.82, 1, 1, 0.99, 0.98, 1, 1, 1, 1, 0.81,
          0.79, 1, 1, 0.82, 1, 1, 0.99, 0.97, 1, 1, 1, 1, 0.81, 0.8, 1, 1, 0.81, 1, 1,
          0.99, 0.97, 1, 0.79, 1, 1, 1, 0.8, 1, 1, 0.78, 1, 1, 0.99, 0.95, 1, 0.78, 1,
          1, 1, 0.78
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
            1, 0.8, 1, 0.96, 0.98, 0.96, 1, 0.79, 1, 0.77, 1, 0.78, 1, 0.96, 0.98, 0.96,
            1, 0.78, 1, 0.76, 1, 0.79, 1, 0.96, 0.98, 0.96, 1, 0.78, 1, 0.76, 1, 0.79, 1,
            0.96, 0.98, 0.96, 1, 0.78, 1, 0.76, 1, 0.78, 1, 0.96, 0.98, 0.96, 0.75, 1,
            0.77, 1, 0.75, 0.96, 1, 0.96, 0.95, 0.96, 0.75, 1, 0.75, 1
          ),
          c(4L, 1L, 6L, 1L, 1L, 1L, 6L, 1L, 1L, 1L, 5L, 1L, 6L, 1L, 1L, 
          1L, 6L, 1L, 1L, 1L, 5L, 1L, 6L, 1L, 1L, 1L, 6L, 1L, 1L, 1L, 5L, 
          1L, 6L, 1L, 1L, 1L, 6L, 1L, 1L, 1L, 5L, 1L, 6L, 1L, 1L, 1L, 1L, 
          7L, 1L, 5L, 1L, 1L, 5L, 1L, 1L, 1L, 1L, 7L, 1L, 1L)
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
          0.11057115922177536, -0.10563928832120754, 0.15491242224617005,
          0.5766695046335633, -0.12667586754479582, 0.2940705065648455,
          0.048678027512707917, -0.10397064100880762, 0.04066165295898704,
          -0.39773129492633674, 0.08476065895539416, 0.06693331272495825,
          0.11482992196092047
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
          0.1710979170948811, -0.12901731450112977, 0.2163176444215262,
          0.6620492853967823, -0.13608633758365207, 0.40110608429614786,
          -0.10617946079604752, 0.07298733605139487, -0.486311669014623,
          0.14680550229011521, 0.07369331536418965, 0.1762103427794564,
          -0.1412556170203774, 0.21523151924623637, 0.666350877111008,
          -0.1280007805719789, 0.3838733902479587, -0.09860172911152548,
          0.07451830631698071, -0.4733650169349509, 0.14994526902771496,
          0.13935954856075536, 0.10898532684144902, -0.15421474081400233,
          0.1528958011330549, 0.6304055037747077, -0.14425077043723308,
          0.3251282590852813, -0.09643418067041053, 0.02303388525682722,
          -0.46600819429486295, 0.07758901370063132, 0.07576476960654668,
          0.07369047736576467, -0.1310519650781077, 0.11961165710220889,
          0.6533965715334393, -0.12966727382914317, 0.2984737366238715,
          -0.10252715650244629, 0.008217692508052836, -0.4097644006513879,
          0.03240585990856851, 0.033589514053064276, 0.11326343728177546,
          -0.053831871068660615, 0.14124408579918976, 0.4643996481197358,
          -0.10195767468000115, 0.2187239361849283, 0.07100876011355974,
          -0.1050992468354004, 0.05777670896251975, -0.29289626733283286,
          0.08990699999621324, 0.06689706764841642, -0.07332010371307594,
          0.10662831054571753, 0.5132201569061732, -0.1523424497748001,
          0.20894348983195454, 0.03189540300946703, -0.12602843352601273,
          0.005623120482723053, -0.3661862534702527, 0.03594067262986782
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
          0.18761674700275835, -0.07149844168100176, -0.27479397022069457,
          -0.42663808407134024, 0.39857813069579767, 0.06706142591238386,
          0.6668973310410203, 0.4646059912395926, -0.1359992825294376,
          -0.4603595043529857, -0.10301585240041006, -0.03299781358668422,
          -0.04711204167781616, -0.21687918259380382, -0.45844745557252786,
          -0.17366604501448663, -0.07614531897669106, 0.07692115407366129,
          0.014952719111277681, -0.23618774010120194, 0.2033421152102686,
          -0.05782639114489833, -0.2594719915342201, -0.43736316662860364,
          0.3923905835417373, 0.07575108993113794, 0.6615719443119438,
          0.5374697929749048, -0.12650787885171205, -0.42378464469640514,
          -0.093830895217479, -0.049969675046512535, -0.03636565609133384,
          -0.19888190400145836, -0.4469357258726852, -0.15495658538295098,
          -0.06798765445326807, 0.08392123396576807, 0.0059681392562257,
          -0.06913802210774314, 0.1986789400565339, -0.16388546065432882,
          -0.22301566074072113, -0.4383124872229851, 0.3802767897677161,
          -0.048258190309939164, 0.6055248500116053, 0.6040052732309308,
          -0.1277504946216772, -0.4314197997641499, -0.09103523487276072,
          -0.09771238851862869, -0.042153659395073526, -0.2831268937639842,
          -0.45350302457517916, -0.1028723396061054, -0.07397044924593123,
          -0.0570475113901078, 0.0768347063429139, -0.23799740773950687,
          0.18968778535023115, -0.20807266485699835, -0.20266656958660503,
          -0.3674188754063972, 0.36307653301071374, -0.11767327119504069,
          0.654100938607695, 0.6345947017029985, -0.11861556901472078,
          -0.3695740620226069, -0.09714607262586365, -0.163885127976429,
          -0.040639901406059796, -0.29486309869554084, -0.39232322344800913,
          -0.09111010853050917, -0.0892116516635309, -0.12442588910966469,
          0.07280854196072876, -0.2736034248713276, 0.2051472899391263,
          -0.005348529165802091, -0.06937905143350596, -0.2841712897187147,
          0.30091214098813895, 0.1028676978134303, 0.4315632815686761,
          0.5672875667030042, -0.11321453828414509, -0.255592293294703,
          0.1521016034718703, -0.09374136874856061, -0.10219683016137052,
          0.07750254152856552, 0.012897737616475302, -0.12186825644928845,
          -0.26382265370202224, -0.0634104385041224, 0.03752142585044391,
          0.08122163545125442, 0.11922253058884723, -0.11626775689078074,
          -0.17834199967107514, -0.22103713656848356, 0.2547781890083893,
          -0.019188039329363436, 0.48776959507870404, 0.596042168419229,
          -0.17770306323155033, -0.2210631950474228, 0.09317023155365997,
          -0.13037482991676, -0.12274865587705616, -0.17821501063230044,
          -0.08732970939339958, -0.19956642766976682, -0.35681725108298573,
          -0.048319045915196805, -0.007704957522442227, -0.06194061854536884
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

