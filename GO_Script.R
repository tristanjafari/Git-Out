#This is Tristan confirming our git is working. I love my group
#Hi tristan I also love my group x

install.packages("openxlsx")
library(openxlsx)
install.packages("readxl")
library(readxl)
install.packages("dplyr")
library(dplyr)
A.data <- read_xlsx("data/A.xlsx")
B.data <- read_xlsx("data/B.xlsx")
P.data <- read_xlsx("data/P.xlsx")
H.data <- read_xlsx("data/H.csv")
SE.data <- read_xlsx("data/SouthEast.xlsx")

#Cleaning A
dim(A.data)
str(A.data)
head(A.data)

A.data$PH <- ifelse(A.data$PH == "Y", 1, ifelse(A.data$PH == "N", 0, A.data$PH))
A.data$MH <- ifelse(A.data$MH == "Y", 1, ifelse(A.data$MH == "N", 0, A.data$MH))
A.data$Smoker <- ifelse(A.data$Smoker == "Y", 1, ifelse(A.data$Smoker == "Current", 1, ifelse(A.data$Smoker == "N", 0, A.data$MH)))
A.data$SES5 <- ifelse(
  A.data$SES5 == "L1", 1,
  ifelse(A.data$SES5 == "L2", 2,
         ifelse(A.data$SES5 == "L3", 3,
                ifelse(A.data$SES5 == "L4", 4,
                       ifelse(A.data$SES5 == "L5", 5, A.data$SES5)
                )
         )
  )
)

dim(A.data)
str(A.data)
head(A.data)

#Cleaning B

#Cleaning P

#Cleaning H


#Merging Data
Combined.Data <- bind_rows(A.data, B.data, H.data, P.data)


#Binomial Regression