\name{dat.lloyd2010}
\docType{data}
\alias{dat.lloyd2010}
\title{Studies on Anti-TNF-alpha Inhibitors in Rheumatoid Arthritis}
\description{Results from 16 studies evaluating anti-TNF-alpha inhibitors in patients with rheumatoid arthritis.}
\usage{
dat.lloyd2010
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{author} \tab \code{character} \tab first author \cr
\bold{year} \tab \code{integer} \tab publication year \cr
\bold{mean.das} \tab \code{numeric} \tab mean for outcome DAS-28 \cr
\bold{lower.das} \tab \code{numeric} \tab lower limit for outcome DAS-28 \cr
\bold{upper.das} \tab \code{numeric} \tab upper limit for outcome DAS-28 \cr
\bold{mean.haq} \tab \code{numeric} \tab  mean for outcome HAQ \cr
\bold{lower.haq} \tab \code{numeric} \tab lower limit for outcome HAQ \cr
\bold{upper.haq} \tab \code{numeric} \tab upper limit for outcome HAQ \cr
\bold{n} \tab \code{integer} \tab sample size \cr
}  
}
\details{
Lloyd et al. (2010) report results of a systematic review evaluating the effectiveness of anti-TNF-alpha inhibitors in the treatment of rheumatoid arthritis. The authors conducted separate meta-analyses for HAQ and DAS-28.
}
\source{
Lloyd, S., Bujkiewicz, S., Wailoo, A.J., et al. (2010). The effectiveness of anti-TNF-alpha therapies when used sequentially in rheumatoid arthritis patients: A systematic review and meta-analysis. \emph{Rheumatology (Oxford)}, \bold{49}, 2313-21. \verb{https://doi.org/10.1093/rheumatology/keq169}
}
\author{
Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show first five studies
head(dat.lloyd2010, 5)

\dontrun{
### Load meta package
suppressPackageStartupMessages(library("meta"))

### Only consider studies providing data for both outcomes
lloyd5 <- subset(dat.lloyd2010, !is.na(mean.haq) & !is.na(mean.das))

### Univariate meta-analysis of the DAS-28 outcome
m.das <- metagen(mean.das,
  lower = lower.das, upper = upper.das,
  data = lloyd5, sm = "MD",
  studlab = paste(author, year),
  random = FALSE)
### Univariate meta-analysis of the HAQ outcome
m.haq <- metagen(mean.haq,
  lower = lower.haq, upper = upper.haq,
  data = lloyd5, sm = "MD",
  studlab = paste(author, year),
  random = FALSE)

### Forest plots
forest(m.das, test.overall = TRUE, hetstat = FALSE,
  digits.TE = 2, digits.se = 2)
forest(m.haq, test.overall = TRUE, hetstat = FALSE,
  digits.TE = 2, digits.se = 2)
}
}
\keyword{datasets}
\concept{medicine}
\concept{raw mean differences}
\section{Concepts}{
   medicine, raw mean differences
}
