\name{dat.nakagawa2007}
\docType{data}
\alias{dat.nakagawa2007}
\title{Assessing the function of house sparrows' bib size using a flexible meta-analysis method}
\description{A meta-analysis on the association between the size of a males bib and their social status in house sparrows (Passer domesticus).}
\usage{dat.nakagawa2007}
\format{
The data frame dat.nakagawa2007 contains the following columns:
\tabular{lll}{
\bold{StudyID} \tab \code{factor} \tab identitiy of primary study \cr
\bold{Place} \tab \code{factor} \tab location of study population \cr
\bold{Correlation} \tab \code{numeric} \tab correlation coefficient, which is the effect size \cr
\bold{SampleSize} \tab \code{integer} \tab sample size of population \cr
}  
}
\details{Each study measures the association between a sparrows bib size and its social status. Effects are quantified as correlation coefficients.}
\source{Nakagawa, S., Ockendon, N., Gillespie, D.O.S, Hatchwell, B.J. & Burke, T. 2007. Assessing the function of house sparrows' bib size using a flexible meta-analysis method. \emph{Behavioral Ecology}, \bold{18}, 831-840}
\author{Alistair Senior, \email{alistair.senior@sydney.edu.au}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.nakagawa2007
dat
}
\keyword{datasets}
\concept{ecology}
\concept{correlation}
