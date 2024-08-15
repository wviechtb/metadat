\name{dat.curtin2002}
\docType{data}
\alias{dat.curtin2002}
\title{Studies on Potassium Supplementation to Reduce Diastolic Blood Pressure}
\description{Results from 21 cross-over studies evaluating the effect of potassium supplementation to reduce diastolic blood pressure.}
\usage{
dat.curtin2002
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{author} \tab \code{character} \tab first author \cr
\bold{year}   \tab \code{character} \tab year of publication \cr
\bold{N}      \tab \code{integer}   \tab total sample size \cr
\bold{mean}   \tab \code{numeric}   \tab mean difference in diastolic blood pressure  \cr
\bold{SE}     \tab \code{numeric}   \tab standard error \cr
\bold{corr}   \tab \code{numeric}   \tab within-patient correlation \cr
}
}
\details{
   Results from 21 cross-over studies evaluating the effect of potassium supplementation to reduce diastolic blood pressure (Curtin et al., 2002, Table II).

   This data set is used as an example in Schwarzer et al. (2015), Chapter 2.
}
\source{
   Curtin, F., Altman, D. G., & Elbourne, D. (2002). Meta-analysis combining parallel and cross-over clinical trials. I: Continuous outcomes. \emph{Statistics in Medicine}, \bold{21}(15), 2131--2144. \verb{https://doi.org/10.1002/sim.1205}
}
\references{
   Schwarzer, G., Carpenter, J. R., & Rücker, G. (2015). \emph{Meta-analysis with R}. Cham, Switzerland: Springer.
}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show first five studies
head(dat.curtin2002, 5)

\dontrun{
### Load meta package
suppressPackageStartupMessages(library("meta"))

### Use DerSimonian-Laird estimator (which was the default in meta in the year 2015).
### Furthermore, print meta-analysis results with two digits.
oldset <- settings.meta(method.tau = "DL", digits = 2)

### Conduct meta-analysis
mg2 <- metagen(mean, SE, studlab = paste(author, year),
               data = dat.curtin2002, sm = "MD")
mg2

### Use previous settings
settings.meta(oldset)
}
}
\keyword{datasets}
\concept{raw mean differences}
\section{Concepts}{
   raw mean differences
}
