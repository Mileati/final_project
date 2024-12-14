
here::i_am(
  "scripts/render_report.R"
)

rmarkdown::render(
  here::here("final_report.Rmd")
)