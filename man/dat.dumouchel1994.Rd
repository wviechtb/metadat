\name{dat.dumouchel1994}
\docType{data}
\alias{dat.dumouchel1994}
\title{Nitrogen dioxide data set}
\description{Nine studies investigating the effect of NO2 exposure on respiratory illness in children.}
\usage{
dat.dumouchel1994
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study}  \tab \code{character} \tab study label \cr
\bold{smoke}  \tab \code{factor}    \tab adjustment for smoking (y/n) \cr
\bold{no2}    \tab \code{factor}    \tab direct measurement of NO2 concentration (y/n) \cr
\bold{gender} \tab \code{factor}    \tab adjustment for gender (y/n) \cr
\bold{or}     \tab \code{numeric}   \tab odds ratio for childhood respiratory illness \cr
\bold{lower}  \tab \code{numeric}   \tab lower bound of 95 percent CI \cr
\bold{upper}  \tab \code{numeric}   \tab upper bound of 95 percent CI
}
}
\details{
   Hasselblad et al. (1992) investigated the effects of nitrogen dioxide (NO2) exposure on the occurrence of respiratory illness in children. Their data were picked up by DuMouchel (1994) as an illustrative example in his article on Bayesian meta-analysis, and were also part of his \dQuote{\code{hblm}} S-Plus software package. DuMouchel's dataset differs slightly from the figures quoted by Hasselblad et al. (1992), apparently because he had additional, more detailed data available.

   The data set features three study-level covariables reflecting characteristics of the study designs, namely, whether the quoted estimate had been adjusted for parents' smoking status, whether NO2 exposure had been measured directly (or presence of a gas stove in the household had been used as a proxy instead), and whether the quoted effect had been adjusted for gender. Inclusion of the covariables allows to account for the studies' design features, quantify their effects, and adjust for these.
}
\source{
   DuMouchel, W. H. (1994). Hierarchical Bayes linear models for meta-analysis. Technical Report 27, National Institute of Statistical Sciences (NISS); Research Triangle Park, NC, USA. \verb{https://www.niss.org/research/technical-reports/hierarchical-bayes-linear-models-meta-analysis-1994}
}
\references{
   Hasselblad, V., Eddy, D. M., & Kotchmar, D. J. (1992). Synthesis of environmental evidence: Nitrogen dioxide epidemiology studies. \emph{Journal of the Air and Waste Management Association}, \bold{42}(5), 662--671. \verb{https://doi.org/10.1080/10473289.1992.10467018}
}
\author{
   Christian Roever, \email{christian.roever@med.uni-goettingen.de}
}
\examples{
# show data:
dat.dumouchel1994

\dontrun{
# derive effect sizes (log-ORs):
library(metafor)
no2 <- escalc(measure="OR", yi=log(or),
              sei=(log(upper)-log(lower))/(2*qnorm(0.975)),
              slab=study, data=dat.dumouchel1994)
summary(no2)

# compute overall meta-analysis:
library(bayesmeta)
bm01 <- bayesmeta(no2, tau.prior="DuMouchel")

# show results:
bm01
forestplot(bm01)
traceplot(bm01)

# perform meta-regression;
# specify regressor matrix:
X <- model.matrix( ~ smoke + no2 + gender, data=no2)
colnames(X) <- c("intercept", "smoke", "no2", "gender")

# perform regression:
bm02 <- bmr(no2, X=X, tau.prior="DuMouchel")

# show results:
bm02
forestplot(bm02)
#forestplot(bm02, xlab="log-OR",
#           X.mean=rbind("none"      = c(1,0,0,0),
#                        "smoke"     = c(1,1,0,0),
#                        "no2"       = c(1,0,1,0),
#                        "gender"    = c(1,0,0,1),
#                        "all three" = c(1,1,1,1)))
traceplot(bm02)
}
}
\keyword{datasets}
\concept{medicine}
\concept{odds ratios}
\concept{meta-regression}
\section{Concepts}{
   medicine, odds ratios, meta-regression
}
