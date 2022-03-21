\name{dat.gurusamy2011}
\docType{data}
\alias{dat.gurusamy2011}
\title{Studies on Interventions to Reduce Mortality after Liver Transplantation}
\description{Results from 14 trials examining the mortality risk of interventions for decreasing blood loss and blood transfusion requirements during liver transplantation.}
\usage{
dat.gurusamy2011
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study}     \tab \code{character} \tab study information \cr
\bold{treatment} \tab \code{character} \tab treatment \cr
\bold{death}     \tab \code{integer}   \tab mortality at 60 days post-transplantation \cr
\bold{n}         \tab \code{integer}   \tab number of individuals
}
}
\details{
   This network meta-analysis compared the effectiveness of seven interventions for decreasing blood loss and blood transfusion requirements during liver transplantation (Gurusamy et al., 2011).

   Fourteen studies reported mortality at 60 days, in 1,002 patients. Forty-five deaths were reported across all studies (4.5\%). Six studies observed deaths in all treatment arms while three studies did not observe any deaths.

   This data set was used in Efthimiou et al. (2019) to introduce the Mantel-Haenszel method for network meta-analysis.

   One of the treatments (solvent detergent plasma) was only included in one study with zero events in both treatment arms; this study was excluded from all network meta-analyses. In addition, no death was observed in the antithrombin III arm of the only study evaluating this treatment which was excluded from the Mantel-Haenszel network meta-analysis.
}
\source{
   Gurusamy, K. S., Pissanou, T., Pikhart, H., Vaughan, J., Burroughs, A. K., & Davidson, B. R. (2011). Methods to decrease blood loss and transfusion requirements for liver transplantation. \emph{Cochrane Database of Systematic Reviews}, \bold{12}, CD009052. \verb{https://doi.org/10.1002/14651858.CD009052.pub2}
}
\references{
   Efthimiou, O., Rücker, G., Schwarzer, G., Higgins, J., Egger, M., & Salanti, G. (2019). A Mantel-Haenszel model for network meta-analysis of rare events. \emph{Statistics in Medicine}, \bold{38}(16), 2992--3012. \verb{https://doi.org/10.1002/sim.8158}
}
\author{
   Guido Schwarzer, \email{sc@imbi.uni-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show first 6 rows of the dataset
head(dat.gurusamy2011)

### Only study evaluating solvent detergent plasma
subset(dat.gurusamy2011, study == "Williamson 1999")

### Only study evaluating antithrombin III
subset(dat.gurusamy2011, study == "Baudo 1992")

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
pw <- pairwise(treatment, death, n, studlab = study,
  data = dat.gurusamy2011, sm = "OR")

### Conduct Mantel-Haenszel network meta-analysis (NMA)
net.MH <- netmetabin(pw, ref = "cont")

### Conduct inverse variance (IV) network meta-analysis
net.IV <- netmeta(pw, ref = "cont")

### Network graph (Mantel-Haenszel NMA)
netgraph(net.MH, seq = "optimal", col = "black", plastic = FALSE,
  points = TRUE, pch = 21, cex.points = 3, col.points = "black",
  bg.points = "gray", thickness = "se.fixed",
  number.of.studies = TRUE)

### Full network graph (based on inverse variance method, including
### study comparing Antithrombin III with Control/Placebo)
netgraph(net.IV,
  seq = "optimal", col = "black", plastic = FALSE,
  points = TRUE, pch = 21, cex.points = 3, col.points = "black",
  bg.points = "gray", thickness = "se.fixed",
  number.of.studies = TRUE)

### Compare results for Mantel-Haenszel and IV NMA
forest(netbind(net.MH, net.IV,
  random = FALSE, name = c("MH NMA", "IV NMA")))

### Show results for Mantel-Haenszel NMA
net.MH
forest(net.MH)

### League table with network estimates in lower triangle and direct
### estimates in upper triangle
netleague(net.MH)

### Assess inconsistency
print(netsplit(net.MH), show = "both", ci = TRUE, overall = FALSE,
  nchar.trts = 6)

}
}
\seealso{
\code{\link[netmeta]{pairwise}}, \code{\link[meta]{metabin}}, \code{\link[netmeta]{netmetabin}}
}
\keyword{datasets}
\concept{medicine}
\concept{odds ratios}
\concept{network meta-analysis}
\concept{Mantel-Haenszel method}
\section{Concepts}{
   medicine, odds ratios, network meta-analysis, Mantel-Haenszel method
}
