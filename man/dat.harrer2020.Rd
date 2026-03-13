\name{dat.harrer2020}
\docType{data}
\alias{dat.harrer2020}
\title{Effects of preventive interventions on eating disorder onset in university students}
\description{Results of five randomized trials reporting the incidence of eating disorders in university students receiving preventive psychological intervention versus inactive controls.}
\usage{
dat.harrer2020
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study} \tab \code{character} \tab First author and year of the study. \cr
\bold{x1i} \tab \code{integer} \tab Number of new cases of eating disorders in the intervention group. \cr
\bold{t1i} \tab \code{integer} \tab Person-time at risk in the intervention group. \cr
\bold{x2i} \tab \code{integer} \tab Number of new cases of eating disorders in the control group.  \cr
\bold{t2i} \tab \code{integer} \tab Person-time at risk in the control group. \cr
}  
}
\details{
This dataset was used in a meta-analysis examining the effect of preventive eating disorder interventions 
at universities (Harrer et al., 2020). The dataset refers to the analysis in which the treatment arms of trials 
with more than one intervention group were combined so that each study in the meta-analysis is statistically 
independent, resulting in slightly different results than the ones reported in the abstract of the article. 
Person time at risk values were rounded and therefore differ slightly from the ones reported in the study.

The dataset can be used to illustrate a meta-analysis of time-to-event outcomes.

}
\source{
Harrer, M., Adam, S. H., Messner, E. M., Baumeister, H., Cuijpers, P., Bruffaerts, R., ... & Ebert, D. D. (2020). Prevention of eating disorders at universities: A systematic review and meta-analysis. \emph{International Journal of Eating Disorders}, \bold{53}(6).
}
\author{Mathias Harrer, \email{m.harrer@vu.nl}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.harrer2020
dat

\dontrun{
library(metafor)

# Pool event counts and person-time at risk
# log-IRR is calculated as the outcome measure
res <- rma(x1i = x1i, x2i = x2i, t1i = t1i, t2i = t2i,
           slab = study, data = dat, measure = "IRR")

# Get result as IRRs on the original scale
predict(res, transf=exp)
}
}
\keyword{datasets}
\concept{psychiatry}
\concept{psychology}
\concept{incidence rates}
\section{Concepts}{
   psychiatry, psychology, incidence rates
}
