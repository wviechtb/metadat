\name{dat.franchini2012}
\docType{data}
\alias{dat.franchini2012}
\title{Studies on Dopamine Agonists to Reduce \dQuote{Off-Time} in Patients with Advanced Parkinson Disease}
\description{Results from 7 trials examining the effectiveness of four dopamine agonists and placebo to reduce \dQuote{off-time} in patients with advanced Parkinson disease.}
\usage{
dat.franchini2012
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{Study}      \tab \code{character} \tab study label \cr
\bold{Treatment1} \tab \code{character} \tab treatment 1 \cr
\bold{y1}         \tab \code{numeric}   \tab treatment effect arm 1 \cr
\bold{sd1}        \tab \code{numeric}   \tab standard deviation arm 2 \cr
\bold{n1}         \tab \code{integer}   \tab sample size arm 1 \cr
\bold{Treatment2} \tab \code{character} \tab treatment 2 \cr
\bold{y2}         \tab \code{numeric}   \tab treatment effect arm 2 \cr
\bold{sd2}        \tab \code{numeric}   \tab standard deviation arm 2 \cr
\bold{n2}         \tab \code{integer}   \tab sample size arm 1 \cr
\bold{Treatment3} \tab \code{character} \tab treatment 3 \cr
\bold{y3}         \tab \code{numeric}   \tab treatment effect arm 3 \cr
\bold{sd3}        \tab \code{numeric}   \tab standard deviation arm 2 \cr
\bold{n3}         \tab \code{integer}   \tab sample size arm 1
}
}
\details{
   This network meta-analysis compared the effectiveness of four active treatments and placebo in patients with advanced Parkinson disease (Franchini et al., 2012). The outcome is mean lost work-time reduction in patients given dopamine agonists as adjunct therapy. The data are given as sample size, mean, and standard deviation in each trial arm.

   This dataset was used as an example in the supplemental material of Dias et al. (2013) where placebo is coded as 1 and the four active drugs as 2 to 5.
}
\source{
   Dias, S., Sutton, A. J., Ades, A. E., & Welton, N. J. (2013). Evidence synthesis for decision making 2: A generalized linear modeling framework for pairwise and network meta-analysis of randomized controlled trials. \emph{Medical Decision Making}, \bold{33}(5), 607--617. \verb{https://doi.org/10.1177/0272989X12458724}

   Franchini, A. J., Dias, S., Ades, A. E., Jansen, J. P., & Welton, N. J. (2012). Accounting for correlation in network meta-analysis with multi-arm trials. \emph{Research Synthesis Methods}, \bold{3}(2), 142--160. \verb{https://doi.org/10.1002/jrsm.1049}
}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show results from first three studies; third study is a three-arm
### study
head(dat.franchini2012, 3)

\dontrun{
### Load netmeta package
suppressPackageStartupMessages(library("netmeta"))

### Print mean differences with two digits
oldset <- settings.meta(digits = 2)

### Transform data from wide arm-based format to contrast-based
### format. Argument 'sm' must not be provided as the mean difference
### is the default in R function metacont() called internally.
pw <- pairwise(list(Treatment1, Treatment2, Treatment3),
  n = list(n1, n2, n3),
  mean = list(y1, y2, y3),
  sd = list(sd1, sd2, sd3),
  data = dat.franchini2012, studlab = Study, sm = "MD")

### Show calculated mean differences (TE) for first three studies
pw[1:5, c(3:7, 10, 1)]

### Conduct network meta-analysis
net <- netmeta(pw)
net

### Draw network graph
netgraph(net, points = TRUE, cex.points = 3, cex = 1.5,
  plastic = TRUE, thickness = "se.fixed",
  iterate = TRUE, start = "eigen")

### Use previous settings
settings.meta(oldset)
}
}
\keyword{datasets}
\concept{medicine}
\concept{raw mean differences}
\concept{network meta-analysis}
\section{Concepts}{
   medicine, raw mean differences, network meta-analysis
}
