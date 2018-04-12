
# Reinitialize the session
rm(list=ls(all=TRUE))

#############################################################
###                     Reading data                      ###
#############################################################

setwd("~/Labo/Données/Script/Barplot/")

dat<-read.table("2018-03-16_MC_RC-1.txt",header=TRUE, dec = ",", sep = "\t")

pdf(file = "tmp.pdf",onefile = TRUE)
par(mfrow = c(2, 1))

for (nm in unique(dat$Compound)) {
  
  datt <- dat[dat$Compound==nm,]
  count <- t(as.matrix(subset(datt, select = c(Area , ISTD.Response))))
  colnames(count) <- datt$Sample.Type
  
  barplot(count[1:2,],
          legend.text = T,
          las=2,
          axes=TRUE,
          cex.axis = 0.5,
          cex.names = 0.4,
          main = nm,
          ylab = "Area Peak",
          xlab = "Sample type",
          beside = TRUE,
          col = c("darkblue", "red")
          )


}  

dev.off()