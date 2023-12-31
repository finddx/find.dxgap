pkgload::load_all()
notification <- download_who(
  file_name = paste_dataset_name_date("who", dataset = "notifications", file_ext = ".csv"),
  url_endpoint = "notifications"
)
Sys.sleep(3)
estimates <- download_who(
  file_name = paste_dataset_name_date("who", dataset = "estimates", file_ext = ".csv"),
  url_endpoint = "estimates"
)
Sys.sleep(3)
budget <- download_who(
  file_name = paste_dataset_name_date("who", dataset = "budget", file_ext = ".csv"),
  url_endpoint = "budget"
)
Sys.sleep(3)
community_engagement <- download_who(
  file_name = paste_dataset_name_date("who", dataset = "community", file_ext = ".csv"),
  url_endpoint = "community"
)
Sys.sleep(3)
expenditure_and_utilisation <- download_who(
  file_name = paste_dataset_name_date("who", dataset = "expenditures", file_ext = ".csv"),
  url_endpoint = "expenditure_utilisation"
)
Sys.sleep(3)
laboratories <- download_who(
  file_name = paste_dataset_name_date("who", dataset = "laboratories", file_ext = ".csv"),
  url_endpoint = "labs"
)
Sys.sleep(3)
pop_urban <- download_wb(
  file_name = paste_dataset_name_date("wb", dataset = "pop_urban", file_ext = ".csv"),
  indicator = "SP.URB.TOTL.IN.ZS"
  )
Sys.sleep(3)
pop_density <-
  download_wb(
    file_name = paste_dataset_name_date("wb", dataset = "pop_density", file_ext = ".csv"),
    indicator = "EN.POP.DNST"
  )
Sys.sleep(3)
pop_total <- download_wb(
  file_name = paste_dataset_name_date("wb", dataset = "pop_total", file_ext = ".csv"),
  indicator = "SP.POP.TOTL"
  )
Sys.sleep(3)
gdp <- download_wb(
  file_name = paste_dataset_name_date("wb", dataset = "gdp", file_ext = ".csv"),
  indicator = "NY.GDP.MKTP.CD"
)
