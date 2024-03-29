\name{dat.pritz1997}
\docType{data}
\alias{dat.pritz1997}
\title{Studies on the Effectiveness of Hyperdynamic Therapy for Treating Cerebral Vasospasm}
\description{Results from 14 studies on the effectiveness of hyperdynamic therapy for treating cerebral vasospasm.}
\usage{
dat.pritz1997
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study}    \tab \code{numeric}   \tab study number \cr
\bold{authors}  \tab \code{character} \tab study authors \cr
\bold{xi}       \tab \code{numeric}   \tab number of patients that improved with hyperdynamic therapy \cr
\bold{ni}       \tab \code{numeric}   \tab total number of patients treated
}
}
\details{
   As described in Zhou et al. (1999), "hyperdynamic therapy refers to induced hypertension and hypervolaemia (volume expansion) to treat ischaemic symptoms due to vasospasm, and the success of this therapy is defined as clinical improvement in terms of neurologic deficits." For each study that was included in the meta-analysis, the dataset includes information on the number of patients that improved under this form of therapy and the total number of patients that were treated. The goal of the meta-analysis is to estimate the true (average) success rate of hyperdynamic therapy.
}
\source{
   Zhou, X.-H., Brizendine, E. J., & Pritz, M. B. (1999). Methods for combining rates from several studies. \emph{Statistics in Medicine}, \bold{18}(5), 557--566. \verb{https://doi.org/10.1002/(SICI)1097-0258(19990315)18:5<557::AID-SIM53>3.0.CO;2-F}
}
\references{
   Pritz M. B., Zhou, X.-H., & Brizendine, E. J. (1996). Hyperdynamic therapy for cerebral vasospasm: A meta-analysis of 14 studies. \emph{Journal of Neurovascular Disease}, \bold{1}, 6--8.

   Pritz, M. B. (1997). Treatment of cerebral vasospasm due to aneurysmal subarachnoid hemorrhage: Past, present, and future of hyperdynamic therapy. \emph{Neurosurgery Quarterly}, \bold{7}(4), 273--285.
}
\author{
   Wolfgang Viechtbauer, \email{wvb@metafor-project.org}, \url{https://www.metafor-project.org}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.pritz1997
dat

\dontrun{
### load metafor package
library(metafor)

### computation of "weighted average" in Zhou et al. (1999), Table IV
dat <- escalc(measure="PR", xi=xi, ni=ni, data=dat, add=0)
theta.hat    <- sum(dat$ni * dat$yi) / sum(dat$ni)
se.theta.hat <- sqrt(sum(dat$ni^2 * dat$vi) / sum(dat$ni)^2)
ci.lb        <- theta.hat - 1.96 * se.theta.hat
ci.ub        <- theta.hat + 1.96 * se.theta.hat
round(c(estimate = theta.hat, se = se.theta.hat, ci.lb = ci.lb, ci.ub = ci.ub), 4)

### this is identical to an equal-effects model with sample size weights
rma(yi, vi, weights=ni, method="EE", data=dat)

### compute sampling variances under the assumption of homogeneity
dat <- escalc(measure="PR", xi=xi, ni=ni, data=dat, add=0, vtype="AV")
dat

### fit equal-effects model (same estimate, but SE is slightly different)
rma(yi, vi, data=dat, method="EE")

### under the assumption of homogeneity, the sum of independent binomial
### counts also follows a binomial distribution; this approach yields the same
### estimate and SE as above
agg <- escalc(measure="PR", xi=sum(dat$xi), ni=sum(dat$ni))
summary(agg)

### could also compute an 'exact' CI based on the Clopper-Pearson method
binom.test(sum(dat$xi), sum(dat$ni))

### logistic regression model
res <- rma.glmm(measure="PLO", xi=xi, ni=ni, data=dat, method="EE")
res
predict(res, transf=transf.ilogit)

### the results above suggest that the true proportions may be heterogeneous

### random-effects model with raw proportions
dat <- escalc(measure="PR", xi=xi, ni=ni, data=dat)
res <- rma(yi, vi, data=dat)
predict(res)

### random-effects model with logit transformed proportions
dat <- escalc(measure="PLO", xi=xi, ni=ni, data=dat)
res <- rma(yi, vi, data=dat)
predict(res, transf=transf.ilogit)

### mixed-effects logistic regression model
res <- rma.glmm(measure="PLO", xi=xi, ni=ni, data=dat)
predict(res, transf=transf.ilogit)
}
}
\keyword{datasets}
\concept{medicine}
\concept{single-arm studies}
\concept{proportions}
\section{Concepts}{
   medicine, single-arm studies, proportions
}
