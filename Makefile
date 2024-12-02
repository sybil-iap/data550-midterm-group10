report.html: codes/render.R \
  report.Rmd \
  output/figures/nba_player_Trae Young.rds \
  output/figures/nba_position_bar.rds \
  output/figures/nba_position_box.rds \
  output/figures/Team_Performance_ATL.rds \
  output/tables/Team_Summary_ATL.rds \
  output/tables/Top Players.rds
	Rscript codes/render.R


output/Team_Performance.rds: code/code_team_Anna.R
	Rscript code/code_team_Anna.R


output/nba_player.rds: code/code_player_Wen.R
	Rscript code/code_player_Wen.R



output/position.rds: code/code_position_Weixing.R 
	Rscript code//code_position_Weixing.R

.PHONY: install
install:
    Rscript -e "renv::restore(prompt = FALSE)"

.PHONY: clean
clean:
	rm -f output/*.rds report.html