library(dplyr)

here::i_am("scripts/analysis.R")
heart_data_recategorized <- readRDS(here::here("output/clean_recategorized_data.rds"))

heart_data_target_num <- heart_data_recategorized |>
  mutate(target=ifelse(target=="Disease", 1, 0))

library(gtsummary)
glm_heart_disease <- glm(
  factor(target) ~ age + sex + cp + trestbps + thalach + exang,
  data = heart_data_target_num, family = binomial()
)

glm_heart_disease_table<- 
  tbl_regression(glm_heart_disease, exponentiate = TRUE) |>
  add_global_p()


saveRDS(
  glm_heart_disease_table,
  file = here::here("output/glm_heart_disease_table.rds")
)

