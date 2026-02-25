\name{dat.moller2015}
\docType{data}
\alias{dat.moller2015}
\title{Ionizing radiation from Chernobyl and mutation rates in humans}
\description{Results of 14 studies reporting correlations between exposure to ionizing radiation due to the 1986 Chernobyl reactor disaster and mutation rates in humans.}
\usage{
dat.moller2015
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{author} \tab \code{character} \tab First author of the study and publication year. \cr
\bold{ri} \tab \code{numeric} \tab Pearson correlation between radiation exposure and mutation rates. \cr
\bold{ni} \tab \code{integer} \tab Size of the sample. \cr
\bold{yi} \tab \code{numeric} \tab Fisher's \emph{z}-transformed correlation. \cr
\bold{sei} \tab \code{numeric} \tab Standard error of \emph{z}. \cr
\bold{vi} \tab \code{numeric} \tab Sampling variance of \emph{z}. \cr
\bold{radiation} \tab \code{character} \tab Overall amount of exposure in the study sample. \cr
\bold{es.id} \tab \code{character} \tab Unique identifier for each outcome measure in the dataset. \cr
}  
}
\details{
This data set is based on studies assessing mutations in humans exposed to 
radioactive fallout of the Chernobyl reactor incident, as identified in 
Møller & Mousseau (2015). Several studies report more than one estimate of the 
association between radiation exposure and mutation rate, which generates a nested 
data structure (effect sizes are nested in studies). A variable \code{es.id} was added to the data set, coding the clustered data 
structure. The dataset contains the untransformed correlation and sample size, 
as well as the Fisher's \emph{z}-transformed correlation, along with their 
standard error and variance. Please note that the values and the set of studies in this dataset are not 
exactly identical to the ones in Møller & Mousseau (2015), and results may 
therefore differ from the ones reported in this review.

The dataset can be used to illustrate the use of multilevel hierarchical pooling models
to accommodate the nested data structure (multiple correlation estimates per study).
}
\source{
Møller, A. P., & Mousseau, T. A. (2015). Strong Effects of Ionizing Radiation 
from Chernobyl on Mutation Rates. \emph{Scientific Reports}, \bold{5}, 8363.
}
\author{Mathias Harrer, \email{m.harrer@vu.nl}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.moller2015
dat

\dontrun{
# Run multilevel hierarchical regression model
library(metafor)
res <- rma.mv(yi, vi, slab=author, data=dat,
              random= ~1|author/es.id)
predict(res, transf=transf.ztor)
}
}
\keyword{datasets}
\concept{medicine}
\concept{genetics}
\concept{epidemiology}
\concept{correlation coefficients}
\concept{multilevel models}
\section{Concepts}{
   medicine, genetics, epidemiology, correlation coefficients, multilevel models
}
