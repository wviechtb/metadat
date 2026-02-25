\name{dat.steurer2006}
\docType{data}
\alias{dat.steurer2006}
\title{Trials on Single-Agent Purine Analogues for the Treatment of Chronic Lymphocytic Leukaemia}
\description{Results from 4 trials evaluating single-agent purine analogues in patients with chronic lymphocytic leukaemia.}
\usage{
dat.steurer2006
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{author} \tab \code{character} \tab first author \cr
\bold{year}   \tab \code{integer}   \tab publication year \cr
\bold{Ne}     \tab \code{integer}   \tab number of patients (purine antagonists) \cr
\bold{Nc}     \tab \code{integer}   \tab number of patients (alkylator-based) \cr
\bold{HR}     \tab \code{numeric}   \tab hazard ratio \cr
\bold{lowHR}  \tab \code{numeric}   \tab lower limit \cr
\bold{uppHR}  \tab \code{numeric}   \tab upper limit \cr
\bold{lnHR}   \tab \code{numeric}   \tab log hazard ratio \cr
\bold{selnHR} \tab \code{numeric}   \tab standard error
}
}
\details{
   Steurer et al. (2006) conducted a Cochrane review to evaluate the effect of single-agent purine analogues for the treatment of chronic lymphocytic leukaemia. This dataset contains data from the main outcome, overall survival. Note, the hazard ratios and confidence limits have been reported in the Cochrane review with only two significant figures and were recalculated using the reported log hazard ratios and standard errors.

   This data set is used as an example in Schwarzer et al. (2015).
}
\source{
   Steurer, M., Pall, G., Richards, S., Schwarzer, G., Bohlius, J., & Greil, R. (2006). Purine antagonists for chronic lymphocytic leukaemia. \emph{Cochrane Database of Systematic Reviews}, \bold{3}, CD004270. \verb{https://doi.org/10.1002/14651858.cd004270.pub2}
}
\references{
   Schwarzer, G., Carpenter, J. R., & \enc{Rücker}{Ruecker}, G. (2015). \emph{Meta-analysis with R}. Cham, Switzerland: Springer.
}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show dataset
dat.steurer2006

\dontrun{
### Load meta package
suppressPackageStartupMessages(library(meta))

### Use RevMan 5 settings
oldset <- settings.meta("RevMan5")

### Conduct common effect meta-analysis
m1 <- metagen(lnHR, selnHR, data = dat.steurer2006,
  studlab = paste(author, year),
  sm = "HR", random = FALSE, n.e = Ne, n.c = Nc)
m1

### Same analysis using lower and upper confidence limits
m2 <- metagen(HR, lower = lowHR, upper = uppHR,
  data = dat.steurer2006, transf = FALSE,
  studlab = paste(author, year),
  sm = "HR", random = FALSE, n.e = Ne, n.c = Nc)
m2

### Use previous settings
settings.meta(oldset)
}
}
\keyword{datasets}
\concept{medicine}
\concept{oncology}
\concept{hazard ratios}
\section{Concepts}{
   medicine, oncology, hazard ratios
}
