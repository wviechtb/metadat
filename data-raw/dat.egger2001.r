# Egger, M., Davey Smith, G., & Altman, D. G. (Eds.) (2001). Systematic
# reviews in health care: Meta-analysis in context (2nd ed.). London: BMJ
# Books.

# Sterne, J. A. C., & Egger, M. (2001). Funnel plots for detecting bias in
# meta-analysis: Guidelines on choice of axis. Journal of Clinical
# Epidemiology, 54(10), 1046-1055.

dat.egger2001 <- read.table("data-raw/dat.egger2001.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.egger2001, file="data/dat.egger2001.rda")
