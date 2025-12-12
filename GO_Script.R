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
B.data$PH<-ifelse(B.data$PH=="N", 0,1)
B.data$MH<-ifelse(B.data$MH=="N", 0,1)
B.data$Belief<-ifelse(B.data$Belief=="N", 0,1)
B.data$Smoker<-ifelse(B.data$Smoker=="N", 0, ifelse(B.data$Smoker=="Current", 1, ifelse(B.data$Smoker=="Y", 1, B.data$Smoker)))
B.data$SES5<-ifelse(B.data$SES5)
B.data$SES5 <- ifelse(
  B.data$SES5 == "L1", 1,
  ifelse(B.data$SES5 == "L2", 2,
         ifelse(B.data$SES5 == "L3", 3,
                ifelse(B.data$SES5 == "L4", 4,
                       ifelse(B.data$SES5 == "L5", 5, B.data$SES5)
                )
         )
  )
)


#Cleaning P

#Cleaning H
H.data$PH<-ifelse(H.data$Physical=="No", 0,1)
H.data$MH<-ifelse(H.data$Mental=="No", 0,1)
H.data$Smoker<-ifelse(H.data$Smoker=="No", 0,1)
H.data$Belief<-ifelse(H.data$Belief=="No", 0,1)


#Merging Data
Combined.Data <- bind_rows(A.data, B.data, H.data, P.data)


#Binomial Regression