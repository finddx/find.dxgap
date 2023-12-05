deprecate_read_tidy <- function(.file_name, .call) {
  fn_name <- compose_good_what(.call = .call)
  lifecycle::deprecate_warn(
    "0.1.1",
    what = fn_name,
    with = "import_tbl()",
    always = FALSE,
    details = sprintf('Call, `import_tbl("%s")`.', .file_name)
  )
}

compose_good_what <- function(.call) {
  fn_name <- rlang::call_name(call = .call)
  paste0(fn_name, "()")
}
