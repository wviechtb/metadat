\name{dat.demir2022}
\docType{data}
\alias{dat.demir2022}
\title{Studies on the Reliability of the MIBS Scale}
\description{Results from 26 studies on the reliability of the Mother-to-Infant Bonding Scale (MIBS).}
\usage{
dat.demir2022
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{studyid}      \tab \code{numeric}   \tab study ID \cr
\bold{esid}         \tab \code{numeric}   \tab effect size ID \cr
\bold{author}       \tab \code{character} \tab author(s) of the study \cr
\bold{year}         \tab \code{numeric}   \tab publication year \cr
\bold{pubtype}      \tab \code{character} \tab publication type (Article or Thesis) \cr
\bold{country}      \tab \code{character} \tab country \cr
\bold{participants} \tab \code{character} \tab participant characteristics \cr
\bold{n}            \tab \code{numeric}   \tab sample size \cr
\bold{alpha}        \tab \code{numeric}   \tab Cronbach's alpha \cr
\bold{items}        \tab \code{numeric}   \tab number of items in the scale
}
}
\details{
   The Mother-to-Infant Bonding Scale (MIBS) is an 8-item Likert-type questionnaire to evaluate caregiver-infant attachment. Demir et al. (2022) carried out a meta-analysis of 26 studies (reporting 33 Cronbach's alpha values) to assess the reliability of the scale.
}
\source{
   Demir, E., Öz, S., Aral, N., & Gürsoy, F. (2022). A reliability generalization meta-analysis of the Mother-to-Infant Bonding Scale. \emph{Psychological Reports}, \bold{127}(1), 447--464. \verb{https://doi.org/10.1177/00332941221114413}
}
\author{
   Wolfgang Viechtbauer, \email{wvb@metafor-project.org}, \url{https://www.metafor-project.org}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.demir2022
dat

\dontrun{
### load metafor package
library(metafor)

### transform the alpha values using the Bonett (2022) transformation
dat <- escalc(measure="ABT", ai=alpha, ni=n, mi=items, data=dat)
dat

### meta-analysis using a random-effects model
res <- rma(yi, vi, data=dat)
res

### back-transform the results
predict(res, transf=transf.iabt, digits=2)
}
}
\keyword{datasets}
\concept{psychology}
\concept{Cronbach's alpha}
\concept{reliability generalization}
\section{Concepts}{
   psychology, Cronbach's alpha, reliability generalization
}
