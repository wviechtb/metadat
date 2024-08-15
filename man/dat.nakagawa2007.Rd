\name{dat.nakagawa2007}
\docType{data}
\alias{dat.nakagawa2007}
\title{Assessing the Function of House Sparrows' Bib Size Using a Flexible Meta-Analysis Method}
\description{A meta-analysis on the association between the size of a male's bib and their social status in house sparrows (\emph{Passer domesticus}).}
\usage{
dat.nakagawa2007
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{StudyID}     \tab \code{character} \tab identity of primary study \cr
\bold{Place}       \tab \code{character} \tab location of study population \cr
\bold{Correlation} \tab \code{numeric}   \tab correlation coefficient \cr
\bold{SampleSize}  \tab \code{integer}   \tab sample size of population \cr
}
}
\details{
   Each study measures the association between a sparrows bib size and its social status. Effects are quantified as correlation coefficients.
}
\source{
   Nakagawa, S., Ockendon, N., Gillespie, D. O. S, Hatchwell, B. J., & Burke, T. (2007). Assessing the function of house sparrows' bib size using a flexible meta-analysis method. \emph{Behavioral Ecology}, \bold{18}(5), 831--840. \verb{https://doi.org/10.1093/beheco/arm050}
}
\author{
   Daniel Noble, \email{daniel.noble@anu.edu.au}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.nakagawa2007
dat

\dontrun{
### load metafor package
library(metafor)

### calculate Zr
dat <- escalc(measure="ZCOR", ri=Correlation, ni=SampleSize, data=dat)

### fit meta-analytic model
res <- rma.mv(yi, vi, random = ~ 1 | StudyID, data=dat)
res
}
}
\keyword{datasets}
\concept{ecology}
\concept{correlation coefficients}
\section{Concepts}{
   ecology, correlation coefficients
}
