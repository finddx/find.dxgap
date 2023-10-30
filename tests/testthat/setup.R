withr::local_options(
  list(styler.colored_print.vertical = FALSE),
  .local_envir = teardown_env()
)
