plot_scatter <- function(data, x, y, year, color, title, caption) {
  data |>
    ggplot(aes({{ x }}, {{ y }}, color = {{ color }})) +
    geom_point(alpha = .5, size = .75) +
    geom_smooth(
      aes(colour = {{ color }}),
      linewidth = 0.5,
      method = "lm",
      se = FALSE
    ) +
    theme_minimal() +
    labs(
      x = paste(title, year),
      caption = caption
    )
}

plot_density <- function(data, x, fill, year, title, caption) {
  data |>
    ggplot(aes({{ x }}, fill = {{ fill }})) +
    geom_density(alpha = .5) +
    theme_minimal() +
    labs(
      x = paste(title, year),
      caption = caption
    )
}

plot_corr <- function(data) {
  stopifnot(inherits(data, "cor_df"))
  data |>
    corrr::rplot(print_cor = TRUE) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5))
}
