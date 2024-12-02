here::i_am("codes/render.R")

library(rmarkdown)
render(
  here::here("report.Rmd"),
  knit_root_dir = here::here()
)