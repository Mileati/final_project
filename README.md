# Final project 

-- Primary Goal 
This project focuses on analyzing heart disease data to generate a summary of patient characteristics and develop a logistic regression model to predict the likelihood of heart disease (Yes/No) based on various predictors.

The goal is to demonstrate data analysis and modeling techniques while ensuring reproducibility and clarity through an organized project structure.

## Within the data folder

 `data/heart_csv`  
      - contains heart data
      
 `data/data_description` 
      - contains data dictionary 

##  Within the script folder:

 `scripts/table_creation.R`
      -Generates a summary table of patient characteristics, stratified by heart disease status.
      
`scripts/analysis.R`
      -Performs initial data cleaning and exploration.
      -Checks for missing values, outliers, and overall data structure.

`scripts/figure_creation.R`
      -Fits two logistic regression model(full and reduced) to predict heart disease 
      - In the full model all predictors that were used in the analysis part will be included 
      - Reduced we will only contain predictors that were found to be significant 
      -ROC curve with AUC will be generated to compare the performance of the two models 


## Within the reports folder

`reports/final_report.Rmd`
      -Contains:
          -Introduction: Overview of the analysis and objectives.
          -Data Summary: Insights and visualizations from the summary table.
          -Logistic Regression Results: Model summary, significant predictors, and predictive performance.
          -Conclusion: Key findings and implications.
          -The report can be rendered into HTML using the Makefile.


## within the output folder 
      -cleaned and recategorized dataset that is drived from the original dataset will be found
      -output of the full logistic model 
      -Output in table format, odds ratio, p_values and 95% CI 
      - ROC curve 
      - summary table are found 
 
## How to Reproduce the Analysis

Prerequisites:
R and RStudio installed.

forking and cloning

Go to my github and the specific repo called final_project under the link provided below
https://github.com/Mileati/final_project

you can fork this repository into your github

Then open your r in rstudio

On the terminal type:  
git clone https://github.com/YOUR_USERNAME/REPOSITORY_NAME.git

This will download your github repository into your local computer

Make sure your terminal is on the project root directory then type make to get the final report
















