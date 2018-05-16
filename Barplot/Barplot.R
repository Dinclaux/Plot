
# Reinitialize the session
rm(list=ls(all=TRUE))

#########################################################
###       Installing and loading required packages    ###
#########################################################


if (!require("ggplot2")) {
  install.packages("ggplot2", dependencies = TRUE)
  library(ggplot2)
}


#############################################################
###                     Reading data                      ###
#############################################################

setwd("~/Labo/Data/Script/Plot/Barplot")

dat<-read.table("test.txt",header=TRUE, dec = ",")
dat$Strain <- factor(dat$Strain , levels = c("MG_WT","pSE380ilvD"))

ggplot(dat, aes(y = Mean, x =Strain,fill=metabo ))+
  geom_bar(stat="identity",position = "dodge")+
  geom_errorbar( aes(ymin=Mean-sd, ymax=Mean+sd), width=.4,position=position_dodge(.8))+
  theme_bw()