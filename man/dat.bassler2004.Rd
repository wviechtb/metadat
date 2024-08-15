\name{dat.bassler2004}
\docType{data}
\alias{dat.bassler2004}
\title{Studies on Ketotifen Alone or as Additional Medication for Long-Term Control of Asthma and Wheeze in Children}
\description{Results from 10 trials reporting the physicians' judgement on the overall efficacy of ketotifen for long-term control of asthma and wheeze in children.}
\usage{
dat.bassler2004
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study} \tab \code{character} \tab study label \cr
\bold{Ee}    \tab \code{integer}   \tab number of children with treament success (ketotifen group) \cr
\bold{Ne}    \tab \code{integer}   \tab number of children (ketotifen group) \cr
\bold{Ec}    \tab \code{integer}   \tab number of children with treament success (control group) \cr
\bold{Nc}    \tab \code{integer}   \tab number of children (control group) \cr
\bold{blind} \tab \code{character} \tab blinding of clinicians \cr
}
}
\details{
   Results from 10 trials reporting the physicians' judgement on the overall efficacy of Ketotifen for long-term control of asthma and wheeze in children. A prespecified subgroup analysis was conducted to evaluate whether the treatment effect is different in trials with adequate blinding compared to trials with inadequate / unclear blinding.

   This data set is used as an example in Schwarzer et al. (2015).
}

\source{
   Bassler D., Mitra A. A. D., Ducharme F. M., Forster J., & Schwarzer, G. (2004). Ketotifen alone or as additional medication for long-term control of asthma and wheeze in children. \emph{Cochrane Database of Systematic Reviews}, \bold{1}, CD001384. \verb{https://doi.org/10.1002/14651858.CD001384.pub2}
}
\references{
   Schwarzer, G., Carpenter, J. R., & Rücker, G. (2015). \emph{Meta-analysis with R}. Cham, Switzerland: Springer.
}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show full data set
dat.bassler2004

\dontrun{
### Load meta package
suppressPackageStartupMessages(library("meta"))

### Use DerSimonian-Laird estimator (which was the default in meta in the year 2015).
### Furthermore, print meta-analysis results with two digits.
oldset <- settings.meta(method.tau = "DL", digits = 2)

### Calculate experimental and control event rates
with(dat.bassler2004, summary(Ee / Ne))
with(dat.bassler2004, summary(Ec / Nc))

### Conduct meta-analysis using the inverse variance method
mb3 <- metabin(Ee, Ne, Ec, Nc, method = "I",
               data = dat.bassler2004, studlab = study)
mb3

### Conduct subgroup analysis comparing trials with adequate blinding
### to trials with inadequate or unclear blinding
mb3s <- update(mb3, subgroup = blind, print.subgroup.name = FALSE)
mb3s

### Conduct subgroup analysis assuming common between-study variance in subgroups
mb3s.c <- update(mb3s, tau.common = TRUE)
mb3s.c

### Use previous settings
settings.meta(oldset)
}
}
\keyword{datasets}
\concept{risk ratios}
\concept{medicine}
\concept{subgroup analysis}
\section{Concepts}{
   risk ratios, medicine, subgroup analysis
}
