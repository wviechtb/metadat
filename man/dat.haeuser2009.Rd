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
\bold{country}    \tab \code{character}  \tab country where study was conducted \cr
\bold{female}     \tab \code{numeric}    \tab percent of female participants \cr
\bold{white}      \tab \code{numeric}    \tab percent of white participants \cr
\bold{mage}       \tab \code{numeric}    \tab mean age of participants \cr
\bold{duration}   \tab \code{numeric}    \tab study / treatment duration \cr
\bold{med}        \tab \code{character}  \tab antidepressant medication \cr
\bold{jadad}      \tab \code{numeric}    \tab Jadad score \cr
\bold{vantulder}  \tab \code{numeric}    \tab van Tulder score \cr
\bold{tgrp}       \tab \code{character}  \tab treatment group identifier \cr
\bold{cgrp}       \tab \code{character}  \tab control group identifier \cr
\bold{outcome}    \tab \code{character}  \tab outcome variable (pain, fatigue, sleep, mood, qol) \cr
\bold{type}       \tab \code{character}  \tab whether means reflect raw means of mean changes \cr
\bold{nti}        \tab \code{numeric}    \tab number of participants in the treatment group \cr
\bold{mti}        \tab \code{numeric}    \tab mean (change) in the treatment group \cr
\bold{sdti}       \tab \code{numeric}    \tab standard deviation in the treatment group \cr
\bold{nci}        \tab \code{numeric}    \tab number of participants in the control group \cr
\bold{mci}        \tab \code{numeric}    \tab mean (change) in the control group \cr
\bold{sdci}       \tab \code{numeric}    \tab standard deviation in the control group
}
}
\details{
   The meta-analysis by Häuser et al. (2009) examined the efficacy of antidepressants in the treatment of fibromyalgia syndrome. Several outcomes were assessed in the studies, including pain, fatigue, sleep disturbances, (depressed) mood, and health-related quality of life (variable \code{outcome}). For all outcomes, a higher mean reflects a more negative outcome.

   Riley et al. (2011) used these data in their discussion of prediction intervals in the context of the random-effects model for meta-analysis.
}
\note{
   Some studies compared multiple treatment groups against a common control group. This induces dependency between the observed standardized mean differences, which was not accounted for in the analyses conducted in the original meta-analysis.

   If a range was given in the dataset (e.g., for variable \code{female}), then the midpoint of the range was entered in the dataset.

   Some typos were discovered and corrected during data entry. For Heymann et al. (2001), the mean in the nortiptyline group for was 48.78, not 49.78. For Hannonen et al. (1998), the sample size of the treatment group for outcome sleep was 30, not 39.
}
\source{
   Häuser, W., Bernardy, K., Üçeyler, N., & Sommer, C. (2009). Treatment of fibromyalgia syndrome with antidepressants: A meta-analysis. \emph{Journal of the American Medical Association}, \bold{301}(2), 198--209. \verb{https://doi.org/10.1001/jama.2008.944}
}
\references{
   Riley, R. D., Higgins, J. P. T., & Deeks, J. J. (2011). Interpretation of random effects meta-analyses. \emph{British Medical Journal}, \bold{342}, d549. \verb{https://doi.org/10.1136/bmj.d549}
}
\author{
   Wolfgang Viechtbauer, \email{wvb@metafor-project.org}, \url{https://www.metafor-project.org}
}
\examples{
### copy data to 'dat' and examine the data
dat <- dat.haeuser2009
head(dat)

\dontrun{
### load metafor package
library(metafor)

### compute the SMD values for the outcome pain
dat.pain <- escalc(measure="SMD", m1i=mti, sd1i=sdti, n1i=nti,
                                  m2i=mci, sd2i=sdci, n2i=nci,
                                  data=dat, subset=outcome=="pain")
dat.pain

### fit a random-effects model
res <- rma(yi, vi, data=dat.pain, method="DL", digits=2)
res
predict(res)

### calculate the prediction interval as suggested by Riley et al. (2011)
predict(res, predtype="riley")

### note: reported as -0.83 to -0.02 in Riley et al. (2011); the discrepancy is due to rounding

############################################################################

### construct an approximate var-cov matrix of the SMD values accounting for
### the dependency in the estimates due to the use of shared control groups
V <- vcalc(vi, cluster=ref, grp1=tgrp, grp2=cgrp, data=dat.pain)
V

### fit a multilevel random-effects model
res <- rma.mv(yi, V, random = ~ 1 | ref/tgrp, data=dat.pain, digits=2)
res
predict(res)

### use cluster-robust inference methods
robust(res, cluster=ref, clubSandwich=TRUE)

############################################################################

### frequency table for the different outcomes
table(dat$outcome)

### compute the SMD values for all outcomes
dat <- escalc(measure="SMD", m1i=mti, sd1i=sdti, n1i=nti,
                             m2i=mci, sd2i=sdci, n2i=nci,
                             data=dat)

### approximate correlation matrix for the 5 outcomes
R <- read.table(header=TRUE, text = "
outcome  fatigue  mood  pain   qol sleep
fatigue     1.00  0.60  0.65  0.70  0.60
mood        0.60  1.00  0.55  0.75  0.60
pain        0.65  0.55  1.00  0.70  0.55
qol         0.70  0.75  0.70  1.00  0.60
sleep       0.60  0.60  0.55  0.60  1.00")
R <- as.matrix(R[,-1])
rownames(R) <- colnames(R)
R

### construct an approximate var-cov matrix of the SMD values accounting for
### the dependency in the estimates due to the use of shared control groups
### and for multiple outcomes measured in the same sample
V <- vcalc(vi, cluster=ref, type=outcome, rho=R,
           grp1=tgrp, grp2=cgrp, data=dat)
dat[dat$ref == 64,]
blsplit(V, dat$ref, cov2cor)[["64"]]

### fit a multivariate random-effects model allowing for different amounts
### of heterogeneity for the different outcomes
res <- rma.mv(yi, V, mods = ~ 0 + outcome,
              random = list(~ outcome | ref, ~ outcome | tgrp),
              struct="HCS", data=dat, digits=2)
res
predict(res, newmods=diag(5), tau2.levels=1:5, gamma2.levels=1:5)

### use cluster-robust inference methods
robust(res, cluster=ref, clubSandwich=TRUE)
}
}
\keyword{datasets}
\concept{medicine}
\concept{standardized mean differences}
\concept{multilevel models}
\concept{multivariate models}
\concept{cluster-robust inference}
\section{Concepts}{
   medicine, standardized mean differences, multilevel models, cluster-robust inference, multivariate models
}
