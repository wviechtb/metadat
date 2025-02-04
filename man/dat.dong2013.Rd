\name{dat.dong2013}
\docType{data}
\alias{dat.dong2013}
\title{Studies on Safety of Inhaled Medications for Chronic Obstructive Pulmonary Disease}
\description{Results from 41 trials examining the safety of inhaled medications in patients with chronic obstructive pulmonary disease.}
\usage{
dat.dong2013
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{id}         \tab \code{integer}   \tab study ID \cr
\bold{treatment}  \tab \code{character} \tab treatment \cr
\bold{death}      \tab \code{integer}   \tab mortality \cr
\bold{randomized} \tab \code{integer}   \tab number of individuals
}
}
\details{
   This network meta-analysis compared the safety of inhaled medications in patients with chronic obstructive pulmonary disease (Dong et al., 2013).

   Mortality was reported in 41 randomized trials, with a total of 52 462 patients. Mortality was low, with 2 408 deaths (4.6\%) reported across all studies. There were nine studies that reported zero events in at least one of the treatment arms and three additional studies had zero events in all treatment arms.

   This dataset was used in Efthimiou et al. (2019) to illustrate the Mantel-Haenszel method for network meta-analysis.
}
\source{
   Dong, Y.-H., Lin, H.-H., Shau, W.-Y., Wu, Y.-C., Chang, C.-H., & Lai, M.-S. (2013). Comparative safety of inhaled medications in patients with chronic obstructive pulmonary disease: Systematic review and mixed treatment comparison meta-analysis of randomised controlled trials. \emph{Thorax}, \bold{68}(1), 48--56. \verb{https://doi.org/10.1136/thoraxjnl-2012-201926}
}
\references{
   Efthimiou, O., Rücker, G., Schwarzer, G., Higgins, J., Egger, M., & Salanti, G. (2019). A Mantel-Haenszel model for network meta-analysis of rare events. \emph{Statistics in Medicine}, \bold{38}(16), 2992--3012. \verb{https://doi.org/10.1002/sim.8158}
}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show first 6 rows / 3 studies of the dataset
head(dat.dong2013)

\dontrun{
### Load netmeta package
suppressPackageStartupMessages(library("netmeta"))

### Print odds ratios and confidence limits with two digits
oldset <- settings.meta(digits = 2)

### Change appearance of confidence intervals
cilayout("(", "-")

### Transform data from long arm-based format to contrast-based
### format. Argument 'sm' has to be used for odds ratio as summary
### measure; by default the risk ratio is used in the metabin function
### called internally.
pw <- pairwise(treatment, death, randomized, studlab = id,
  data = dat.dong2013, sm = "OR")

### Calculated log odds ratios (TE) and standard errors (seTE)
pw[1:3, 1:9]

### Conduct Mantel-Haenszel network meta-analysis (NMA)
net <- netmetabin(pw, ref = "plac")

### Network graph
netgraph(net, seq = "optimal", col = "black", plastic = FALSE,
  points = TRUE, pch = 21, cex.points = 3, col.points = "black",
  bg.points = "gray", thickness = "se.fixed",
  number.of.studies = TRUE)

### Show results for Mantel-Haenszel NMA
net
forest(net)

### League table with network estimates in lower triangle and direct
### estimates in upper triangle
netleague(net)

### Assess inconsistency
print(netsplit(net), show = "both", ci = TRUE, overall = FALSE,
  nchar.trts = 6)

### Use previous settings
settings.meta(oldset)
}
}
\keyword{datasets}
\concept{medicine}
\concept{odds ratios}
\concept{network meta-analysis}
\concept{Mantel-Haenszel method}
\section{Concepts}{
   medicine, odds ratios, network meta-analysis, Mantel-Haenszel method
}
