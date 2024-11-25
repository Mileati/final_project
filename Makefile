
# Final report depends on the table, analysis, and figure
reports/final_report.html: scripts/table_creation.R scripts/analysis.R scripts/figure_creation.R reports/final_report.Rmd scripts/render_report.R 
	Rscript scripts/render_report.R 
	
	
