\name{dat.tamim2011}
\docType{data}
\alias{dat.tamim2011}
\title{What Forty Years of Research Says About the Impact of Technology on Learning: A
Second-Order Meta-Analysis and Validation Study}
\description{Results from 25 meta-analyses on the effects of technology on learning.}
\usage{dat.tamim2011}
\format{The data frame contains the following columns:
  \tabular{lll}{
    \bold{author}        \tab \code{character}   \tab first author name \cr
    \bold{year}        \tab \code{integer}   \tab year published \cr
    \bold{k}        \tab \code{integer}   \tab number of effect sizes in meta-analysis \cr
    \bold{type}        \tab \code{character}   \tab type of effect size in meta-analysis \cr
    \bold{yi}        \tab \code{numeric}   \tab effect size \cr
    \bold{sei}        \tab \code{numeric}   \tab standard error of effect size \cr
    \bold{n_overlap}        \tab \code{integer}   \tab number of overlapping studies in this with other meta-analyses \cr
    \bold{percent_overlap}        \tab \code{numeric}   \tab percentage of all studies that are of overlapping with other meta-analyses \cr
   }
}
\details{
   Each study included in this meta-analysis is itself a meta-analysis on the effects of technology on learning; a 'second-order meta-analysis'. Each effect size here is an overall effect size as estimated by that first-order meta-analysis. This individual studies quantified overall effects as Cohen's d, Hedges g, Glass's delta, which are all variations on the standardised mean difference. The authors assume that any heterogeneity arising due to differences between effect sizes are minimal. A number of the original studies also used correlation coefficients, although these have been converted to Cohen's d here.
   
   The first order meta-analyses may have some overlap, in their primary literature, which is expressed in the data set as a number, and percentage of all studies, that are observed across meta-analyses.
}
\source{
   Tamim, R.A, Bernard, R.M., Borokhovski, E., Abrami, P.C. & Schmid, R.F. (2011). What Forty Years of Research Says About the Impact of Technology on Learning: A
Second-Order Meta-Analysis and Validation Study. \emph{Review of Educational Research}, \bold{81}, 4--28.
}
\author{Alistair M Senior, \email{alistair.senior@sydney.edu.au}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.tamim2011
dat
if(require(metafor)){
	# fit a random-effects meta-analysis
	REMA<-rma(yi = yi, sei=sei, data=dat)
	summary(REMA)
	forest(REMA)
}

}
\keyword{datasets}
\concept{sociology}
\concept{education}
\concept{standardized mean difference}
\concept{second-order meta-analysis}