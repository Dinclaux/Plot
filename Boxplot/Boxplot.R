
# Reinitialize the session
rm(list=ls(all=TRUE))

#########################################################
###       Installing and loading required packages    ###
#########################################################


if (!require("plotly")) {
  install.packages("plotly", dependencies = TRUE)
  library(plotly)
}


#############################################################
###                     Reading data                      ###
#############################################################

setwd("~/Labo/Données/Script/Boxplot")

dat<-read.table('Bucket.txt',header=TRUE, dec = ",")

l <- list(
  font = list(
    family = "sans-serif",
    size = 16,
    color = "#000"),
  borderwidth = 1)

p <- plot_ly(data = dat,
             x= dat$Bucket,
             y=dat$WT, 
             type = "box", 
             opacity = 1,
             showlegend = FALSE,
             name = "WT",
             boxpoints = FALSE,
             fillcolor = "darkblue",
             line = list(color = "darkblue",
                         width = 2))
p <- add_trace(p,
          x= dat$Bucket,
          y=dat$ilvG,
          type = "box",
          name = "ilvG+",
          boxpoints = FALSE,
          opacity = 1,
          fillcolor = "orange",
          line = list(color = "orange",
                      width = 2))
p <-layout(p,
           xaxis = list(showgrid =TRUE,
                        title = "ppm",
                        showexponent = "all",
                        autorange = "reversed",
                        tickmode = "auto",
                        nticks = 20,
                        gridwidth = 2),
           yaxis = list(showgrid =TRUE,
                        showexponent = "all",
                        gridwidth = 2),
           legend =l)
p