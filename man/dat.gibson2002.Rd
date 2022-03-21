\name{dat.gibson2002}
\docType{data}
\alias{dat.gibson2002}
\title{Studies on the Effectiveness of Self-Management Education and Regular Medical Review for Adults with Asthma}
\description{Results from 15 trials examining the effectiveness of self-management education and regular medical review for adults with asthma.}
\usage{
dat.gibson2002
}
\format{The data frame contains the following columns:
\tabular{lll}{
\bold{author}   \tab \code{character} \tab first author of study \cr
\bold{year}     \tab \code{numeric}   \tab publication year \cr
\bold{n1i}      \tab \code{numeric}   \tab number of participants in the intervention group \cr
\bold{m1i}      \tab \code{numeric}   \tab mean number of days off work/school in the intervention group \cr
\bold{sd1i}     \tab \code{numeric}   \tab standard deviation of the number of days off work/school in the intervention group \cr
\bold{n2i}      \tab \code{numeric}   \tab number of participants in the control/comparison group \cr
\bold{m2i}      \tab \code{numeric}   \tab mean number of days off work/school in the control/comparison group \cr
\bold{sd2i}     \tab \code{numeric}   \tab standard deviation of the number of days off work/school in the control/comparison group \cr
\bold{ai}       \tab \code{numeric}   \tab number of participants who had one or more days off work/school in the intervention group \cr
\bold{bi}       \tab \code{numeric}   \tab number of participants who no days off work/school in the intervention group \cr
\bold{ci}       \tab \code{numeric}   \tab number of participants who had one or more days off work/school in the control/comparison group \cr
\bold{di}       \tab \code{numeric}   \tab number of participants who no days off work/school in the control/comparison group \cr
\bold{type}     \tab \code{numeric}   \tab numeric code for the intervention type (see \sQuote{Details})
}
}
\details{
   Asthma management guidelines typically recommend for patients to receive education and regular medical review. While self-management programs have been shown to increase patient knowledge, it is less clear to what extent they actually impact health outcomes. The systematic review by Gibson et al. (2002) examined the effectiveness of self-management education and regular medical review for adults with asthma. In each study, participants receiving a certain management intervention were compared against those in a control/comparison group with respect to a variety of health outcomes. One of the outcomes examined in a number of studies was the number of days off work/school.

   The majority of studies reporting this outcome provided means and standard deviations allowing a meta-analysis of standardized mean differences. Seven studies also reported the number of participants who had one or more days off work/school in each group. These studies could be meta-analyzed using, for example, (log) risk ratios. Finally, one could also consider a combined analysis based on standardized mean differences computed from the means and standard deviations where available and using probit transformed risk differences (which also provide estimates of the standardized mean difference) for the remaining studies.

   Some degree of patient education was provided in all studies. In addition, the \code{type} variable indicates what additional intervention components were included in each study:
   \enumerate{
   \item optimal self-management (writing action plan, self-monitoring, regular medical review),
   \item self-monitoring and regular medical review,
   \item self-monitoring only,
   \item regular medical review only,
   \item written action plan only.
   }
}
\source{
   Gibson, P. G., Powell, H., Wilson, A., Abramson, M. J., Haywood, P., Bauman, A., Hensley, M. J., Walters, E. H., & Roberts, J. J. L. (2002). Self-management education and regular practitioner review for adults with asthma. \emph{Cochrane Database of Systematic Reviews}, \bold{3}, CD001117. \verb{https://doi.org/10.1002/14651858.CD001117}
}
\author{
   Wolfgang Viechtbauer, \email{wvb@metafor-project.org}, \url{https://www.metafor-project.org}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.gibson2002
dat

\dontrun{

### load metafor package
library(metafor)

### compute standardized mean differences and corresponding sampling variances
dat <- escalc(measure="SMD", m1i=m1i, sd1i=sd1i, n1i=n1i, m2i=m2i, sd2i=sd2i, n2i=n2i, data=dat)
dat

### fit an equal-effects model to the standardized mean differences (as in Gibson et al., 2002)
res <- rma(yi, vi, data=dat, method="EE")
print(res, digits=2)

### compute log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=ai, bi=bi, ci=ci, di=di, data=dat)
dat

### fit an equal-effects model to the log risk ratios
res <- rma(yi, vi, data=dat, method="EE")
print(res, digits=2)
predict(res, transf=exp, digits=2)

### note: Gibson et al. (2002) used the Mantel-Haenszel method for their analysis
rma.mh(measure="RR", ai=ai, bi=bi, ci=ci, di=di, data=dat, digits=2)

### compute standardized mean differences where possible and otherwise probit transformed
### risk differences (which also provide estimates of the standardized mean differences)
dat <- escalc(measure="SMD", m1i=m1i, sd1i=sd1i, n1i=n1i,
                             m2i=m2i, sd2i=sd2i, n2i=n2i, data=dat, add.measure=TRUE)
dat <- escalc(measure="PBIT", ai=ai, bi=bi, ci=ci, di=di, data=dat, replace=FALSE, add.measure=TRUE)
dat

### fit a random-effects model to these estimates
res <- rma(yi, vi, data=dat)
print(res, digits=2)

### meta-regression model examining if there are systematic differences based on the
### type of measure used (there are only 2 studies where measure="PBIT", so this isn't
### very conclusive here, but shown for illustration purposes)
res <- rma(yi, vi, mods = ~ measure, data=dat)
print(res, digits=2)
predict(res, newmods=1, digits=2)

}
}
\keyword{datasets}
\concept{medicine}
\concept{primary care}
\concept{risk ratios}
\concept{standardized mean differences}
\section{Concepts}{
   medicine, primary care, risk ratios, standardized mean differences
}
