\name{dat.jordan2017}
\docType{data}
\alias{dat.jordan2017}
\title{Prescription opioid misuse in US adolescents and young adults}
\description{Results of 15 studies examining the prevalence of prescription opioid misuse 
among adolescents and young adults in the United States.}
\usage{
dat.jordan2017
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study} \tab \code{character} \tab First author and year of the study. \cr
\bold{xi} \tab \code{integer} \tab Number of opioid misuse cases. \cr
\bold{ni} \tab \code{integer} \tab Total sample size of the study. \cr
}  
}
\details{Studies included in this dataset were identified through a 
meta-analysis by Jordan et al. (2017), which examined the pooled 
prevalence of prescription opioid misuse among US individuals 11 to 30 years of age. 

The dataset is meant for instructional purposes, and only contains a 
subset of the studies included in the original review. Results are 
therefore not identical with the actual results of the meta-analysis by Jordan et al., 
and should not be seen as representative of the evidence.

The dataset can be used to illustrate meta-analyses of prevalence rates (see Examples). 
}
\source{
Jordan, A. E., Blackburn, N. A., Des Jarlais, D. C., & Hagan, H. (2017). 
Past-year prevalence of prescription opioid misuse among those 11 to 30 
years of age in the United States: A systematic review and meta-analysis. 
\emph{Journal of Substance Abuse Treatment}, \bold{77}, 31-37.
}
\author{Mathias Harrer, \email{m.harrer@vu.nl}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.jordan2017
dat

\dontrun{
library(metafor)

# Calculate logit-transformed proportions
dat <- escalc(xi=xi, ni=ni, measure="PLO", data=dat)

# Pool logit-transformed proportions
(res <- rma(yi=yi, vi=vi, dat=dat))
predict(res, transf=transf.ilogit)

# Pool using mixed-effects logistic regression
(res <- rma.glmm(measure="PLO", xi=xi, ni=ni, dat=dat))
predict(res, transf=transf.ilogit)
}
}
\keyword{datasets}
\concept{epidemiology}
\concept{psychiatry}
\concept{proportions}
\section{Concepts}{
   epidemiology, psychiatry, proportions
}
