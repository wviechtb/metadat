\name{dat.moore1998}
\docType{data}
\alias{dat.moore1998}
\title{Trials on Non-Steroidal Anti-Inflammatory Drugs in Acute Pain}
\description{Results from 37 trials evaluating non-steroidal anti-inflammatory drugs (NSAIDS) in patients with acute pain.}
\usage{
dat.moore1998
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{id}         \tab \code{integer}   \tab study ID \cr
\bold{author}     \tab \code{character} \tab first author \cr
\bold{year}       \tab \code{integer}   \tab publication year \cr
\bold{Ee}         \tab \code{integer}   \tab number of treatment successes (NSAIDS group) \cr
\bold{Ne}         \tab \code{integer}   \tab number of patients (NSAIDS group) \cr
\bold{Ec}         \tab \code{integer}   \tab number of treatment successes (control group) \cr
\bold{Nc}         \tab \code{integer}   \tab number of patients (control group) \cr
\bold{nonenglish} \tab \code{integer}   \tab non-English publication \cr
\bold{medline}    \tab \code{integer}   \tab listed in Medline \cr
\bold{grey}       \tab \code{integer}   \tab grey literature \cr
\bold{samecont}   \tab \code{integer}   \tab same control group \cr
\bold{journal}    \tab \code{character} \tab journal
}
}
\details{
   Moore et al. (1998) conducted a systematic review of 37 randomized placebo-controlled trials on the effectiveness and safety of topical non-steroidal anti-inflammatory drugs (NSAIDS) in acute pain. The main outcome was treatment success, defined as a reduction in pain of at least 50\%.

   This data set is used as an example in Schwarzer et al. (2015).
}
\source{
   Moore, R. A., Tramèr, M. R., Carroll, D., Wiffen, P. J., & McQuay, H. J. (1998). Quantitive systematic review of topically applied non-steroidal anti-inflammatory drugs. \emph{British Medical Journal}, \bold{316}(7128), 333--338. \verb{https://doi.org/10.1136/bmj.316.7128.333}
}
\references{
   Schwarzer, G., Carpenter, J. R., & \enc{Rücker}{Ruecker}, G. (2015). \emph{Meta-analysis with R}. Cham, Switzerland: Springer.
}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show first five studies
head(dat.moore1998, 5)

\dontrun{
### Load meta package
suppressPackageStartupMessages(library(meta))

### Conduct meta-analysis
m <- metabin(Ee, Ne, Ec, Nc, data = dat.moore1998,
  sm = "OR", studlab = id,
  label.e = "NSAIDS", label.c = "Placebo")

### Funnel plot
fun <- funnel(m, type = "contour",
  random = FALSE, pch = 16)
legend(0.25, 1.25, bty = "n",
  legend = fun$text.contour, fill = fun$col.contour)
}
}
\keyword{datasets}
\concept{medicine}
\concept{odds ratios}
\concept{publication bias}
\section{Concepts}{
   medicine, odds ratios, publication bias
}
