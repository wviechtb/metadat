\name{dat.griffith2006}
\docType{data}
\alias{dat.griffith2006}
\title{Melanin versus Carotenoid-based Sexual Signals: Is the Difference Really So Black and Red?}
\description{Results from studies examining the relationship between individual condition and the expression of sexual, pigmentary colour-signals in birds}
\usage{dat.griffith2006}
\format{
The data frame dat.griffith2006 contains the following columns:
\tabular{lll}{
\bold{reference} \tab \code{character} \tab primary study reference \cr
\bold{species} \tab \code{character} \tab species name \cr
\bold{pigment} \tab \code{character} \tab pigment type \cr
\bold{manipulation} \tab \code{character} \tab experimental manipulation \cr
\bold{response} \tab \code{character} \tab response variable; a descriptor of sexual signal coloration \cr
\bold{n1} \tab \code{integer} \tab sample size of experiment 1 \cr
\bold{n2} \tab \code{integer} \tab sample size of experiment 2, if conducted \cr
\bold{statistic} \tab \code{character} \tab original test statistic \cr
\bold{value} \tab \code{numeric} \tab value for original test statistic \cr
\bold{p} \tab \code{numeric} \tab p value \cr
\bold{r} \tab \code{numeric} \tab r value \cr
}  
}
\details{The 53 effect sizes from 17 studies report the effects of experimental manipulations of diet, parasite load, rearing conditions, or brood size on the expression of carotenoid- or melanin-based sexual color signals across 11 species of bird. The intention being to examine whether carotenoid-based signals show heightened condition-dependence, as predicted by evolutionary models of 'honest' signaling. All data are extracted from Table 1 in Griffith et al. 2006.}
\source{Griffith, S. C., Parker, T. H., & Olson, V. A. (2006). Melanin-versus carotenoid-based sexual signals: is the difference really so black and red? \emph{Animal Behaviour}, \bold{71}, 749-763.}
\author{Thomas E. White, \email{thomas.white026@gmail.com}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.griffith2006
dat
}
\keyword{datasets}
\concept{ecology}
