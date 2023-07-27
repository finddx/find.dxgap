check_ptype <- function(data, ptype) {
  sym_ptype <- rlang::ensym(ptype)
  sym_data <- rlang::ensym(data)
  rlang::try_fetch(
    expr = vctrs::vec_assert(data, ptype),
    error = function(err) {
      main_msg <- "%s does not match output provided by %s"
      msg <- sprintf(
        main_msg,
        rlang::as_string(sym_data),
        rlang::as_string(sym_ptype)
      )
      rlang::abort(msg, parent = err, class = "findtb_wrong_raw_data")
    }
  )
}

is_ptype <- function(data, ptype) {
  rlang::try_fetch(
    error = function(cnd) FALSE,
    {
      check_ptype(data, ptype)
      TRUE
    }
  )
}
