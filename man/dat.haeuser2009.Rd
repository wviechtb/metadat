\name{dat.haeuser2009}
\docType{data}
\alias{dat.haeuser2009}
\title{Studies on the Treatment of Fibromyalgia Syndrome with Antidepressants}
\description{Results from studies examining the treatment of fibromyalgia syndrome with various antidepressants.}
\usage{
dat.haeuser2009
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study}      \tab \code{character}  \tab study authors \cr
\bold{ref}        \tab \code{numeric}    \tab reference number as in article \cr
\bold{year}       \tab \code{numeric}    \tab publication year \cr
\bold{country}    \tab \code{numeric}    \tab country where study was conducted \cr
\bold{female}     \tab \code{numeric}    \tab percent of female participants \cr
\bold{white}      \tab \code{numeric}    \tab percent of white participants \cr
\bold{mage}       \tab \code{numeric}    \tab mean age of participants \cr
\bold{duration}   \tab \code{numeric}    \tab study / treatment duration \cr
\bold{med}        \tab \code{numeric}    \tab antidepressant medication \cr
\bold{jadad}      \tab \code{numeric}    \tab Jadad score \cr
\bold{vantulder}  \tab \code{numeric}    \tab van Tulder score \cr
\bold{tgrp}       \tab \code{numeric}    \tab treatment group identifier \cr
\bold{cgrp}       \tab \code{numeric}    \tab control group identifier \cr
\bold{outcome}    \tab \code{numeric}    \tab outcome variable \cr
\bold{type}       \tab \code{numeric}    \tab whether means reflect raw means of mean changes \cr
\bold{nti}        \tab \code{numeric}    \tab number of participants in the treatment group \cr
\bold{mti}        \tab \code{numeric}    \tab mean (change) in the treatment group \cr
\bold{sdti}       \tab \code{numeric}    \tab standard deviation in the treatment group \cr
\bold{nci}        \tab \code{numeric}    \tab number of participants in the control group \cr
\bold{mci}        \tab \code{numeric}    \tab mean (change) in the control group \cr
\bold{sdci}       \tab \code{numeric}    \tab standard deviation in the control group
}
}
\details{
   The meta-analysis by Häuser et al. (2009) examined the efficacy of antidepressants in the treatment of fibromyalgia syndrome. Several outcomes were assessed in the studies, including pain, fatigue, sleep, (depressed) mood, and health-related quality of life (variable \code{outcome}).
}
\note{
   Some studies compared multiple treatment groups against a common control group. This induces dependency between the observed standardized mean differences, which was not accounted for in the analyses conducted in the original meta-analysis.

   If a range was given in the dataset (e.g., for variable \code{female}), then the midpoint of the range was entered in the dataset.

   Some typos were discovered and corrected during data entry. For Heymann et al. (2001), the mean in the nortiptyline group for was 48.78, not 49.78. For Hannonen et al. (1998), the sample size of the treatment group for outcome sleep was 30, not 39.
}
\source{
   Häuser, W., Bernardy, K., Üçeyler, N., & Sommer, C. (2009). Treatment of fibromyalgia syndrome with antidepressants: A meta-analysis. \emph{Journal of the American Medical Association}, \bold{301}(2), 198--209. \verb{https://doi.org/10.1001/jama.2008.944}
}
\author{
   Wolfgang Viechtbauer, \email{wvb@metafor-project.org}, \url{https://www.metafor-project.org}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.haeuser2009
dat

\dontrun{
### load metafor package
library(metafor)

### compute the SMD values for the outcome pain
dat <- escalc(measure="SMD", m1i=mti, sd1i=sdti, n1i=nti,
                             m2i=mci, sd2i=sdci, n2i=nci,
                             data=dat, subset=outcome == "pain")
dat

### fit a random-effects model
res <- rma(yi, vi, data=dat, method="DL", digits=2)
res
predict(res)

### construct an approximate var-cov matrix of the SMD values accounting for
### the dependency in the estimates due to the use of shared control groups
V <- vcalc(vi, cluster=ref, grp1=tgrp, grp2=cgrp, data=dat)
V

### fit a multilevel random-effects model
res <- rma.mv(yi, V, random = ~ 1 | ref/tgrp, data=dat, digits=2)
res
predict(res)

### use cluster-robust inference methods
robust(res, cluster=ref, clubSandwich=TRUE)
}
}
\keyword{datasets}
\concept{medicine}
\concept{standardized mean differences}
\concept{multilevel models}
\concept{cluster-robust inference}
\section{Concepts}{
   medicine, standardized mean differences, multilevel models, cluster-robust inference
}
