##-- import the data
dat <- read.csv('data/datRoca.csv')
##-- png() exports the figure as a .png file
png('img/figRoca1.png', res=300, units='in', width=8, heigh=5.5)
##-- few setting as presented in the tips section I add cex.lab and cex.axis
##-- to adjust the size of the annotations and the axes labels
par(las=1, xaxs='i', mar=c(5,5,2,2), cex.lab=1.6, cex.axis=1.4)
##-- I create a sequence for x-axis and a vector for color
seqx <- rep(1:3, each=2)
vCol <- as.numeric(as.factor(dat$freq))
##-- I add mean values and I use 'axes=F' to remove axes
plot(seqx, dat$mean, pch=19, cex=2, ylim=c(-1,3.5), xlim=c(0.5,3.5), col=vCol,
xlab='Species body mass categories', ylab="Hedge's g", axes=F)
##-- I add axes back and a box with the 'L' shape
axis(2) # y-axis
axis(1, at=c(1,2,3), labels=unique(dat$categ)) # customize x-axis
box(lwd=1.2)
##-- I need mutiple calls to lines
for (i in 1:nrow(dat)){
  lines(rep(seqx[i],2), dat$mean[i]+dat$se[i]*c(-1,1), col=vCol[i], lwd=2)
}
##-- add the y=0 line
abline(h=0, lty=2)
##-- add a legend
legend(
  'topright', pch=19, col=c(2,1), pt.cex=1.4, bty='n', cex=1.2,
  legend=c('Low typical frequencies (0-3kHz)','High tpical frequencies (>3kHz)')
)
##--
dev.off()
