# Jordan, A. E., Blackburn, N. A., Des Jarlais, D. C., & Hagan, H. (2017). 
# Past-year prevalence of prescription opioid misuse among those 11 to 30 
# years of age in the United States: A systematic review and meta-analysis. 
# Journal of Substance Abuse Treatment, 77, 31-37.

dat.jordan2017 <- read.table("data-raw/dat.jordan2017.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.jordan2017, file="data/dat.jordan2017.rda")