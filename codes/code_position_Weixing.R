# This is the code for analyzing positions for Weixing Li
here::i_am("report.Rmd")


library(ggplot2)
library(dplyr)


nba_data <- read.csv(file = here::here("data/raw_data/nba_2024-10-28.csv"))

head(nba_data)


nba_cleaned <- nba_data %>%
  filter(!is.na(free_throw_pct)) %>%
  select(position, free_throw_pct)


average_free_throw <- nba_cleaned %>%
  group_by(position) %>%
  summarize(avg_free_throw = mean(free_throw_pct, na.rm = TRUE))


avg_bar <- ggplot(average_free_throw, aes(x = position, y = avg_free_throw, fill = position)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Average Free Throw Percentage by Player Position",
    x = "Position",
    y = "Average Free Throw Percentage"
  ) +
  theme_minimal()


boxplot_position <- ggplot(nba_cleaned, aes(x = position, y = free_throw_pct, fill = position)) +
  geom_boxplot() +
  labs(
    title = "Free Throw Percentage Distribution by Player Position",
    x = "Position",
    y = "Free Throw Percentage"
  ) +
  theme_minimal()


output_path <- here::here("output/figures")
bar_plot_name <- paste0("nba_position_bar", ".rds")
box_plot_name <- paste0("nba_position_box", ".rds")
# save data
saveRDS(avg_bar, file = file.path(output_path, bar_plot_name))
saveRDS(boxplot_position, file = file.path(output_path, box_plot_name))



