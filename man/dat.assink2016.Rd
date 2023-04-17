\name{dat.assink2016}
\docType{data}
\alias{dat.assink2016}
\title{Studies on the Association between Recidivism and Mental Health}
\description{Results from 17 studies on the association between recidivism and mental health in delinquent juveniles.}
\usage{
dat.assink2016
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study}     \tab \code{numeric}   \tab study id number \cr
\bold{esid}      \tab \code{numeric}   \tab effect size within study id number \cr
\bold{id}        \tab \code{numeric}   \tab row id number \cr
\bold{yi}        \tab \code{numeric}   \tab standardized mean difference \cr
\bold{vi}        \tab \code{numeric}   \tab corresponding sampling variance \cr
\bold{pubstatus} \tab \code{numeric}   \tab published study (0 = no; 1 = yes) \cr
\bold{year}      \tab \code{numeric}   \tab publication year of the study (approximately mean centered) \cr
\bold{deltype}   \tab \code{character} \tab type of delinquent behavior in which juveniles could have recidivated (either general, overt, or covert)
}
}
\details{
   The studies included in this dataset (which is a subset of the data used in Assink et al., 2015) compared the difference in recidivism between delinquent juveniles with a mental health disorder and a comparison group of juveniles without a mental health disorder. Since studies differed in the way recidivism was defined and assessed, results are given in terms of standardized mean differences, with positive values indicating a higher prevalence of recidivism in the group of juveniles with a mental health disorder.

   Multiple effect size estimates could be extracted from most studies (e.g., for different delinquent behaviors in which juveniles could have recidivated), necessitating the use of appropriate models/methods for the analysis. Assink and Wibbelink (2016) illustrate the use of multilevel meta-analysis models for this purpose.
}
\note{
   The \code{year} variable is not constant within study 3, as this study refers to two different publications using the same data.
}
\source{
   Assink, M., & Wibbelink, C. J. M. (2016). Fitting three-level meta-analytic models in R: A step-by-step tutorial. \emph{The Quantitative Methods for Psychology}, \bold{12}(3), 154--174. \verb{https://doi.org/10.20982/tqmp.12.3.p154}
}
\references{
   Assink, M., van der Put, C. E., Hoeve, M., de Vries, S. L. A., Stams, G. J. J. M., & Oort, F. J. (2015). Risk factors for persistent delinquent behavior among juveniles: A meta-analytic review. \emph{Clinical Psychology Review}, \bold{42}, 47--61. \verb{https://doi.org/10.1016/j.cpr.2015.08.002}
}
\author{
   Wolfgang Viechtbauer, \email{wvb@metafor-project.org}, \url{https://www.metafor-project.org}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.assink2016
head(dat, 9)

\dontrun{
### load metafor package
library(metafor)

### fit multilevel model
res <- rma.mv(yi, vi, random = ~ 1 | study/esid, data=dat)
res

### use cluster-robust inference methods
robust(res, cluster=study, clubSandwich=TRUE)

### LRTs for the variance components
res0 <- rma.mv(yi, vi, random = ~ 1 | study/esid, data=dat, sigma2=c(0,NA))
anova(res0, res)
res0 <- rma.mv(yi, vi, random = ~ 1 | study/esid, data=dat, sigma2=c(NA,0))
anova(res0, res)

### examine some potential moderators via meta-regression
rma.mv(yi, vi, mods = ~ pubstatus, random = ~ 1 | study/esid, data=dat)
rma.mv(yi, vi, mods = ~ year, random = ~ 1 | study/esid, data=dat)
dat$deltype <- relevel(factor(dat$deltype), ref="general")
rma.mv(yi, vi, mods = ~ deltype, random = ~ 1 | study/esid, data=dat)
rma.mv(yi, vi, mods = ~ year + deltype, random = ~ 1 | study/esid, data=dat)

### assume that the effect sizes within studies are correlated with rho=0.6
V <- vcalc(vi, cluster=study, obs=esid, data=dat, rho=0.6)
round(V[dat$study \%in\% c(1,2), dat$study \%in\% c(1,2)], 4)

### fit multilevel model using this approximate V matrix
res <- rma.mv(yi, V, random = ~ 1 | study/esid, data=dat)
res

### use cluster-robust inference methods
robust(res, cluster=study, clubSandwich=TRUE)

### use a correlation of 0.7 for effect sizes corresponding to the same type of
### delinquent behavior and a correlation of 0.5 for effect sizes corresponding
### to different types of delinquent behavior
V <- vcalc(vi, cluster=study, type=deltype, obs=esid, data=dat, rho=c(0.7, 0.5))

### fit multilevel model using this approximate V matrix
res <- rma.mv(yi, V, random = ~ 1 | study/esid, data=dat)
res

### use cluster-robust inference methods
robust(res, cluster=study, clubSandwich=TRUE)
}
}
\keyword{datasets}
\concept{psychology}
\concept{criminology}
\concept{standardized mean differences}
\concept{multilevel models}
\concept{cluster-robust inference}
\section{Concepts}{
   psychology, criminology, standardized mean differences, multilevel models, cluster-robust inference
}
