#cargar datos
getwd()
setwd("/Users/karen/Documents/data")
#datos sin categoricos
datos<-read.csv("nutrientessdc.csv",header=T, sep=",")
#probar normalidad multivariada
library(MVN)
mardiaTest(datos)
#Result: Data are not multivariate normal
##################################################
#Hay diferencias significativas entre parcelas?
library(pgirmess)
milpa<-read.csv("milpast.csv",header=T, sep=",")
pairwise.wilcox.test(milpa$pH , milpa$X...Plot, p.adjust = "bonferroni", exact = FALSE,
                     paired = FALSE )

#Todas las combinaciones...
#RL
rl<-read.csv("rltodos.csv",header=T, sep=",")
lapply(rl[,c("pH","Ct","Nt","Pt","CNratio","CPratio")],function(x) wilcox.test(x~ rl$X...Plot))
#Diferencias significativas RL:Pt
#RT
rt<-read.csv("rttodos.csv",header=T, sep=",")
lapply(rt[,c("pH","Ct","Nt","Pt","CNratio","CPratio")],function(x) wilcox.test(x~ rt$X...Plot))
#Diferencias significativas en RL:Ct, Nt, Pt,CNratio,CPratio
#RF
rf<-read.csv("rftodos.csv",header=T, sep=",")
lapply(rf[,c("pH","Ct","Nt","Pt","CNratio","CPratio")],function(x) wilcox.test(x~ rf$X...Plot))
#Diferencias significativas en RF: Ct, Nt, Pt
lt<-read.csv("lttodos.csv",header=T, sep=",")
lapply(lt[,c("pH","Ct","Nt","Pt","CNratio","CPratio")],function(x) wilcox.test(x~ lt$X...Plot))
#Diferencias significativas LT:pH, Ct,Nt,Pt, CNratio, CPratio
#LF
lf<-read.csv("lttodos.csv",header=T, sep=",")
lapply(lf[,c("pH","Ct","Nt","Pt","CNratio","CPratio")],function(x) wilcox.test(x~ lf$X...Plot))
#Diferencias significativas LF:pH, Ct,Nt,Pt,CNratio,CPratio
#TF
tf<-read.csv("tftodos.csv",header=T, sep=",")
lapply(tf[,c("pH","Ct","Nt","Pt","CNratio","CPratio")],function(x) wilcox.test(x~ tf$X...Plot))
#Diferencias significativas TF:Ct, Nt,CNratio,Cpratio

#Hay diferencias entre tiempos???
###R plots
#R12
r12<-read.csv("R12.csv",header=T, sep=",")
lapply(r12[,c("pH","Ct","Nt","Pt","CNratio","CPratio")],function(x) wilcox.test(x~ r12$X...Sampling_time))
#Quiz?? son diferentes RT1-RT2en CN ratio

#R23
r23<-read.csv("R23.csv",header=T, sep=",")
lapply(r23[,c("pH","Ct","Nt","Pt","CNratio","CPratio")],function(x) wilcox.test(x~ r23$X...Sampling_time))
#Diferentes en pH

#R13
r13<-read.csv("R13.csv",header=T, sep=",")
lapply(r13[,c("pH","Ct","Nt","Pt","CNratio","CPratio")],function(x) wilcox.test(x~ r13$X...Sampling_time))
#No hay diferencias



#http://www.um.es/ae/FEIR/50/
#https://rpubs.com/kaz_yos/1204  




