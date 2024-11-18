# This is the code for analyzing a team for Anna Chen
# Indicate the location of this script
here::i_am("report.Rmd")

# Load required libraries
library(dplyr)
library(ggplot2)
library(yaml)
library(here)

# Configuration YAML for team analysis
config_yaml <- "
default_team: 'ATL'
top_n_players: 10
"

config <- yaml::yaml.load(config_yaml)

print(config$default_team)
print(config$top_n_players)

# Load NBA dataset
nba_data <- read.csv(here::here("data/raw_data/nba_2024-10-28.csv"))

# Filter data for the default team
team_data <- nba_data %>%
  filter(team == config$default_team)

# Generate a summary table for average points, rebounds, and assists
team_summary <- team_data %>%
  summarise(
    Average_Points = mean(pts, na.rm = TRUE),
    Average_Rebounds = mean(rebounds_total, na.rm = TRUE),
    Average_Assists = mean(assists, na.rm = TRUE)
  )

print("Team Summary:")
print(team_summary)

# Save the summary table as an RDS file
output_path <- here::here("output/tables")
summary_filename <- paste0("Team_Summary_", config$default_team, ".rds")
saveRDS(team_summary, file = file.path(output_path, summary_filename))

# Create a box plot for average points, rebounds, and assists
team_data_long <- team_data %>%
  select(player, pts, rebounds_total, assists) %>%
  pivot_longer(cols = c(pts, rebounds_total, assists),
               names_to = "Metric", values_to = "Value")

boxplot <- ggplot(team_data_long, aes(x = Metric, y = Value, fill = Metric)) +
  geom_boxplot() +
  labs(title = paste("Performance Metrics for Team", config$default_team),
       x = "Metric",
       y = "Value") +
  theme_minimal()

# Display the box plot
print(boxplot)

# Save the box plot as an RDS file
output_path_figures <- here::here("output/figures")
boxplot_filename <- paste0("Team_Performance_", config$default_team, ".rds")
saveRDS(boxplot, file = file.path(output_path_figures, boxplot_filename))
