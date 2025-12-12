#This is Tristan confirming our git is working. I love my group
#Hi tristan I also love my group x

install.packages("openxlsx")
library(openxlsx)
install.packages("dplyr")
library(dplyr)
A.data <- read.xlsx("data/A.xlsx")
B.data <- read.xlsx("data/B.xlsx")
P.data <- read.xlsx("data/P.xlsx")
H.data <- read.csv("data/H.csv")
SE.data <- read.xlsx("data/SouthEast.xlsx")

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

P.data$PH <- ifelse(P.data$PH == "No",0, ifelse(P.data$PH == "Yes",1, P.data$PH))
P.data$MH <- ifelse(P.data$MH == "N",0, ifelse(P.data$MH == "Y",1, P.data$MH))
P.data$Belief <- ifelse(P.data$Belief == "N",0, ifelse(P.data$Belief == "Y",1, P.data$Belief))
P.data$Smoker <- ifelse(P.data$Smoker == "N",0, ifelse(P.data$Smoker == "Current", 1, ifelse(P.data$Smoker == "Y",1, P.data$Smoker)))

P.data$SES5 <- ifelse(
  P.data$SES5 == "L1", 1,
  ifelse(P.data$SES5 == "L2", 2,
         ifelse(P.data$SES5 == "L3", 3,
                ifelse(P.data$SES5 == "L4", 4,
                       ifelse(P.data$SES5 == "L5", 5, P.data$SES5)
                )
         )
  ) )

head(P.data)


#Cleaning H
H.data$PH<-ifelse(H.data$Physical=="No", 0,1)
H.data$MH<-ifelse(H.data$Mental=="No", 0,1)
H.data$Smoker<-ifelse(H.data$Smoker=="No", 0,1)
H.data$Belief<-ifelse(H.data$Belief=="No", 0,1)

#Cleaning SE

head(SE.data)
SE.data$PH <- ifelse(SE.data$Phusical == "NO" ,0, ifelse(SE.data$Phusical == "YES",1, SE.data$Phusical))
SE.data$MH<- ifelse(SE.data$Mental == "N",0, ifelse(SE.data$Mental == "Y",1, SE.data$Mental))
SE.data$Belief <- ifelse(SE.data$Belief == "N",0, ifelse(SE.data$Belief == "Y",1, SE.data$Belief))
SE.data$Smoker <- ifelse(SE.data$Smoker == "N",0, ifelse(SE.data$Smoker == "Current", 1, ifelse(SE.data$Smoker == "Y",1, SE.data$Smoker)))

SE.data$SES5 <- ifelse(
  SE.data$SES5 == "L1", 1,
  ifelse(SE.data$SES5 == "L2", 2,
         ifelse(SE.data$SES5 == "L3", 3,
                ifelse(SE.data$SES5 == "L4", 4,
                       ifelse(SE.data$SES5 == "L5", 5, SE.data$SES5)
                )
         )
  ) )


#Merging Data
A <- subset(A.data, select = c("PH", "MH", "Belief", "Smoker", "Age", "Gender"))
B <- subset(B.data, select = c("PH", "MH", "Belief", "Smoker", "Age", "Gender"))
P <- subset(P.data, select = c("PH", "MH", "Belief", "Smoker", "Age", "Gender"))
H <- subset(H.data, select = c("PH", "MH", "Belief", "Smoker", "Age", "Gender"))
SE <- subset(SE.data, select = c("PH", "MH", "Belief", "Smoker", "Age", "Gender"))

Combined.Data <- bind_rows(A, B, H, P, SE)


#Binomial Regression