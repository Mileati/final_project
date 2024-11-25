here::i_am(
  "scripts/render_report.R"
)

rmarkdown::render(
  here::here("reports/final_report.Rmd")
)