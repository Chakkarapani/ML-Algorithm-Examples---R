# Example : This simple R Program demonstrates the use of LOGISTIC regression model.
# This uses the sample dataset (mtcars) provided in R.
# Author : Chakkarapani Vijayakumar


# STEP : 1
# IMPORT THE SAMPLE DATA SET MTCARS COMES DEFAULT IN R.

data("mtcars")

# Contains several basic utility functions including: 
# moving (rolling, running) window statistic functions, 
# read/write for GIF and ENVI binary files, fast calculation of AUC, 
# LogitBoost classifier, base64 encoder/decoder, round-off-error-free sum and cumsum, etc.

library(caTools)

# SPLITING THE DATA INTO TRAINING SET AND TESTING SET

split <- sample.split(mtcars,SplitRatio = 0.7)

training <- subset(mtcars,split == 'TRUE')

testing <- subset(mtcars, split == 'FALSE')

# BUILDING THE MODEL

model <- glm(vs ~ wt+disp, training, family = "binomial")

# SUMMARY OF THE MODEL

summary(model)

# NOW LETS PREDICT THE MODEL USING TESTING DATA SET

# Create a dataframe to input the values to the model. To Test "Dodge Challenger"

data1 <- data.frame(wt = 3.520, disp = 318.0)

# Predict the Model by passing the input values created data1. This outputs the probability.
# If the probability is less than 0.5 then it means it is not a vs engine. If it is greater than o.5
# it has the vs engine.

ans1 <- predict(model,data1,type = "response")
ans1 > 0.5
# Lets test another model. 
# Create a dataframe to input the values to the model. To Test "Merc 280C"

data2 <- data.frame(wt = 3.440, disp = 167.6)

# Predict the Model by passing the input values created data1. This outputs the probability.
# If the probability is less than 0.5 then it means it is not a vs engine. If it is greater than o.5
# it has the vs engine.

ans2 <- predict(model,data2,type = "response")
ans2 > 0.5

