\name{dat.thompson1999}
\docType{data}
\alias{dat.thompson1999}
\title{Trials on Serum Cholesterin Concentration Lowering and Risk of Ischaemic Heart Disease}
\description{Results from 28 trials evaluating effect of serum cholesterin concentration lowering on risk of ischaemic heart disease}
\usage{
dat.thompson1999
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{studyid}    \tab \code{integer} \tab study ID \cr
\bold{ihd.cont}   \tab \code{integer} \tab number of ischaemic heart disease (control group) \cr
\bold{noihd.cont} \tab \code{integer} \tab number of non-events (control group) \cr
\bold{ihd.exp}    \tab \code{integer} \tab number of ischaemic heart disease (treated group) \cr
\bold{noihd.exp}  \tab \code{integer} \tab number of non-events (treated group) \cr
\bold{OR}         \tab \code{numeric} \tab odds ratio \cr
\bold{logOR}      \tab \code{numeric} \tab log odds ratio \cr
\bold{varlogOR}   \tab \code{numeric} \tab variance of log odds ratio \cr
\bold{cholr}      \tab \code{numeric} \tab cholesterol reduction (mmol/l)
}
}
\details{
   Thompson and Sharp (1999) compare several meta-regression approaches to explain heterogeneity in meta-analysis. The data set used is originally from Law et al. (1994), but with minor modifications.
}
\source{
   Thompson, S. G., & Sharp, S. J. (1999). Explaining heterogeneity in meta-analysis: A comparison of methods. \emph{Statistics in Medicine}, \bold{18}(20), 2693--2708. \verb{https://doi.org/10.1002/(sici)1097-0258(19991030)18:20<2693::aid-sim235>3.0.co;2-v}
}
\references{
   Law, M. R., Wald, N. J., & Thompson, S. G. (1994). By how much and how quickly does reduction in serum cholesterol concentration lower risk of ischaemic heart disease? \emph{British Medical Journal}, \bold{308}(6925), 367--372. \verb{https://doi.org/10.1136/bmj.308.6925.367}
}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show first five studies
head(dat.thompson1999, 5)

\dontrun{
### Load meta package
suppressPackageStartupMessages(library(meta))

### Conduct meta-analysis
m <- metabin(ihd.exp, ihd.exp + noihd.exp, ihd.cont, ihd.cont + noihd.cont,
  data = dat.thompson1999, sm = "OR", method = "Inverse")

### Thompson & Sharp (1999), Table III
### (1) None
metareg(m, cholr, method.tau = "FE")
### (3a) Additive (MM)
metareg(m, cholr, method.tau = "DL")
}
}
\keyword{datasets}
\concept{medicine}
\concept{cardiology}
\concept{odds ratios}
\concept{meta-regression}
\section{Concepts}{
   medicine, cardiology, odds ratios, meta-regression
}
