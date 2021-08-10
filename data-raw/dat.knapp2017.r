# Knapp, F., Viechtbauer, W., Leonhart, R., Nitschke, K., & Kaller, C. P.
# (2017). Planning performance in schizophrenia patients: A meta-analysis of
# the influence of task difficulty and clinical and sociodemographic
# variables. Psychological Medicine, 47(11), 2002-2016.

# dat.knapp2017.txt from ~/work/consulting/zzz_complete/2013_freiburg_ma/

dat.knapp2017 <- read.table("data-raw/dat.knapp2017.txt", header=TRUE, stringsAsFactors=FALSE, sep="\t")
save(dat.knapp2017, file="data/dat.knapp2017.rda")
