#This is Tristan confirming our git is working. I love my group
#Hi tristan I also love my group x

install.packages("openxlsx")
library(openxlsx)
A.data<-read.xlsx("A.xlsx")
B.data<-read.xlsx("B.xlsx")
P.data<-read.xlsx("P.xlsx")
H.data<-read.csv("H.csv")
SE.data<-read.xlsx("SouthEast.xlsx")

A.data$SES5 <- ifelse(
  A.data$SES5 == "SES1", 1,
  ifelse(A.data$SES5 == "SES2", 2,
         ifelse(A.data$SES5 == "SES3", 3,
                ifelse(A.data$SES5 == "SES4", 4,
                       ifelse(A.data$SES5 == "SES5", 5, A.data$SES5)
                )
         )
  )
)