read_gf_procurement <- function(file_name, data_dir = Sys.getenv("FINDTB_DATADIR")) {
  file_path <- compose_file_path(file_name = file_name, data_dir = data_dir)
  readr::read_tsv(
    file_path,
    locale = readr::locale(encoding = "UTF-16LE"),
    show_col_types = FALSE
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
    ) |>
    dplyr::mutate(
      country_code = suppressWarnings(
        countrycode::countrycode(
        country_territory,
        origin = "country.name",
        dest = "iso3c"
      )
    )
  )
}