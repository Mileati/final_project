# Final report associated rules (run on a docker)
final_report.html: scripts/render_report.R final_report.Rmd output/summary_table.rds \
  output/glm_heart_disease_table.rds output/roc_curve.png
	Rscript scripts/render_report.R 

output/clean_recategorized_data.rds: scripts/table_creation.R data/heart.csv
	Rscript scripts/table_creation.R

output/summary_table.rds: scripts/table_creation.R output/clean_recategorized_data.rds
	Rscript scripts/table_creation.R
	
output/glm_heart_disease_table.rds: scripts/analysis.R output/clean_recategorized_data.rds
	Rscript scripts/analysis.R

output/roc_curve.png: scripts/figure_creation.R output/clean_recategorized_data.rds
	Rscript scripts/figure_creation.R


.PHONY:	clean
clean:
	rm -f output/* && rm -f report/*.html
	
