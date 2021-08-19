\name{dat.nakagawa2007}
\docType{data}
\alias{dat.nakagawa2007}
\title{Assessing the function of house sparrows' bib size using a flexible meta-analysis method}
\description{A meta-analysis on the association between the size of a males bib and their social status in house sparrows (\emph{Passer domesticus})}
\usage{
dat.nakagawa2007
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{StudyID} \tab \code{character} \tab identitiy of primary study \cr
\bold{Place} \tab \code{character} \tab location of study population \cr
\bold{Correlation} \tab \code{numeric} \tab correlation coefficient, which is the effect size \cr
\bold{SampleSize} \tab \code{integer} \tab sample size of population \cr
}  
}
\details{Each study measures the association between a sparrows bib size and its social status. Effects are quantified as correlation coefficients.}
\source{Nakagawa, S., Ockendon, N., Gillespie, D.O.S, Hatchwell, B.J. & Burke, T. 2007. Assessing the function of house sparrows' bib size using a flexible meta-analysis method. \emph{Behavioral Ecology}, \bold{18}, 831-840}
\author{Daniel Noble, \email{daniel.noble@anu.edu.au}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.nakagawa2007
dat

\dontrun{

## load library
	library(metafor)

## calculate Zr
	dat <- escalc(measure="ZCOR", ri=Correlation, ni=SampleSize, data=dat)

## fit meta-analytic model
	res <- rma.mv(yi, vi,
        random = list(~ 1 | StudyID),
        data=dat)
	res

}
}
\keyword{datasets}
\concept{ecology}
\concept{correlation coefficients}
