report.html: codes/render.R \
	codes/code_team_Anna.R \
	codes/code_player_Wen.R \
	codes/code_position_Weixing.R \
  report.Rmd \
  output/figures/%.rds \
  output/tables/%.rds \
	Rscript	codes/render.R


output/%.rds: code/code_team_Anna.R
	Rscript	code/code_team_Anna.R


output/%.rds: code/code_player_Wen.R
	Rscript	code/code_player_Wen.R


output/%.rds: code/code_position_Weixing.R 
	Rscript	code/code_position_Weixing.R

.PHONY: install
install:
	@echo "Running renv::restore..."
	Rscript -e "renv::restore(prompt = FALSE)"

.PHONY: clean
clean:
	rm -f	output/*.rds report.html