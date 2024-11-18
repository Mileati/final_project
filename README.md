
This project focuses on analyzing heart disease data to generate a summary of patient characteristics and develop a logistic regression model to predict the likelihood of heart disease (Yes/No) based on various predictors.

The goal is to demonstrate data analysis and modeling techniques while ensuring reproducibility and clarity through an organized project structure.

Within the script folder:

1. analysis.R
Performs initial data cleaning and exploration.
Checks for missing values, outliers, and overall data structure.

2. table_creation.R
Generates a summary table of patient characteristics, stratified by heart disease status (Yes/No).

3. model_creation.R
Fits a logistic regression model to predict heart disease (target) using predictors such as age, sex, chol, thalach, and others.
Outputs model coefficients, standard errors, p-values, and model diagnostics.


Within the reports folder

final_report.Rmd

This R Markdown file contains:
Introduction: Overview of the analysis and objectives.
Data Summary: Insights and visualizations from the summary table.
Logistic Regression Results: Model summary, interpretation of predictors, and predictive performance.
Conclusion: Key findings and implications.
The report can be rendered into HTML using the Makefile.

How to Reproduce the Analysis

Prerequisites:
R and RStudio installed.
Required R packages:

Clone the repository
Install the necessary packages in R
Run the Makefile to generate the report


