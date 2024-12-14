library(pROC)
library(dplyr)
here::i_am("scripts/figure_creation.R")

recategorized_heart_data <- readRDS(
  file = here::here("output/clean_recategorized_data.rds")
)

heart_data_target_num <- recategorized_heart_data|>
  mutate(target=ifelse(target=="Disease", 1, 0))


glm_heart_disease_full <- glm(
  factor(target) ~ age + sex + cp + trestbps + thalach + exang,
  data = heart_data_target_num, family = binomial()
)

# from the full model, we have seen age was has a p_value >0.05, therefore we will develop a model without it and compare performance
glm_heart_disease_without_age <- glm(
  factor(target) ~sex + cp + trestbps + thalach + exang,
  data = heart_data_target_num, family = binomial()
)

# Predicted probabilities
pred_full <- predict(glm_heart_disease_full, type = "response")
pred_without_age <- predict(glm_heart_disease_without_age, type = "response")

auc_full <- roc(heart_data_target_num$target, pred_full, quiet = TRUE)$auc
auc_without_age <- roc(heart_data_target_num$target, pred_without_age, quiet = TRUE)$auc


# Generate ROC objects
roc_full <- roc(heart_data_target_num$target, pred_full, quiet = TRUE)
roc_without_age <- roc(heart_data_target_num$target, pred_without_age, quiet = TRUE)

# Plot the ROC curves
png("output/roc_curve.png", width = 800, height = 600)  # Open PNG device
plot(roc_full, col = "blue", lwd = 2, main = "ROC Curves for Logistic Regression Models to Predict Heart Disease")
lines(roc_without_age, col = "red", lwd = 2)

# Add legends to the plot
legend("bottomright", legend = c("Full Model", "Without Age"), col = c("blue", "red"), lwd = 2)
legend("bottomright", 
       legend = c(paste("Full Model AUC =", round(auc_full, 2)), 
                  paste("Without Age AUC =", round(auc_without_age, 2))), 
       col = c("blue", "red"), lwd = 2)

# Close the device to save the plot
dev.off()



