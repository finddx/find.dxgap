signal_superseded <- function(.call,
                              .with,
                              .env = rlang::caller_env()) {
  fn_name <- compose_good_what(.call = .call)
  lifecycle::signal_stage(
    "superseded",
    what = fn_name,
    with = .with,
    env = .env
  )
}

compose_good_what <- function(.call) {
  fn_name <- rlang::call_name(call = .call)
  paste0(fn_name, "()")
}
