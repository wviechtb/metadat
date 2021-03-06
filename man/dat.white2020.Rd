\name{dat.white2020}
\docType{data}
\alias{dat.white2020}
\title{Structural colours reflect individual quality: a meta-analysis}
\description{Results from studies examining the relationship between measures of individual quality and the expression of structurally coloured sexual signals}
\usage{dat.white2020}
\format{
The data frame dat.white2020 contains the following columns:
\tabular{lll}{
\bold{study_id} \tab \code{character} \tab study-level ID \cr
\bold{obs} \tab \code{character} \tab observation-level ID \cr
\bold{exp_obs} \tab \code{character} \tab whether the study is observational or experimental \cr
\bold{control} \tab \code{numeric} \tab whether the study did (1) or did not (0) include a non-sexual control trait \cr
\bold{class} \tab \code{character} \tab class of the study organisms \cr
\bold{genus} \tab \code{character} \tab class of the study organisms \cr
\bold{species} \tab \code{character} \tab species of the study organisms \cr
\bold{sex} \tab \code{character} \tab sex of the study organisms \cr
\bold{iridescent} \tab \code{numeric} \tab whether the colour signals were iridescent (1) or not (0) \cr
\bold{col_var} \tab \code{character} \tab the colour variable quantified \cr
\bold{col_component} \tab \code{character} \tab whether the colour variable is chromatic or achromatic \cr
\bold{quality_measure} \tab \code{character} \tab the measure of individual quality used \cr
\bold{region} \tab \code{character} \tab the body region from which colour was sampled \cr
\bold{n} \tab \code{numeric} \tab study sample size \cr
\bold{r} \tab \code{numeric} \tab Pearson's correlation coefficient \cr
}  
}
\details{The 186 outcomes measures from 41 experimental and observational studies report the correlation between measures of individual quality (age, body condition, immune function, parasite resistance) and the expression of structurally colours sexual signals across 28 species. The intention being to test whether structural colour signal show heightened condition-dependent expression, as prediected by evolutionary models of 'honest' signalling.}
\source{White, T. E. (2020). Structural colours reflect individual quality \emph{Biology Letters}, \bold{16}, 20200001.}
\author{Thomas E. White, \email{thomas.white026@gmail.com}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.white2020
dat
}
\keyword{datasets}
\concept{ecology}
\concept{evolution}
