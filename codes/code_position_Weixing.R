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


ggplot(average_free_throw, aes(x = position, y = avg_free_throw, fill = position)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Average Free Throw Percentage by Player Position",
    x = "Position",
    y = "Average Free Throw Percentage"
  ) +
  theme_minimal()


ggplot(nba_cleaned, aes(x = position, y = free_throw_pct, fill = position)) +
  geom_boxplot() +
  labs(
    title = "Free Throw Percentage Distribution by Player Position",
    x = "Position",
    y = "Free Throw Percentage"
  ) +
  theme_minimal()


