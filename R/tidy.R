#' Tidy the TB dashboard
#' 
#' `tidy_tb_dashboard()` tidies the messy TB dashboard read by
#' [read_tb_dashboard()]. The messy data combines both time series and fixed
#' data so a flag is provided to select the type of data that should be
#' returned, with a shared 'country' primary key.
#' 
#' @param data Input data set. Must come from [read_tb_dashboard()].
#' @param type Flag to indicate whether time series or fixed data should be 
#'    returned. Defaults to `time_series`.
#' @returns A tibble
#' @seealso [read_tb_dashboard()]
#' @examples 
#' \dontrun{
#' # Returns the time series data by default
#' tidy_tb_dashboard()
#' 
#' # Return fixed data
#' # tidy_tb_dashboard(time_series = FALSE)
#' }
#' @export 
tidy_tb_dashboard <- function(data, type = c("time_series", "fixed")) {

  type <- match.arg(type)

  data_sliced <- data |>
    dplyr::slice(3:32)

  data_select_cols <- data_sliced |>
    dplyr::select(
      country = Country,
      tb_incidence_per_100k_2015 = ...3,
      tb_incidence_per_100k_2016 = ...4,
      tb_incidence_per_100k_2017 = ...5,
      tb_incidence_per_100k_2018 = ...6,
      tb_incidence_per_100k_2019 = ...7,
      tb_incidence_per_100k_2020 = ...8,
      who_hbc = `WHO HBC`,
      population_million_2015 = ...11,
      population_million_2016 = ...12,
      population_million_2017 = ...13,
      population_million_2018 = ...14,
      population_million_2019 = ...15,
      population_million_2020 = ...16,
      rate_tb_case_detection_2015 = ...20,
      rate_tb_case_detection_2016 = ...21,
      rate_tb_case_detection_2017 = ...22,
      rate_tb_case_detection_2018 = ...23,
      rate_tb_case_detection_2019 = ...24,
      rate_tb_case_detection_2020 = ...24,
      rate_tested_with_rapid_dx = `%age tested with rapid Dx`,
      rate_bacteriologically_tested_2015 = ...34,
      rate_bacteriologically_tested_2016 = ...35,
      rate_bacteriologically_tested_2017 = ...36,
      rate_bacteriologically_tested_2018 = ...37,
      rate_bacteriologically_tested_2019 = ...38,
      rate_bacteriologically_tested_2020 = ...39,
      rate_dx_gap = `Dx Gap`,
      tb_screening_algorithm = `Screening algorithm for TB`,
      diagnostic_algorithm = `Diagnostic algorithm`,
      molecular_tests_mwrds = `Molecular tests`,
      antigen_tests_urine_lam = `Antigen tests`,
      smear_zn = Smear,
      smear_led_fm = ...49,
      culture_solid = `Culture and DST`,
      culture_liquid = ...51,
      culture_dst_fl = ...52,
      culture_dst_sl = ...53,
      labs_performing_smear_tests_2015 = `Test volumes (to be added from WHO files)`,
      labs_performing_smear_tests_2016 = ...66,
      labs_performing_smear_tests_2017 = ...67,
      labs_performing_smear_tests_2018 = ...68,
      labs_performing_smear_tests_2019 = ...69,
      labs_performing_smear_tests_2020 = ...70,
      labs_performing_xpert_tests_2015 = ...71,
      labs_performing_xpert_tests_2016 = ...72,
      labs_performing_xpert_tests_2017 = ...73,
      labs_performing_xpert_tests_2018 = ...74,
      labs_performing_xpert_tests_2019 = ...75,
      labs_performing_xpert_tests_2020 = ...76,
      labs_performing_culture_tests_liquid_2015 = ...77,
      labs_performing_culture_tests_liquid_2016 = ...78,
      labs_performing_culture_tests_liquid_2017 = ...79,
      labs_performing_culture_tests_liquid_2018 = ...80,
      labs_performing_culture_tests_liquid_2019 = ...81,
      labs_performing_culture_tests_liquid_2020 = ...82,
      labs_performing_dst_2015 = ...83,
      labs_performing_dst_2016 = ...84,
      labs_performing_dst_2017 = ...85,
      labs_performing_dst_2018 = ...86,
      labs_performing_dst_2019 = ...87,
      labs_performing_dst_2020 = ...88
    )

  data_format_population <- data_select_cols |>
    dplyr::mutate(
      across(
        tidyselect::starts_with("population"),
        ~ stringr::str_extract(.x, "^\\d+")
      )
    )

  # The labs_performing_* cols store missing values as "-" which are coerced to
  # NA's. This is the desired behaviour so the warnings are supressed.
  data_format_col_types <- data_format_population |>
    dplyr::mutate(
      across(
        c(
          tidyselect::starts_with("population"),
          tb_incidence_per_100k_2015,
          rate_tb_case_detection_2015,
          labs_performing_smear_tests_2015,
          labs_performing_xpert_tests_2015,
          labs_performing_xpert_tests_2020,
          labs_performing_culture_tests_liquid_2015,
          labs_performing_dst_2015,
          labs_performing_dst_2017,
          labs_performing_dst_2019,
          labs_performing_dst_2020
        ),
        as.double
      )
    ) |>
    suppressWarnings()

  data_format_rates <- data_format_col_types |>
    dplyr::mutate(
      across(
        tidyselect::starts_with("rate_tb_case_detection"),
        ~ .x / 100
      )
    )

  data_format_incorrect_cell_entries <- data_format_rates |>
    dplyr::mutate(
      smear_zn = dplyr::if_else(smear_zn == "Yess", "Yes", smear_zn),
      culture_solid = dplyr::if_else(culture_solid == "`Yes", "Yes", culture_solid)
    )

  data_harmonise <- data_format_incorrect_cell_entries |>
    dplyr::mutate(
      dplyr::across(
        tidyselect::starts_with("population_million"),
        ~ .x * 10
      )
    ) |>
    dplyr::rename_with(
      ~ stringr::str_replace(.x, "million", "100k")
    )

  if (type == "time_series") {
    data_harmonise |>
      dplyr::select(country, tidyselect::matches("\\d+$")) |>
      tidyr::pivot_longer(
        cols = !country,
        names_to = c("indicator", "year"),
        names_pattern = "(.*)_(\\d+)",
        names_transform = list(year = as.integer),
        values_to = "value"
      )
  } else {
    data_harmonise |>
      dplyr::select(country, !tidyselect::matches("\\d+$"))
  }
}

