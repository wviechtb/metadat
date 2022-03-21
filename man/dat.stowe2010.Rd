\name{dat.stowe2010}
\docType{data}
\alias{dat.stowe2010}
\title{Studies on Adjuvant Treatments to Levodopa Therapy for Parkinson disease}
\description{Results from 29 trials assessing efficacy of three drug classes as adjuvant treatment to levodopa therapy in patients with Parkinson disease and motor complications.}
\usage{
dat.stowe2010
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study} \tab \code{character} \tab study label \cr
\bold{id}    \tab \code{integer}   \tab study id \cr
\bold{t1}    \tab \code{character} \tab treatment 1 \cr
\bold{y1}    \tab \code{numeric}   \tab treatment effect arm 1 \cr
\bold{sd1}   \tab \code{numeric}   \tab standard deviation arm 1 \cr
\bold{n1}    \tab \code{integer}   \tab sample size arm 1 \cr
\bold{t2}    \tab \code{character} \tab treatment 2 \cr
\bold{y2}    \tab \code{numeric}   \tab treatment effect arm 2 \cr
\bold{sd2}   \tab \code{numeric}   \tab standard deviation arm 2 \cr
\bold{n2}    \tab \code{integer}   \tab sample size arm 2 \cr
\bold{t3}    \tab \code{character} \tab treatment 3 \cr
\bold{y3}    \tab \code{numeric}   \tab treatment effect arm 3 \cr
\bold{sd3}   \tab \code{numeric}   \tab standard deviation arm 3 \cr
\bold{n3}    \tab \code{integer}   \tab sample size arm 3
}
}
\details{
   This data set contains data from a Cochrane review assessing efficacy and safety of three drug classes as adjuvant treatment to levodopa therapy in patients with Parkinson disease and motor complications (Stowe et al., 2010).

   The authors conducted three pairwise meta-analyses comparing dopamine agonists, catechol-O-methyl transferase inhibitors (COMTI), and monoamine oxidase type B inhibitors (MAOBI) with placebo. The primary outcome was the mean reduction of the time spent in a relatively immobile \sQuote{off} phase (mean off-time), calculated in hours per day. Relative treatment effects were expressed as mean difference. Data on this outcome were available for 5,331 patients from 28 studies comparing an active treatment with placebo and one three-arm study comparing two active treatments with placebo.
}
\source{
   Stowe, R., Ives, N., Clarke, C. E., Deane, K., Hilten, V., Wheatley, K., Gray, R., Handley, K., & Furmston, A. (2010). Evaluation of the efficacy and safety of adjuvant treatment to levodopa therapy in Parkinson's disease patients with motor complications. \emph{Cochrane Database of Systematic Reviews}, \bold{7}, CD007166. \verb{https://doi.org/10.1002/14651858.CD007166.pub2}
}
\author{
   Guido Schwarzer, \email{sc@imbi.uni-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show results from three studies (including three-arm study LARGO)
dat.stowe2010[18:20, ]

\dontrun{

### Load netmeta package
suppressPackageStartupMessages(library(netmeta))

### Print mean differences with two digits and standard errors with 3
### digits
settings.meta(digits = 2, digits.se = 3)

### Transform data from wide arm-based format to contrast-based
### format. Argument 'sm' must not be provided as the mean difference
### is the default in R function metacont() called internally.
pw <- pairwise(treat = list(t1, t2, t3), n = list(n1, n2, n3),
  mean = list(y1, y2, y3), sd = list(sd1, sd2, sd3),
  studlab = study, data = dat.stowe2010, sm = "MD")

### Show calculated mean differences (TE) for three studies
selstudy <- c("COMTI(E) INT-OZ", "LARGO", "COMTI(E) Nomecomt")
subset(pw, studlab \%in\% selstudy)[, c(3:7, 10, 1)]

### Conduct random effects network meta-analysis (NMA)
### with placebo as reference
net <- netmeta(pw, fixed = FALSE, ref = "plac")

### Show network graph
netgraph(net, number = TRUE, multiarm = TRUE,
  cex = 1.25, offset = 0.025,
  cex.number = 1, pos.number.of.studies = 0.3)

### Print NMA results
net

### Forest plot with NMA results
forest(net)

### Forest plot showing all network estimates of active treatments
### compared with other treatments
forest(net, ref = c("C", "D", "M"), baseline = FALSE, drop = TRUE)

### Treatment ranking using P-scores
netrank(net)

### Rankogram with all ranking probabilities
set.seed(1909)
ran <- rankogram(net)
ran
plot(ran)

### Treatment ranking using SUCRAs
netrank(ran)

### League table showing network and direct estimates
netleague(net, seq = netrank(net), ci = FALSE)

}
}
\seealso{
   \code{\link[netmeta]{pairwise}}, \code{\link[meta]{metacont}}, \code{\link[netmeta]{netmeta}}, \code{\link[netmeta]{netrank}}, \code{\link[netmeta]{rankogram}}, \code{\link[netmeta]{netleague}}
}
\keyword{datasets}
\concept{medicine}
\concept{raw mean differences}
\concept{network meta-analysis}
\section{Concepts}{
   medicine, raw mean differences, network meta-analysis
}
