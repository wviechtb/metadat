\name{dat.spooner2002}
\docType{data}
\alias{dat.spooner2002}
\title{Studies on Nedocromil Sodium for Preventing Exercise-Induced Bronchoconstriction}
\description{Results from 17 trials, 11 studies in children and 6 studies in adults, reporting the maximum fall in the forced expiratory volume in 1 second (FEV_1) over the course of follow-up, expressed as a percentage.}
\usage{
dat.spooner2002
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{author}   \tab \code{character} \tab first author \cr
\bold{year}     \tab \code{character} \tab year of publication \cr
\bold{Ne}       \tab \code{integer}   \tab number of participants in nedocromil sodium group \cr
\bold{Me}       \tab \code{numeric}   \tab maximum fall in the FEV_1 (nedocromil sodium) \cr
\bold{Se}       \tab \code{numeric}   \tab standard deviation (nedocromil sodium) \cr
\bold{Nc}       \tab \code{integer}   \tab number of participants in placebo group \cr
\bold{Mc}       \tab \code{numeric}   \tab maximum fall in the FEV_1 (placebo) \cr
\bold{Sc}       \tab \code{numeric}   \tab standard deviation (placebo) \cr
\bold{agegroup} \tab \code{factor}    \tab age group (children or adults) \cr
}
}
\details{
   Spooner et al. (2002) conducted a Cochrane review comparing nedocromil sodium (experimental treatment) with placebo (control) for preventing exercise-induced bronchoconstriction. Primary outcome was the maximum fall in the forced expiratory volume in 1 second (FEV_1) over the course of follow-up, expressed as a percentage. This outcome is available for 17 studies, 11 studies in children and 6 studies in adults. For each study, the mean value, standard deviation, and sample size are reported for both the experimental and control group. The authors conducted a random-effects meta-analysis with the mean difference as effect measure, i.e.\ mean value in the nedocromil sodium group minus mean value in the placebo group.

   This data set is used as an example in Schwarzer et al. (2015).
}
\source{
   Spooner, C., Saunders, L. D., & Rowe, B. H. (2002). Nedocromil sodium for preventing exercise‐induced bronchoconstriction. \emph{Cochrane Database of Systematic Reviews}, \bold{1}, CD001183. \verb{https://doi.org/10.1002/14651858.CD001183}
}
\references{
   Schwarzer, G., Carpenter, J. R., & Rücker, G. (2015). \emph{Meta-analysis with R}. Cham, Switzerland: Springer.
}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show first five studies
head(dat.spooner2002, 5)

\dontrun{
### Load meta package
suppressPackageStartupMessages(library("meta"))

### Use settings from RevMan5
oldset <- settings.meta("RevMan5")

### Conduct random effects meta-analysis with age subgroups
mc1 <- metacont(Ne, Me, Se, Nc, Mc, Sc,
                data = dat.spooner2002, studlab = paste(author, year),
                subgroup = agegroup, print.subgroup.name = FALSE,
                label.e = "Nedocromil sodium", label.c = "Placebo",
                common = FALSE)
mc1

### Use previous settings
settings.meta(oldset)
}
}
\keyword{datasets}
\concept{raw mean differences}
\concept{subgroup analysis}
\section{Concepts}{
   raw mean differences, subgroup analysis
}
