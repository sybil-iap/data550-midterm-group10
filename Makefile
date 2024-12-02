report.html: codes/render.R \
	codes/code_team_Anna.R \
	codes/code_player_Wen.R \
	codes/code_position_Weixing.R \
  report.Rmd \
  output/tables/Team_Summary.rds output/figures/Team_Performance.rds \
  output/tables/Top_Players.rds output/figures/player_scatter.rds \
  output/figures/nba_position_bar.rds output/figures/nba_position_box.rds
	Rscript	codes/render.R


output/tables/Team_Summary.rds output/figures/Team_Performance.rds: codes/code_team_Anna.R
	Rscript	codes/code_team_Anna.R


output/tables/Top_Players.rds output/figures/player_scatter.rds: codes/code_player_Wen.R
	Rscript	codes/code_player_Wen.R


output/figures/nba_position_bar.rds output/figures/nba_position_box.rds: codes/code_position_Weixing.R 
	Rscript	codes/code_position_Weixing.R

.PHONY: install
install:
	@echo "Running renv::restore..."
	Rscript -e "renv::restore(prompt = FALSE)"

.PHONY: clean
clean:
	rm -f	output/figures/*.rds output/tables/*.rds report.html