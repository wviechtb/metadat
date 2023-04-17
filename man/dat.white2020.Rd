\name{dat.white2020}
\docType{data}
\alias{dat.white2020}
\title{Studies on the Relationship between Sexual Signal Expression and Individual Quality}
\description{Results from 41 studies examining the relationship between measures of individual quality and the expression of structurally coloured sexual signals.}
\usage{
dat.white2020
}
\format{
The object is a data frame which contains the following columns:
\tabular{lll}{
\bold{study_id}        \tab \code{character} \tab study-level ID \cr
\bold{obs}             \tab \code{character} \tab observation-level ID \cr
\bold{exp_obs}         \tab \code{character} \tab whether the study is observational or experimental \cr
\bold{control}         \tab \code{numeric}   \tab whether the study did (1) or did not (0) include a non-sexual control trait \cr
\bold{class}           \tab \code{character} \tab class of the study organisms \cr
\bold{genus}           \tab \code{character} \tab class of the study organisms \cr
\bold{species}         \tab \code{character} \tab species of the study organisms \cr
\bold{sex}             \tab \code{character} \tab sex of the study organisms \cr
\bold{iridescent}      \tab \code{numeric}   \tab whether the colour signals were iridescent (1) or not (0) \cr
\bold{col_var}         \tab \code{character} \tab the colour variable quantified \cr
\bold{col_component}   \tab \code{character} \tab whether the colour variable is chromatic or achromatic \cr
\bold{quality_measure} \tab \code{character} \tab the measure of individual quality used \cr
\bold{region}          \tab \code{character} \tab the body region from which colour was sampled \cr
\bold{n}               \tab \code{numeric}   \tab study sample size \cr
\bold{r}               \tab \code{numeric}   \tab Pearson's correlation coefficient \cr
}
}
\details{
   The 186 rows in this dataset come from 41 experimental and observational studies reporting on the correlation between measures of individual quality (age, body condition, immune function, parasite resistance) and the expression of structurally coloured sexual signals across 28 species. The purpose of this meta-analysis was to test whether structural colour signals show heightened condition-dependent expression, as predicted by evolutionary models of 'honest' signalling.
}
\source{
   White, T. E. (2020). Structural colours reflect individual quality: A meta-analysis. \emph{Biology Letters}, \bold{16}(4), 20200001. \verb{https://doi.org/10.1098/rsbl.2020.0001}
}
\author{
   Thomas E. White, \email{thomas.white@sydney.edu.au}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.white2020
head(dat, 10)

\dontrun{
### load metafor package
library(metafor)

### calculate r-to-z transformed correlations and corresponding sampling variances
dat <- escalc(measure="ZCOR", ri=r, ni=n, data=dat)

### fit multilevel meta-analytic model
res <- rma.mv(yi, vi, random = list(~ 1 | study_id, ~ 1 | obs), data=dat)
res
}
}
\keyword{datasets}
\concept{ecology}
\concept{evolution}
\concept{correlation coefficients}
\section{Concepts}{
   ecology, evolution, correlation coefficients
}
