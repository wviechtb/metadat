\name{dat.higgins2008}
\docType{data}
\alias{dat.higgins2008}
\title{Trials on Haloperidol in Schizophrenia}
\description{Results on clinical improvement after therapy from 17 trials evaluating haloperidol in patients with schizophrenia.}
\usage{
dat.higgins2008
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{author}    \tab \code{character} \tab study label \cr
\bold{resp.halo} \tab \code{integer}   \tab number of responders (haloperidol group) \cr
\bold{fail.halo} \tab \code{integer}   \tab number of failures (haloperidol group) \cr
\bold{miss.halo} \tab \code{integer}   \tab number of missing observations (haloperidol group) \cr
\bold{resp.plac} \tab \code{integer}   \tab number of responders (placebo group) \cr
\bold{fail.plac} \tab \code{integer}   \tab number of failures (placebo group) \cr
\bold{miss.plac} \tab \code{integer}   \tab number of missing observations (placebo group)
}
}
\details{
   Higgins et al. (2008) suggested several imputation methods for the meta-analysis of binary outcomes with missing data. The example data set with 17 trials comes originally from a Cochrane review comparing haloperidol with placebo for the treatment of schizophrenia. While the antipsychotic benefits of haloperidol were identified in the 1950s, trials in this patient population are prone to high proportions of missing outcome data, often due to insufficient compliance with randomized controlled trial protocols.

   The outcome is clinical improvement after therapy. For each study, the number of responders, failures, and missing observations are available.
}
\source{
   Higgins, J. P. T., White, I. R., & Wood, A. M. (2008). Imputation methods for missing outcome data in meta-analysis of clinical trials. \emph{Clinical Trials}, \bold{5}(3), 225--239. \verb{https://doi.org/10.1177/1740774508091600}
}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show first five studies
head(dat.higgins2008, 5)

\dontrun{
### Load metasens package
suppressPackageStartupMessages(library(metasens))

### Print odds ratios and confidence limits with three digits
oldset <- settings.meta(digits = 3)

### Conduct common effect meta-analysis of available data
m <- metabin(resp.halo, resp.halo + fail.halo,
  resp.plac, resp.plac + fail.plac,
  data = dat.higgins2008, studlab = author,
  sm = "OR", method = "Inverse", random = FALSE,
  label.e = "Haloperidol", label.c = "Placebo",
  label.left = "Favours placebo",
  label.right = "Favours haloperidol")

### Best case scenario for haloperidol
m.b <- metamiss(m, miss.halo, miss.plac,
  method.miss = "b", small.values = "undesirable")

### Worst case scenario for haloperidol
m.w <- metamiss(m, miss.halo, miss.plac,
  method.miss = "w", small.values = "undesirable")

### Forest plot
m.sens <- metamerge(m, m.b, text.pooled2 = "Best case scenario")
m.sens <- metamerge(m.sens, m.w, text.pooled2 = "Worst case scenario")
forest(m.sens)
}
}
\keyword{datasets}
\concept{psychiatry}
\concept{odds ratios}
\concept{missing data}
\section{Concepts}{
   psychiatry, odds ratios, missing data
}
