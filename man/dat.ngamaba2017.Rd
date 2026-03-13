\name{dat.ngamaba2017}
\docType{data}
\alias{dat.ngamaba2017}
\title{Association between health and well-being}
\description{Results of 29 studies examining the relationship between 
health status and subjective wellbeing.}
\usage{
dat.ngamaba2017
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{author} \tab \code{character} \tab First author and publication year. \cr
\bold{ri} \tab \code{numeric} \tab Pearson correlation coefficients. \cr
\bold{ni} \tab \code{integer} \tab Total sample size. \cr
\bold{population} \tab \code{character} \tab Type of population. \cr
\bold{country} \tab \code{character} \tab Country in which the study was conducted. \cr
}  
}
\details{
This dataset is based on a meta-analysis examining the correlation between 
health status and subjective well-being (operationalized as life 
satisfaction or happiness). Studies and their results were identified 
from a systematic review and meta-analysis by Ngamaba et al. (2017).

The dataset can be used to illustrate meta-analysis of correlation coefficients.

}
\source{Ngamaba, K. H., Panagioti, M., & Armitage, C. J. (2017). 
How strongly related are health status and subjective well-being? 
Systematic review and meta-analysis. 
\emph{The European Journal of Public Health}, \bold{27}(5), 879-885.}
\author{Mathias Harrer, \email{m.harrer@vu.nl}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.ngamaba2017
dat

\dontrun{
# Calculate Fisher's z and sampling variances
dat <- escalc("ZCOR", ri=ri, ni=ni, data=dat)
(res <- rma(yi, vi, data=dat))
predict(res, transf=transf.ztor)
}
}
\keyword{datasets}
\concept{medicine}
\concept{psychology}
\concept{epidemiology}
\concept{correlation coefficients}
\section{Concepts}{
   medicine, psychology, epidemiology, correlation coefficients
}

