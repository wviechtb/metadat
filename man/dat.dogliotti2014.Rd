\name{dat.dogliotti2014}
\docType{data}
\alias{dat.dogliotti2014}
\title{Studies on Antithrombotic Treatments to Prevent Strokes}
\description{Results from 20 trials examining the effectiveness of antithrombotic treatments to prevent strokes in patients with non-valvular atrial fibrillation.}
\usage{
dat.dogliotti2014
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study}     \tab \code{character} \tab study label \cr
\bold{id}        \tab \code{numeric}   \tab study ID \cr
\bold{treatment} \tab \code{character} \tab treatment \cr
\bold{stroke}    \tab \code{numeric}   \tab number of strokes \cr
\bold{total}     \tab \code{numeric}   \tab number of individuals
}
}
\details{
   This dataset comes from a systematic review aiming to estimate the effects of eight antithrombotic treatments including placebo in reducing the incidence of major thrombotic events in patients with non-valvular atrial fibrillation (Dogliotti et al., 2014).

   The review included 20 studies with 79,808 participants, four studies are three-arm studies. The primary outcome is stroke reduction (yes / no).
}
\source{
   Dogliotti, A., Paolasso, E., & Giugliano, R. P. (2014). Current and new oral antithrombotics in non-valvular atrial fibrillation: A network meta-analysis of 79808 patients. \emph{Heart}, \bold{100}(5), 396--405. \verb{https://doi.org/10.1136/heartjnl-2013-304347}
}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show first 7 rows / 3 studies of the dataset
head(dat.dogliotti2014, 7)

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
pw <- pairwise(treat = treatment, n = total, event = stroke,
  studlab = study, data = dat.dogliotti2014, sm = "OR")

### Print log odds ratios (TE) and standard errors (seTE)
head(pw, 5)[, 1:5]

### Conduct network meta-analysis (NMA) with placebo as reference
net <- netmeta(pw, ref = "plac")

### Details on excluded study
selvars <- c("studlab", "event1", "n1", "event2", "n2")
subset(pw, studlab == "WASPO, 2007")[, selvars]

### Show network graph
netgraph(net, seq = "optimal", number = TRUE)

### Conduct Mantel-Haenszel NMA
net.mh <- netmetabin(pw, ref = "plac")

### Compare results of inverse variance and Mantel-Haenszel NMA
nb <- netbind(net, net.mh, random = FALSE,
  name = c("Inverse variance", "Mantel-Haenszel"))
forest(nb, xlim = c(0.15, 2), at = c(0.2, 0.5, 1, 2))

### Print and plot results for inverse variance NMA
net
forest(net)

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
