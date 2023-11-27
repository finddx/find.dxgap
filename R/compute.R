compute_completion_rate <- function(data, id_vars, digits = 2) {
  data |>
    dplyr::mutate(dplyr::across(tidyselect::everything(), as.character)) |>
    tidyr::pivot_longer(-all_of(id_vars)) |>
    dplyr::mutate(is_na = is.na(value)) |>
    dplyr::count(!!!rlang::syms(id_vars), name, is_na) |>
    dplyr::group_by(!!!rlang::syms(id_vars), name) |>
    dplyr::mutate(tot = sum(n)) |>
    dplyr::ungroup() |>
    dplyr::mutate(completion_rate = signif(n / tot, digits = digits)) |>
    dplyr::filter(!is_na) |>
    dplyr::select(!!id_vars, var_name = name, completion_rate)
}

