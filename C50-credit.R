install.packages("C50")
library(C50)
library(gmodels)
credit <- read.csv("credit.csv")
credit_train$default <- as.factor(credit_train$default)
set.seed(123)
train_sample <- sample(1000,900)
credit_train <- credit[train_sample,]
credit_test <- credit[-train_sample,]
credit_model <- C5.0(x = credit_train[-17],credit_train$default)
credit_pred <- predict(credit_model,credit_test)
CrossTable(credit_test$default,credit_pred,prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,
           dnn = c('actual default', 'predicted default'))


credit_boost <- C5.0(x = credit_train[-17],credit_train$default,trials =10)
credit_pred_boost <- predict(credit_boost,credit_test)
CrossTable(credit_test$default,credit_pred_boost,prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,
           dnn = c('actual default', 'predicted default'))


