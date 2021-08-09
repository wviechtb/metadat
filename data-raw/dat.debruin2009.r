# de Bruin, M., Viechtbauer, W., Hospers, H. J., Schaalma, H. P., & Kok, G.
# (2009). Standard care quality determines treatment outcomes in control
# groups of HAART-adherence intervention studies: Implications for the
# interpretation and comparison of intervention effects. Health Psychology,
# 28(6), 668-674.

dat.debruin2009 <- read.table("data-raw/dat.debruin2009.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.debruin2009, file="data/dat.debruin2009.rda")