tidy_hbc <- function(data) {
  data |>
    dplyr::slice(1:30) |>
    dplyr::transmute(
      country = text,
      year = 2021,
      share_global_tb_incidence = c(rep(84, 20), rep(3, 10))
    )
}

tidy_gf_procurement <- function(data) {
  data |>
    dplyr::rename_with(.fn = stringr::str_to_lower) |>
    dplyr::rename(
      country_territory = `country/teritorry`,
      grant_name = `grant name`,
      supplier_agent_manufacturer_intermediary =
        `supplier/agent/manufacturer/intermediatry`,
      product_category = `product category`,
      product_pack = `product pack`,
      pack_quantity = `pack quantity`,
      product_pack_unit_price_usd = `product pack (usd)`,
      total_product_cost_usd = `total product cost (usd)`,
      purchase_order_date = `purchase order date`,
      scheduled_delivery_date = `scheduled delivery date`,
      actual_delivery_date = `actual delivery date`,
      number_of_suom_in_pack = `nb of suom in pack`,
      some_or_all_of_goods_prepaid = `some or all of goods prepaid`,
      freight_cost = `freight cost`,
      supplier_invoice_number = `supplier invoice number`,
      purchase_order_number = `purchase order number`,
      invoice_currency_name = `invoice currency name`,
      primary_key = `primary key`,
    ) |>
    dplyr::mutate(
      dplyr::across(
        tidyselect::ends_with("usd"),
        ~ as.numeric(stringr::str_remove_all(.x, "^\\$|\\,"))
      ),
      dplyr::across(
        tidyselect::matches("purchase_order_date|actual_delivery_date"),
        ~ lubridate::as_date(.x, format = "%d-%m-%y")
      ),
      scheduled_delivery_date = lubridate::as_date(
        scheduled_delivery_date,
        format = "%m/%d/%y"
      ),
      product_pack = stringr::str_to_lower(product_pack),
      product_pack_count = as.integer(
        stringr::str_extract(product_pack, "^\\d+")
      ),
      product_pack_unit = stringr::str_squish(
        stringr::str_extract(product_pack, "[^0-9]*$" )
      ),
      total_numb_device = pack_quantity * number_of_suom_in_pack
    )
}

tidy_masterlist <- function(data, data_source = "who") {
  data_source <- rlang::arg_match(data_source, c("who", "world_bank", "global_fund"))
  data |>
    dplyr::mutate(
      dataset = stringr::str_to_lower(dataset),
      dataset = stringr::str_replace_all(dataset, "\\s", "_"),
      data_source = stringr::str_to_lower(data_source),
      data_source = stringr::str_replace(data_source, "\\s|\\\\", "_"),
      variable_name = stringr::str_to_lower(variable_name),
      variable_name = stringr::str_remove_all(variable_name, "\\(|\\)"),
      variable_name = stringr::str_replace_all(variable_name, "\\s|\\/", "_"),
    ) |>
    dplyr::filter(data_source == !!data_source) |>
    dplyr::left_join(
      who_url_endpoints,
      dplyr::join_by(dataset)
    ) |>
    dplyr::relocate(url_endpoint, .after = dataset)
}

tidy_who <- function(data) {
  cond_notifications <- is_ptype(data, ptype_who_notifications)
  # TODO:
  # cond_community <- is_ptype(data, ptype_who_community)
  cond_budget <- is_ptype(data, ptype_who_budget)
  # cond_estimates <- is_ptype(data, ptype_who_estimates)
  # cond_expenditure <- is_ptype(data, ptype_who_expenditure)
  # cond_labs <- is_ptype(data, ptype_who_labs)

  if (cond_notifications) {
    tidy_who_notifications(data)
  } else if (cond_budget) {
    tidy_who_budget(data)
  } else {
    rlang::abort("Unknown ptype.")
  }
}


tidy_who_notifications <- function(data) {
  data |>
    dplyr::select(-download_date)
}

tidy_who_budget <- function(data) {
  data |>
    dplyr::select(-download_date)
}
