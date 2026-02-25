\name{dat.greenland1992}
\docType{data}
\alias{dat.greenland1992}
\title{Case-Control Studies on the Impact of Alcohol Consumption on Breast Cancer Risk}
\description{Results from 16 case-control studies evaluating the impact of alcohol consumption on breast cancer risk.}
\usage{
dat.greenland1992
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{author} \tab \code{character} \tab first author \cr
\bold{year}   \tab \code{integer}   \tab publication year \cr
\bold{b}      \tab \code{numeric}   \tab adjusted log risk ratio \cr
\bold{SE}     \tab \code{numeric}   \tab standard error
}
}
\details{
   Greenland and Longecker (1992) describe a method to combine trend estimates from summarized dose-response data. A meta-analysis of 16 case-control studies evaluating the impact of alcohol consumption on breast cancer risk was used as an illustrative example. The estimates are the increase in the log relative risk of breast cancer associated with an average daily alcohol consumption of 1g.

   Data are provided in Greenland and Longecker (1992), Table 3.
}
\source{
   Greenland, S., & Longnecker, M. P. (1992). Methods for trend estimation from summarized dose-response data, with applications to meta-analysis. \emph{American Journal of Epidemiology}, \bold{135}(11), 1301--1309. \verb{https://doi.org/10.1093/oxfordjournals.aje.a116237}
}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show first 6 rows of the dataset
head(dat.greenland1992)

\dontrun{
### Load meta package
suppressPackageStartupMessages(library(meta))

### Inverse variance method
mg <- metagen(b, SE, data = dat.greenland1992,
  studlab = paste(author, year), sm = "RR",
  random = FALSE, overall.hetstat = FALSE,
  backtransf = FALSE)

### Overall result
print(mg, digits = 5)

### Standard error for common effect estimate
round(mg$seTE.common, 5)
}
}
\keyword{datasets}
\concept{epidemiology}
\concept{risk ratios}
\section{Concepts}{
   epidemiology, risk ratios
}
