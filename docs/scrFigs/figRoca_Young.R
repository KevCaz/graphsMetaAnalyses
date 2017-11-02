##-- Reproduce Roca et al. 2016 -- Amanda Young version
Roca <- read.csv('data/datRoca.csv')

library(ggplot2)
library(lemon) # to use `reposition_legend()`

##-- create the plot
n <- ggplot(Roca, aes(x=categ, y=mean, colour=freq)) +
  geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width=.1) +
  scale_x_discrete(limits = c("small","medium", "large"))+
  ylim(-1,3)+
  geom_hline(yintercept=0,col="grey", linetype="dashed")+
  scale_colour_manual(values=c("black", "red"), labels = c("Low Typical Frequency (0-3kHz)", "High Typical Frequency (>3kHz)"), guide = guide_legend(title = NULL))+
  geom_line() +
  geom_point(size=7)+
  theme_bw()+
  labs(y="Hedges' g", x="Species Bodymass Categories")

##-- KevCaz added ggsave around the call to `reposition_legend()`
ggsave(filename = 'img/figRoca_Young.png',
  plot = reposition_legend(n +
                    theme(panel.grid.major = element_blank(),
                          panel.grid.minor = element_blank()),
                  'top right', x=0.9, y=0.95, just=c(0, -0.5)),
  dpi = 300,
  height = 5.5,
  width = 8
)
