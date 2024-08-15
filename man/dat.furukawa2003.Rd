\name{dat.furukawa2003}
\docType{data}
\alias{dat.furukawa2003}
\title{Studies on Low Dosage Tricyclic Antidepressants for the Treatment of Depression}
\description{Results on depression severity from 17 studies comparing low dosage tricyclic antidepressants (TCA) and placebo for the treatment of depression.}
\usage{
dat.furukawa2003
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{author} \tab \code{character} \tab First author with information on dosage in parentheses \cr
\bold{Ne}     \tab \code{integer}   \tab number of patients in low TCA group \cr
\bold{Me}     \tab \code{numeric}   \tab depression severity (low TCA) \cr
\bold{Se}     \tab \code{numeric}   \tab standard deviation (low TCA) \cr
\bold{Nc}     \tab \code{integer}   \tab number of patients in placebo group \cr
\bold{Mc}     \tab \code{numeric}   \tab depression severity (placebo) \cr
\bold{Sc}     \tab \code{numeric}   \tab standard deviation (placebo) \cr
}
}
\details{
   Furukawa et al. (2003) carried out a systematic review comparing low dosage tricyclic antidepressants (TCA) with placebo for the treatment of depression. They reported the effect on presence/absence of depression and on depression severity at various time points. Here we focus on depression severity at four weeks. Most studies used some version of the Hamilton Depression Rating Scale, however, some studies used the Montgomery-Asberg Depression Rating Scale. Accordingly, it is not possible to pool the estimated effects directly.

   This data set is used as an example in Schwarzer et al. (2015).
}
\source{
   Furukawa, T. A., McGuire, H., & Barbui, C. (2003). Low dosage tricyclic antidepressants for depression. \emph{Cochrane Database of Systematic Reviews}, \bold{3}, CD003197. \verb{https://doi.org/10.1002/14651858.CD003197}
}
\references{
   Schwarzer, G., Carpenter, J. R., & Rücker, G. (2015). \emph{Meta-analysis with R}. Cham, Switzerland: Springer.
}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show first five studies
head(dat.furukawa2003, 5)

\dontrun{
### Load meta package
suppressPackageStartupMessages(library("meta"))

### Use RevMan5 settings
oldset <- settings.meta("RevMan5", digits = 2)

### Conduct random effects meta-analysis with Hedges' g as effect measure
mc2 <- metacont(Ne, Me, Se, Nc, Mc, Sc, common = FALSE,
                data = dat.furukawa2003, sm = "SMD")
mc2

### Use previous settings
settings.meta(oldset)
}
}
\keyword{datasets}
\concept{standardized mean differences}
\section{Concepts}{
   standardized mean differences
}
