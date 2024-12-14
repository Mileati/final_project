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


## Within the report folder

`report`
      -Contains:
          -an HTML file will be automated after following the instructions
          -Introduction: Overview of the analysis and objectives.
          -Data Summary: Insights and visualizations from the summary table.
          -Logistic Regression Results: Model summary, significant predictors, and predictive performance.
          -Conclusion: Key findings and implications.
         


## within the output folder 
      -cleaned and recategorized dataset that is drived from the original dataset will be found
      -output of the full logistic model 
      -Output in table format, odds ratio, p_values 
      - ROC curve 
      - summary table are found 
 
## How to Reproduce the Analysis

Prerequisites:
R and RStudio installed.

forking and cloning

Go to my github and the specific repo called final_project under the link provided below
https://github.com/Mileati/final_project

you can fork this repository into your github

Then open r in rstudio

On the terminal type:  
git clone https://github.com/YOUR_USERNAME/REPOSITORY_NAME.git

This will download your github repository into your local computer

Make sure your terminal is on the project root directory then type make to get the final report


Instruction on how to produce report from a containerized environment 

docker build -t project_image .
Type for mac users:
docker run -v $(pwd)/report:final_project/report project_image

Type for windows users:
docker run -v /$(pwd)/report:final_project/report project_image

If there is a space in your filepath please type "(pwd)"  instead 


From dockerhub

docker pull mileati/project_image

for mac users: 
docker run -v $(pwd)/report:final_project/report mileati/project_image:latest

for window:
docker run -v /$(pwd)/report:final_project/report mileati/project_image:latest









