\name{dat.ho2012}
\docType{data}
\alias{dat.ho2012}
\title{Studies on the Efficacy Eye Movement Desensitization and reprocessing (EMDR) and Exposure Based Cognitive Behaviour Therapy (CBT) for Treating Post-Traumatic Stress Disorder (PTSD)}
\description{Results from 10 studies on the efficacy of EMDR versus CBT for treating PTSD.}
\usage{dat.ho2012}
\format{The data frame contains the following columns:
\tabular{lll}{
\bold{author}  \tab \code{character} \tab study authors \cr
\bold{yi}       \tab \code{numeric}   \tab Hedges' \italic{g} standardized mean difference \cr
\bold{sei}       \tab \code{numeric}   \tab standard error of Hedges' \italic{g} standardized mean difference
}
}
\details{
   The difference between EMDR and exposure-based CBT are indicated by the Hedges' \italic{g} effect sizes. These data are in Figure 1 of Ho and Lee (2012).
}
\source{
   Ho M. S. K. & Lee C. W. (2012). Cognitive behaviour therapy versus eye movement desensitization and reprocessing for post-traumatic disorder-is it all in the homework then?. \emph{European Review of Applied Psychology}, \bold{62}, 253--260.
}
\author{Robbie C.M. van Aert, \email{R.C.M.vanAert@tilburguniversity.edu}}
\examples{
if (require(metafor)) {

### copy data into 'dat' and examine data
dat <- dat.ho2012
dat

### random-effects model
rma(yi = yi, sei = sei, data = dat)

}
}
\keyword{datasets}
