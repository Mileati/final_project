here::i_am("scripts/table_creation.R")
heart_data <- read.csv(here::here("data/heart.csv"))
library(here)
library(dplyr)
library(tableone)
library(kableExtra)

heart_data_recategorized <- heart_data %>%
  mutate(
    sex = factor(sex, levels = c(0, 1), labels = c("Male", "Female")),
    cp = factor(cp, levels = c(0, 1, 2, 3), 
                labels = c("Typical Angina", "Atypical Angina", 
                           "Non-Anginal Pain", "Asymptomatic")),
    fbs = factor(fbs, levels = c(0, 1), labels = c("No", "Yes")),
    restecg= factor(restecg, levels= c(0,1,2), labels= c( "Normal", "Abnormal", "Probable Abnormality")),
    exang= factor(exang, levels= c(0, 1), labels= c("No", "Yes")),
    target = factor(target, levels = c(0, 1), 
                    labels = c("No Disease", "Disease"))
  )

saveRDS(
  heart_data_recategorized,
  file = here::here("output/clean_recategorized_data.rds")
)

# Rename variables with more meaningful names

variable_labels <- c(
  age = "Age",
  sex = "Sex",
  cp = "Chest Pain Type",
  trestbps = "Resting Blood Pressure (mmHg)",
  chol = "Cholesterol (mg/dL)",
  fbs = "Fasting Blood Sugar > 120 mg/dl",
  thalach = "Maximum Heart Rate Achieved",
  exang = "Exercise Induced Angina"
)

# Assign descriptive names to the variables
heart_data_relabeled <- heart_data_recategorized  %>%
  rename_with(~ variable_labels[.], .cols = names(variable_labels))

vars <- c("Age", "Sex", "Chest Pain Type", "Resting Blood Pressure (mmHg)", "Cholesterol (mg/dL)", "Fasting Blood Sugar > 120 mg/dl", "Maximum Heart Rate Achieved", "Exercise Induced Angina")

table1 <- CreateTableOne(
  data = heart_data_relabeled,
  strata = "target",
  vars = vars,
  test=FALSE
)
# Format and display the table with `kableExtra`
formatted_table <- print(
  table1,
  showAllLevels = TRUE,
  printToggle = FALSE
)

heart_data_summarized_table<- kbl(formatted_table, caption = "Summary Table: Heart Disease Analysis") %>%
  kable_styling(full_width = FALSE, bootstrap_options = c("striped", "hover")) %>%
  add_header_above(c("Variable" = 1, "Summary Statistics by Target" = 3))

print(heart_data_summarized_table)

saveRDS(
  heart_data_summarized_table,
  file = here::here("output/summary_table.rds")
)









