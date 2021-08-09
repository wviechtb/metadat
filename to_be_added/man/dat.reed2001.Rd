\name{dat.reed2001}
\docType{data}
\alias{dat.reed2001}
\title{How closely correlated are molecular and quantitative measures of genetic variation? A meta-analysis}
\description{Meta-analaysis on the correlation between molecular measures of geentic variability, and more traditional measures from quantitative genetics}
\usage{dat.reed2001}
\format{
The data frame dat.reed2001 contains the following columns:
\tabular{lll}{
\bold{species} \tab \code{character} \tab species of the analysis \cr
\bold{yi} \tab \code{numeric} \tab correlation between molecular and quant gen measure f variation \cr
\bold{trait} \tab \code{character} \tab trait type measured: life-history (LH) or morphological (M) \cr
\bold{measure} \tab \code{character} \tab type of quant gen measure: genetic distance (GD), additive genetic variance (H), phenotypic variance (P) \cr
\bold{n} \tab \code{integer} \tab sample size \cr
\bold{source} \tab \code{character} \tab original study authors and year \cr
}  
}
\details{Each study in this meta-analysis correlates measures of genetic variation as made by molecular and quantitative genetic techniques. Correlations are made in different species, using different types of traits, and using different quantative genetic statistics. The effect size is currently expressed as r.}
\source{Reed, D.H. & Frankham, R. (2001). How closely correlated are molecular and quantitative measures of genetic variation? A meta-analysis. \emph{Evolution}, \bold{55}: 1095-1103.}
\author{Alistair M Senior, \email{alistair.senior@sydney.edu.au}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.reed2001
dat
}
\keyword{datasets}
\concept{ecology}
\concept{evolution}
\concept{correlation}
