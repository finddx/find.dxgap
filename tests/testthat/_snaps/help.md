# is_significant() works

    Code
      constructive::construct(mutate_is_significant(p_value_df, 0.25), constructive::opts_tbl_df(
        constructor = "tribble"))
    Output
      tibble::tribble(
        ~p.value, ~is_under_0.25,
        0.416,    "FALSE",
        -0.483,   "TRUE",
        -1.375,   "TRUE",
        0.314,    "FALSE",
        -0.133,   "TRUE",
        1.591,    "FALSE",
        -0.414,   "TRUE",
        1.502,    "FALSE",
        0.101,    "TRUE",
        0.032,    "TRUE",
      )

---

    Code
      constructive::construct(mutate_is_significant(p_value_df, 0.5), constructive::opts_tbl_df(
        constructor = "tribble"))
    Output
      tibble::tribble(
        ~p.value, ~is_under_0.5,
        0.416,    "TRUE",
        -0.483,   "TRUE",
        -1.375,   "TRUE",
        0.314,    "TRUE",
        -0.133,   "TRUE",
        1.591,    "FALSE",
        -0.414,   "TRUE",
        1.502,    "FALSE",
        0.101,    "TRUE",
        0.032,    "TRUE",
      )

