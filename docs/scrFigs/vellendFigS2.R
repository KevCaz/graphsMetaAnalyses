##-----------------------------
vellend <- read.csv('data/Vellend2015.csv')
idrm <- !is.na(vellend$log_SR_ratio)
dvel <- vellend[idrm,]
##--- check the number of studies
# nrow(dvel)
##--

##-----------------------------
##----- FIGURE S2.
##-----------------------------
png('img/vellendfigS2.png', res=300, units='in', width=6.5, heigh=5)
par(las=1, cex.lab=1.25, cex.axis=1.25)
##-- I create a layout
layout(matrix(c(2,1,0,3), 2, 2), widths=c(1,.4), heights=c(.7,1))
dur <- log10(aggregate(Duration~Study, data=dvel, FUN=mean)[,2])
srr <- aggregate(log_SR_ratio~Study, data=dvel, FUN=mean)[,2]
##--
par(mar=c(5, 5, .5, .5))
plot(dur, srr, pch=19, xlab='Study duration (year)', ylab='Raw effect size', axes=F)
# # the line below add the results of the linear model as plotted in the
# # response by Gonzalez et al. (2016)
# abline(lm(srr~dur), col=2)
#
axis(1, lwd=0, at=c(1,2), labels=c(10, 100), lwd.tick=.5)
axis(2, lwd=0, lwd.tick=.5)
box(bty='L')
abline(h=0, lty=2)
##------------
par(mar=c(.5, 5, 2, .5))
hist(dur, breaks=seq(0.6,2.5,0.1), col='grey35', border=NA, ann=F, axes=F, ylim=c(0,20))
axis(2, lwd=1, lwd.tick=.5)
title(ylab='Number of studies')
##------------
tmp <- hist(srr, breaks=seq(-1.4,1.4,0.14), plot=F)
par(mar=c(5, .5, .5, 2))
barplot(tmp$count, space=0, col='grey35', ann=F, axes=F, horiz=TRUE, border=NA)
axis(1, lwd=1, lwd.tick=.5)
title(xlab='Number of studies')
##----
dev.off()
