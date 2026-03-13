\name{dat.cuijpers2002}
\docType{data}
\alias{dat.cuijpers2002}
\title{All-cause mortality in patients with depression}
\description{Results of 18 community studies comparing all-cause mortality in individuals with and without depression.}
\usage{
dat.cuijpers2002
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study} \tab \code{character} \tab First author and year of the study. \cr
\bold{deaths.dep} \tab \code{integer} \tab Number of deaths among individuals with depression. \cr
\bold{n.dep} \tab \code{integer} \tab Total number of individuals with depression. \cr
\bold{deaths.ctrl} \tab \code{integer} \tab Number of deaths among individuals without depression. \cr
\bold{n.ctrl} \tab \code{integer} \tab Number of individuals without depression. \cr
\bold{country} \tab \code{character} \tab Country in which the study was conducted. \cr
}  
}
\details{
This data set was used in a meta-analysis by Cuijpers and Smit (2002), examining 
the impact of subclinical and full-symptom depression on excess mortality. 
The meta-analysis studied differences in the rate of deaths between individuals 
with and without depression within the same timeframe. To avoid unit-of-analyses 
issues, event counts of studies which contributed more than one effect size 
in the original analysis were pooled. Results are therefore not exactly 
identical with the ones reported in the original review.

The dataset can be used to illustrate meta-analysis of binary outcome data 
and bivariate meta-analysis of log-odds.
}
\source{
Cuijpers, P., & Smit, F. (2002). Excess Mortality in Depression: a Meta-Analysis 
of Community Studies. \emph{Journal of Affective Disorders}, \bold{72}(3), 227-236.
}
\author{Mathias Harrer, \email{m.harrer@vu.nl}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.cuijpers2002
dat

\dontrun{
library(metafor)

# Model using a bivariate model of log-odds
# Convert data set to long format
dat <- to.long(measure="OR", ai=deaths.dep, ci=deaths.ctrl,
               n1i=n.dep, n2i=n.ctrl, data=dat.cuijpers2002,
               slab = study, append = NULL,
               var.names = c("study", "group", "deaths", "survived"))

# Calculate log-odds
dat <- escalc("PLO", xi=deaths, mi=survived, data=dat)
levels(dat$group) = c("healthy", "depression")

# Run bivariate model
(res <- rma.mv(yi, vi, mods = ~ 0 + group,
               random = ~ group | study, struct="UN",
               data=dat, method="ML"))

# Get pooled proportions
predict(res, newmods = c(1,1), transf=transf.ilogit)
predict(res, newmods = c(0,1), transf=transf.ilogit)

# Produce a L'abbé plot
res <- rma(ai=deaths.dep, n1i=n.dep, ci=deaths.ctrl, n2i=n.ctrl,
           data=dat.cuijpers2002, measure="OR")
labbe(res, ci=TRUE, pi=TRUE, grid=TRUE, legend=TRUE, bty="l",
      transf=plogis, lim=c(0,1), xlab="Risk (Depression)",
      ylab="Risk (No Depression)")
}
}
\keyword{datasets}
\concept{medicine}
\concept{psychiatry}
\concept{epidemiology}
\concept{odds ratios}
\concept{risk ratios}
\concept{risk differences}
\concept{proportions}
\concept{multivariate models}
\concept{generalized linear models}
\section{Concepts}{
   medicine, psychiatry, epidemiology, odds ratios, risk ratios, risk differences, proportions, multivariate models, generalized linear models
}

