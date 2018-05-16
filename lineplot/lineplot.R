
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

setwd("~/Labo/Data/Script/Plot/lineplot")

dat<-read.table('pilvD.txt',header=TRUE, dec = ",")



ggplot(data = dat, aes(x=time, y=concentration, group=class,color=color))+
  geom_point(size=3)+
  geom_smooth(se=FALSE,method = "loess",size=1.2,n=100,span=1,aes(linetype=line))+
  scale_color_manual(values=c('#F79646','#115364'))+
  
  theme_bw()