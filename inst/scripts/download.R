pkgload::load_all()
notification <- download_who(
  file_name = compose_date_dataset_file_name("who", dataset = "notifications", file_ext = ".csv"),
  dataset = "notification"
)
Sys.sleep(3)
estimates <- download_who(
  file_name = compose_date_dataset_file_name("who", dataset = "estimates", file_ext = ".csv"),
  dataset = "estimates"
)
Sys.sleep(3)
budget <- download_who(
  file_name = compose_date_dataset_file_name("who", dataset = "budget", file_ext = ".csv"),
  dataset = "budget"
)
Sys.sleep(3)
community_engagement <- download_who(
  file_name = compose_date_dataset_file_name("who", dataset = "community", file_ext = ".csv"),
  dataset = "community_engagement"
)
Sys.sleep(3)
expenditure_and_utilisation <- download_who(
  file_name = compose_date_dataset_file_name("who", dataset = "expenditures", file_ext = ".csv"),
  dataset = "expenditure_and_utilisation"
)
Sys.sleep(3)
laboratories <- download_who(
  file_name = compose_date_dataset_file_name("who", dataset = "laboratories", file_ext = ".csv"),
  dataset = "laboratories"
)
