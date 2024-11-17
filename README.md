
# NBA Player Statistical Analysis

## Project Description

This project analysis the dataset of the ranking of top NBA players
based on per 36-minute stats as of October 28, 2024.

The project showcases various aspects of performance analysis from the
dataset, customizable by selecting a specific team, or position. By
default, it analyzes team ATL and position PG with a analysis of all
players’ rebounds and total points, but these settings can be easily
adjusted in the config file.

## Intitial Code Description

`codes/code_player_Wen.R`  
- generating analysis of players’ performance by comparing the
rebounding strength of different players, Use summary table of top
players with highest rebounds and scatter plot showing the relationship
between rebounds and total points.

`codes/code_team_Anna.R`  
- generating analysis of the performance of players in a team by
comparing performance metrics (e.g., average points, rebounds) across
different teams. Use box plot to compare average points per game across
teams and team-wise summary table showing average points, rebounds, and
assists.

`codes/code_position_Weixing.R`  
- generate analysis of the differences in free throw accuracy across
player positions. Show bar charts or box plots to compare the average
free throw percentage for each position, helping to see if certain
positions perform better in free throw accuracy than others.

`report.Rmd`  
- generate the final report

## Make report

To build the report, one should first clone the project repository to a
desired location.  
Once the files are in the desired location, one can build the report by
executing `make`.
