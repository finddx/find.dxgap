plot_scatter <- function(data, x, y, year, color, title, caption) {
  data |>
    ggplot2::ggplot(ggplot2::aes({{ x }}, {{ y }}, color = {{ color }})) +
    ggplot2::geom_point(alpha = .5, size = .75) +
    ggplot2::geom_smooth(
      ggplot2::aes(colour = {{ color }}),
      linewidth = 0.5,
      method = "lm",
      se = FALSE
    ) +
    ggplot2::scale_y_continuous(labels = scales::label_percent(scale = 1)) +
    ggplot2::theme_minimal() +
    ggplot2::labs(
      x = paste(title, year),
      caption = caption
    )
}

plot_density <- function(data, x, fill, year, title, caption) {
  data |>
    ggplot2::ggplot(ggplot2::aes({{ x }}, fill = {{ fill }})) +
    ggplot2::geom_density(alpha = .5) +
    ggplot2::theme_minimal() +
    ggplot2::labs(
      x = paste(title, year),
      caption = caption
    )
}

plot_corr <- function(data) {
  stopifnot(inherits(data, "cor_df"))
  data_lower <- corrr::shave(data)
  data_lower |>
    corrr::rplot(print_cor = TRUE) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5))
}

plot_coeff_table <- function(data, .title = NULL) {
  if (!is.null(.title)) {
    plot_title <- paste("Parameters from ", .title, " model")
  } else {
    plot_title <- paste("Parameters from model")
  }
  data |>
    ggplot2::ggplot(ggplot2::aes(term, estimate, color = is_under_0.05)) +
    ggplot2::geom_point() +
    ggplot2::geom_pointrange(
      ggplot2::aes(ymin = estimate - std.error, ymax = estimate + std.error)
    ) +
    ggplot2::coord_flip() +
    ggplot2::labs(title = plot_title) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      plot.title = ggplot2::element_text(hjust = 0.5),
      axis.text.y = ggplot2::element_text(size = ggplot2::rel(1.25))
    )
}
