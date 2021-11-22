\name{dat.baker2009}
\docType{data}
\alias{dat.baker2009}
\title{Network Meta-Analysis of Pharmacologic Treatments for Chronic Obstructive Pulmonary Disease}
\description{
This data set comes from a systematic review of randomized controlled trials on pharmacologic treatments for chronic obstructive pulmonary disease (COPD) (Baker et al., 2009).

The primary outcome, occurrence of one or more episodes of COPD exacerbation, is binary (yes / no). For this outcome, five drug treatments (fluticasone, budesonide, salmeterol, formoterol, tiotropium) and two combinations (fluticasone + salmeterol, budesonide + formoterol) were compared to placebo. The authors considered the two combinations as separate treatments instead of evaluating the individual components.
}
\usage{dat.baker2009}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study}     \tab \code{character} \tab study label \cr
\bold{year}      \tab \code{numeric}   \tab year of publication \cr
\bold{id}        \tab \code{numeric}   \tab study ID \cr
\bold{treatment} \tab \code{character} \tab treatment \cr
\bold{exac}      \tab \code{numeric}   \tab number of individuals with one or more episodes of COPD exacerbations \cr
\bold{total}     \tab \code{numeric}   \tab number of individuals in treatment arm
}
}
\source{
   Baker, W. L., Baker, E. L., & Coleman, C. I. (2009). Pharmacologic treatments for chronic obstructive pulmonary disease: A mixed-treatment comparison meta-analysis. \emph{Pharmacotherapy: The Journal of Human Pharmacology and Drug Therapy}, \bold{29}(8), 891--905. \verb{https://doi.org/10.1592/phco.29.8.891}
}
\author{
   Guido Schwarzer, \email{sc@imbi.uni-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### instead first 6 rows of the dataset
head(dat.baker2009)

\dontrun{
### load netmeta package
suppressPackageStartupMessages(require(netmeta, warn.conflicts=FALSE))

### print odds ratios and confidence limits with two digits
settings.meta(digits = 2)

### Transform data from long arm-based format to contrast-based
### format. Argument 'sm' has to be used for odds ratio as summary
### measure; by default the risk ratio is used in the metabin function
### called internally.
p1 <- pairwise(treatment, exac, total, studlab = paste(study, year),
  data = dat.baker2009, sm = "OR")

### conduct network meta-analysis
net1 <- netmeta(p1, ref = "plac")
net1

### conduct component network meta-analysis
cnet1 <- netcomb(net1)
cnet1
}
}
\seealso{
\code{\link[netmeta]{pairwise}}, \code{\link[meta]{metabin}}, \code{\link[netmeta]{netmeta}}, \code{\link[netmeta]{netcomb}}, \code{\link[netmeta]{netmetabin}}
}
\keyword{datasets}
\concept{medicine}
\concept{network meta-analysis}
\concept{component network meta-analysis}
