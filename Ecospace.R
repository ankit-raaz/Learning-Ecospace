#ecospace
# packageVersion("ecospace")
# citation("ecospace")
# news(package = "ecospace")
# vignette("ecospace")
library("ecospace")
# ?neutral
nchar<- 15
char.state = rep(3,nchar)
ecospace<- create_ecospace(nchar = nchar, char.state = rep(3,nchar), char.type = rep(c("factor","ord.fac","ord.num"),nchar/3))
x<- neutral(Sseed=5,Smax = 20, ecospace = ecospace)
head(x,10)

metrics<- calc_metrics(samples=x,Smax = 20, Model = "Neutral", Param = "NA")
metrics
op<- par()
par(mfrow=c(2,4), mar= c(4,4,1,.3))
attach(metrics) #why is this attach fun needs to be called here? 
#I am asking because without this the code works fine & gives plot.
plot(S,H, type="l", cex=.5)
plot(S,D, type="l", cex=.5)
plot(S,M, type="l", cex=.5)
plot(S,V, type="l", cex=.5)
plot(S,FRic, type="l", cex=.5)
plot(S,FEve, type="l", cex=.5)
plot(S,FDiv, type="l", cex=.5)
plot(S,FDis, type="l", cex=.5)

par(op)