
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

setwd("~/Labo/Données/Script/lineplot")

dat<-read.table('propio.txt',header=TRUE, dec = ",")

ggplot(data = dat, aes(x=dat$time, y=dat$value, group=dat$class))+
  geom_point(size=4)+
  geom_line(size=2)+
  scale_color_manual(values=c('#999999','#E69F00'))+
  theme_bw()