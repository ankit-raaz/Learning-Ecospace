?ecospaec
?KWTraits
library(ecospace)
nchar<- 15
char.state = rep(3,nchar)
ecospace<- create_ecospace(nchar= nchar, char.state = rep(3,nchar),
          char.type= rep("factor", nchar))

Sseed<-5

Smax<-50
x<-neutral(Sseed=Sseed,Smax=Smax, ecospace=ecospace)
x
head(x,10)
ecospace
seq<- seq(nchar)
types<- sapply(seq, function(seq) ecospace[[seq]]$type) 
types
if(any(types=="ord.fac" | types =="factor")) pc<- prcomp(FD::gowdis(x)) else
   pc<-prcomp(x)

pc
plot(pc$x, type= "n", main=paste("Neutral model,\n",Smax,"species"))
text(pc$x[,1], pc$x[,2], labels=seq(Smax), col=c
     (rep("red",Sseed), rep("black",5),rep("slategray",(Smax-Sseed-5))), pch=c(rep(19,Sseed),rep(21,(Smax-Sseed))),cex=.8)


#Another Example
library(ecospace)
nreps<- 1:5
samples<- lapply(X= nreps, FUN=neutral, Sseed =5, Smax=50, ecospace)
str(samples)
nchar<- 18
char.state<- c(2, 7, 3, 3, 2, 2, 5, 5, 2, 5, 2, 2, 5, 2, 5, 5, 3, 3)
char.type<-  c("numeric", "ord.num", "numeric", "numeric", "numeric", "numeric",
               "ord.num", "ord.num", "numeric", "ord.num", "numeric", "numeric", "ord.num",
                "numeric", "ord.num", "numeric", "numeric", "numeric")

data("KWTraits")
# ?KWTraits
# ?neutral
ecospace<- create_ecospace(nchar, char.state,char.type, constraint = 2, weight.file =KWTraits )
x<- neutral(Sseed=100, Smax=100, ecospace = ecospace)
weight.file =KWTraits
weight.file
mean(dist(x))
?neutral 
x<-neutral(Sseed=5, Smax=100, ecospace=ecospace)
mean(dist(x))

x<-neutral(Sseed=5, Smax=234, ecospace=ecospace)
table(x[,1:2])
table(KWTraits$SEXL, KWTraits$ASEX)


