
#install.packages("data.table")
#install.packages("xgboost")
#install.packages("snow")
#install.packages("glmnet")
#install.packages("dplyr")
#install.packages("moments")

library(data.table)
library(xgboost)
library(snow)
library(glmnet)
library(dplyr)
library(moments)

#windows
#setwd("g:\\kaggle")
#linux
setwd("/media/linsam/74D2F8C6D2F88D9C/kaggle")

main.train=fread("train.csv")
main.test=fread("test.csv")

#data ����
main.train.y=filter(main.train,Semana==9)

main.train.x=filter(main.train,Semana %in% c(3:8))#�V�m �w��9
main.train.x.2=filter(main.train,Semana %in% c(3:9))#��� �w��10


rm(main.train)
gc()
#------------------------------------------------------------
s=Sys.time()
result1=pred.fun(main.train.x,main.train.x.2,5000,main.test)
e=Sys.time()
e-s
gc()

#s=Sys.time()
#result2=pred.fun(main.train.x11,main.train.x11.2,5000000,main.test.11)
#e=Sys.time()
#e-s
#gc()

#------------------------------------------------------------
result3 = result1 %>% arrange(id)

gc()
write.csv(result3,"pred1.csv",row.names = FALSE)
























