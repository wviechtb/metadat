\name{dat.quan2000}
\docType{data}
\alias{dat.quan2000}
\title{Studies on Pharmacotherapy for Hypertension}
\description{Results from 11 studies evaluating pharmacotherapy in patients with hypertension.}
\usage{
dat.quan2000
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study} \tab \code{character} \tab study label \cr
\bold{Ee}    \tab \code{integer}   \tab fatal cerebrovascular events (pharmacotherapy) \cr
\bold{Ne}    \tab \code{integer}   \tab number of patients (pharmacotherapy) \cr
\bold{Ec}    \tab \code{integer}   \tab fatal cerebrovascular events (control) \cr
\bold{Nc}    \tab \code{integer}   \tab number of patients (control)
}
}
\details{
   Quan et al. (2000) conducted a Cochrane Review to evaluate whether the benefit of treating hypertension in women differed between younger and older women, as well as between white and African American women. In the systematic review, the Peto method was used for pooling. The primary outcome was the occurrence of fatal cerebrovascular events, a rare event in hypertension. The dataset contains the subgroup of women older than 55 years.

   This data set is used as an example in Schwarzer et al. (2015).
}
\source{
   Quan, A. P., Kerlikowske, K., Gueyffier, F., Boissel, J.-P., & INDANA Investigators (2010). Pharmacotherapy for hypertension in women of different races. \emph{Cochrane Database of Systematic Reviews}, \bold{2}, CD002146. \verb{https://doi.org/10.1002/14651858.cd002146}
}
\references{
   Schwarzer, G., Carpenter, J. R., & \enc{Rücker}{Ruecker}, G. (2015). \emph{Meta-analysis with R}. Cham, Switzerland: Springer.
}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show first five studies
head(dat.quan2000, 5)

\dontrun{
### Load meta package
suppressPackageStartupMessages(library(meta))

### Use RevMan 5 settings
oldset <- settings.meta("RevMan5")

### Conduct meta-analyis with Peto method
m <- metabin(Ee, Ne, Ec, Nc, sm = "OR", method = "Peto",
  data = dat.quan2000, studlab = study, random = FALSE)
m

### Use previous settings
settings.meta(oldset)
}
}
\keyword{datasets}
\concept{medicine}
\concept{cardiology}
\concept{Peto's method}
\section{Concepts}{
   medicine, cardiology, Peto's method
}
