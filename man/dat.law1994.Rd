\name{dat.law1994}
\docType{data}
\alias{dat.law1994}
\title{Trials on Serum Cholesterin Concentration Lowering and Risk of Ischaemic Heart Disease}
\description{Results from 28 trials evaluating effect of serum cholesterin concentration lowering on risk of ischaemic heart disease}
\usage{
dat.law1994
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{studyid} \tab \code{integer} \tab study ID \cr
\bold{ihd.cont} \tab \code{integer} \tab number of ischaemic heart disease (control group) \cr
\bold{noihd.cont} \tab \code{integer} \tab number of non-events (control group) \cr
\bold{ihd.exp} \tab \code{integer} \tab number of ischaemic heart disease (treated group) \cr
\bold{noihd.exp} \tab \code{integer} \tab number of non-events (treated group) \cr
\bold{OR} \tab \code{numeric} \tab odds ratio \cr
\bold{logOR} \tab \code{numeric} \tab log odds ratio \cr
\bold{varlogOR} \tab \code{numeric} \tab variance of log odds ratio \cr
\bold{cholr} \tab \code{numeric} \tab cholesterol reduction (mmol/l) \cr
}  
}
\details{
Thompson & Sharp (1999) compare several meta-regression approaches to explain heterogeneity in meta-analysis. The data set used is originally from Law et al. (1994).
}
\source{
Law, M.R., Wald, N.J., Thompson, S.G. (1994).
By how much and how quickly does reduction in serum cholesterol
concentration lower risk of ischaemic heart disease?
\emph{British Medical Journal}, \bold{308}, 367-73
}
\references{
Thompson, S. G. Sharp, S. J. (1999).
Explaining heterogeneity in meta-analysis: a comparison of methods.
\emph{Statistics in Medicine}, \bold{18}: 2693-708
}
\author{
Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show first five studies
head(dat.law1994, 5)

\dontrun{
### Load meta package
suppressPackageStartupMessages(library("meta"))

### Conduct meta-analysis
m <- metabin(ihd.exp, ihd.exp + noihd.exp, ihd.cont, ihd.cont + noihd.cont,
  data = dat.law1994, sm = "OR", method = "Inverse")

### Thompson & Sharp (1999), Table III
### (1) None
metareg(m, cholr, method.tau = "FE")
### (3a) Additive (MM)
metareg(m, cholr, method.tau = "DL")
}
}
\keyword{datasets}
\concept{epidemiology}
\concept{odds ratios}
\concept{meta-regression}
\section{Concepts}{
   epidemiology, odds ratios, meta-regression
}
