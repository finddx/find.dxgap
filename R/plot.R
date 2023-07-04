#' Plot time series
#'
#' `plot_tb_ts()` renders a time series for given indicator, years and countries
#' chosen by the user. Input data for the time series are returned by
#' `read_tb_dashboard()` and `tidy_tb_dashboard()`.
#'
#' @param metric A character of length one of the indicator to display.
#' @param years A numeric vector for the years of the time series.
#' @param countries A character vector with country names to display.
#'
#' @return A plot.
#' @seealso [read_tb_dashboard()]
#' @seealso [tidy_tb_dashboard()]
#' @export
#'
#' @examples
#' \dontrun{
#' plot_tb_ts()
#' }
plot_tb_ts <- function(metric = "tb_incidence_per_100k",
                       years = seq(2015, 2020),
                       countries = c("Angola", "Brazil", "Zambia")) {

  stopifnot(is.character(metric) && length(metric) == 1)
  metric <- rlang::arg_match(metric, values = tb_constants$indicator_ts)

  years <- sort(years)
  stopifnot(length(years) > 1)

  stopifnot(is.character(countries))
  countries <- rlang::arg_match(
    countries,
    tb_constants$country,
    multiple = TRUE
  )

  tb_df <- read_tidy_tb(type = "time_series")

  first_last_df <-
    tb_df |>
    dplyr::filter(year %in% years & country %in% countries & indicator == metric)

  labels_df <-
    first_last_df |>
    dplyr::filter(year == max(year)) |>
    dplyr::select(country, year, value)

  first_last_df |>
    ggplot2::ggplot(ggplot2::aes(year, value, group = country)) +
    ggplot2::geom_line(ggplot2::aes(color = country), linewidth = 1.05) +
    ggplot2::geom_text(
      data = labels_df,
      nudge_x = 0.2,
      ggplot2::aes(year, value, label = country)
    ) +
    ggplot2::labs(
      y = metric,
      x = "year",
      title = sprintf("Trend of indicator `%s`", metric),
      subtitle = sprintf("Time range: %d - %d", min(years), max(years)),
      caption = "Source: TB Spreadsheet"
    ) +
    ggplot2::theme_light() +
    ggplot2::theme(
      plot.title = ggplot2::element_text(hjust = 0.5),
      plot.subtitle = ggplot2::element_text(hjust = 0.5),
      legend.position = "none"
    )
}

