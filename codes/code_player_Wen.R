# This is the code for analyzing players for Wen Song

here::i_am("report.Rmd")

# load library
library(dplyr)
library(ggplot2)
library(yaml)
library(here)


config <- yaml::yaml.load_file(here::here("config.yaml"))

print(config$default_player)
print(config$default_team)
print(config$default_position)
print(config$top_n_rebounders)

# load data
nba_data <- read.csv(here::here("data/raw_data/nba_2024-10-28.csv"))

# default player data
specific_player_data <- nba_data %>%
  filter(player == config$default_player, team == config$default_team, position == config$default_position)

# display
specific_player_data

#  N top rebounders
top_rebounders <- nba_data %>%
  arrange(desc(rebounds_total)) %>%
  head(config$top_n_rebounders) %>%
  select(player, team, position, rebounds_total, pts)

# display table
knitr::kable(top_rebounders, caption = "Top Players by Total Rebounds")

output_path <- here::here("output/tables")
top_filename <- paste0("Top Players", ".rds")

# save data
saveRDS(top_rebounders, file = file.path(output_path, top_filename))

nba_data_clean <- specific_player_data %>%
  filter(!is.na(rebounds_total), !is.na(pts))

# scatterplot
scatterplot <- ggplot(nba_data_clean) +
  geom_point(aes(x = rebounds_total, y = pts, color = "Total Rebounds"), size = 3, alpha = 0.7) +
  geom_point(aes(x = rebounds_offensive, y = pts, color = "Offensive Rebounds"), size = 3, alpha = 0.7) +
  geom_point(aes(x = rebounds_defensive, y = pts, color = "Defensive Rebounds"), size = 3, alpha = 0.7) +
  labs(title = paste("Relationship between Rebounds and Points for", config$default_player),
       x = "Rebounds",
       y = "Total Points",
       color = "Rebound Type") +
  scale_color_manual(values = c("Total Rebounds" = "blue", "Offensive Rebounds" = "red", "Defensive Rebounds" = "green")) +
  theme_minimal()
scatterplot

#update name of object that depends on parameter value
nba_filename <- paste0(
  "nba_player",
  config$player,".rds")

output_path <- here::here("output/figures")
nba_filename <- paste0("nba_player_", config$default_player, ".rds")

# save data
saveRDS(scatterplot, file = file.path(output_path, nba_filename))
