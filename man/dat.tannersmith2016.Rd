\name{dat.tannersmith2016}
\docType{data}
\alias{dat.tannersmith2016}
\title{Studies on the Relationship between School Motivation and Criminal Behavior}
\description{Results from 17 studies on the correlation between school motivation/attitudes and subsequent delinquent/criminal behavior.}
\usage{
dat.tannersmith2016
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{studyid}  \tab \code{numeric}   \tab study identifier \cr
\bold{yi}       \tab \code{numeric}   \tab r-to-z transformed correlation coefficient \cr
\bold{vi}       \tab \code{numeric}   \tab corresponding sampling variance \cr
\bold{sei}      \tab \code{numeric}   \tab corresponding standard error \cr
\bold{aget1}    \tab \code{numeric}   \tab age at which the school motivation/attitudes were assessed \cr
\bold{aget2}    \tab \code{numeric}   \tab age at which the delinquent/criminal behavior was assessed \cr
\bold{propmale} \tab \code{numeric}   \tab proportion of male participants in the sample \cr
\bold{sexmix}   \tab \code{character} \tab whether the sample consisted only of males, only of females, or a mix
}
}
\details{
   The dataset includes 113 r-to-z transformed correlation coefficients from 17 prospective longitudinal studies that examined the relationship between school motivation/attitudes and subsequent delinquent/criminal behavior.

   Multiple coefficients could be extracted from the studies \dQuote{given the numerous ways in which school motivation/attitudes variables could be operationalized (e.g., academic aspirations, academic self-efficacy) as well as the numerous ways in which crime/delinquency could be operationalized (e.g., property crime, violent crime)} (Tanner-Smith et al., 2016).

   Since information to compute the covariance between multiple coefficients within studies is not available, Tanner-Smith et al. (2016) illustrate the use of cluster-robust inference methods for the analysis of this dataset.

   Note that this dataset is only meant to be used for pedagogical and demonstration purposes and does not constitute a proper review or synthesis of the complete and current research evidence on the given topic.
}
\source{
   Tanner-Smith, E. E., Tipton, E. & Polanin, J. R. (2016). Handling complex meta-analytic data structures using robust variance estimates: A tutorial in R. \emph{Journal of Developmental and Life-Course Criminology}, \bold{2}(1), 85--112. \verb{https://doi.org/10.1007/s40865-016-0026-5}
}
\author{
   Wolfgang Viechtbauer, \email{wvb@metafor-project.org}, \url{https://www.metafor-project.org}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.tannersmith2016
head(dat)

\dontrun{
### load metafor package
library(metafor)

### compute mean age variables within studies
dat$aget1 <- ave(dat$aget1, dat$studyid)
dat$aget2 <- ave(dat$aget2, dat$studyid)

### construct an effect size identifier variable
dat$esid <- 1:nrow(dat)

### construct an approximate var-cov matrix assuming a correlation of 0.8
### for multiple coefficients arising from the same study
V <- vcalc(vi, cluster=studyid, obs=esid, rho=0.8, data=dat)

### fit a multivariate random-effects model using the approximate var-cov matrix V
res <- rma.mv(yi, V, random = ~ esid | studyid, data=dat)
res

### use cluster-robust inference methods
robust(res, cluster=studyid, clubSandwich=TRUE)

### note: the results obtained above and below are slightly different compared
### to those given by Tanner-Smith et al. (2016) since the approach illustrated
### here makes use a multivariate random-effects model for the 'working model'
### before applying the cluster-robust inference methods, while the results given
### in the paper are based on a somewhat simpler working model

### examine the main effects of the age variables
res <- rma.mv(yi, V, mods = ~ aget1 + aget2,
              random = ~ 1 | studyid/esid, data=dat)
robust(res, cluster=studyid, clubSandwich=TRUE)

### also examine their interaction
res <- rma.mv(yi, V, mods = ~ aget1 * aget2,
              random = ~ 1 | studyid/esid, data=dat)
robust(res, cluster=studyid, clubSandwich=TRUE)

### add the sexmix factor to the model
res <- rma.mv(yi, V, mods = ~ aget1 * aget2 + sexmix,
              random = ~ 1 | studyid/esid, data=dat)
robust(res, cluster=studyid, clubSandwich=TRUE)
}
}
\keyword{datasets}
\concept{psychology}
\concept{criminology}
\concept{correlation coefficients}
\concept{multilevel models}
\concept{cluster-robust inference}
\concept{meta-regression}
\section{Concepts}{
   psychology, criminology, correlation coefficients, multilevel models, cluster-robust inference, meta-regression
}
