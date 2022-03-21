\name{dat.woods2010}
\docType{data}
\alias{dat.woods2010}
\title{Studies on Treatments for Chronic Obstructive Pulmonary Disease}
\description{Results from 3 trials examining the mortality risk of three treatments and placebo in patients with chronic obstructive pulmonary disease.}
\usage{
dat.woods2010
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{author}    \tab \code{character} \tab first author / study name \cr
\bold{treatment} \tab \code{character} \tab treatment \cr
\bold{r}         \tab \code{integer}   \tab number of deaths \cr
\bold{N}         \tab \code{integer}   \tab number of patients
}
}
\details{
   Count mortality statistics in randomised controlled trials of treatments for chronic obstructive pulmonary disease (Woods et al., 2010, Table 1).
}
\source{
   Woods, B. S., Hawkins, N., & Scott, D. A. (2010). Network meta-analysis on the log-hazard scale, combining count and hazard ratio statistics accounting for multi-arm trials: A tutorial. \emph{BMC Medical Research Methodology}, \bold{10}, 54. \verb{https://doi.org/10.1186/1471-2288-10-54}
}
\author{
   Guido Schwarzer, \email{sc@imbi.uni-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show full data set
dat.woods2010

\dontrun{

### Load netmeta package
suppressPackageStartupMessages(library(netmeta))

### Print odds ratios and confidence limits with two digits
settings.meta(digits = 2)

### Change appearance of confidence intervals
cilayout("(", "-")

### Transform data from long arm-based format to contrast-based
### format. Argument 'sm' has to be used for odds ratio as summary
### measure; by default the risk ratio is used in the metabin function
### called internally.
pw <- pairwise(treatment, event = r, n = N,
  studlab = author, data = dat.woods2010, sm = "OR")
pw

### Conduct network meta-analysis
net <- netmeta(pw)
net

### Show forest plot
forest(net, ref = "Placebo", drop = TRUE,
  leftlabs = "Contrast to Placebo")

}
}
\keyword{datasets}
\concept{medicine}
\concept{odds ratios}
\concept{network meta-analysis}
\section{Concepts}{
   medicine, odds ratios, network meta-analysis
}
