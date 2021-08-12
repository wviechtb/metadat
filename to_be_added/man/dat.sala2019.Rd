\name{dat.sala2019}
\docType{data}
\alias{dat.sala2019}
\title{Studies on Near and Far Transfer in Cognitive Training}
\description{Second-order meta-analysis on the effects of cognitive training}
\usage{dat.sala2019}
\format{The data frame contains the following columns:
\tabular{lll}{
\bold{ID}         \tab \code{numeric}   \tab effect size ID number \cr
\bold{StudyID}    \tab \code{numeric}   \tab study ID number \cr
\bold{Study.name} \tab \code{character} \tab (first) author and year of study \cr
\bold{N}          \tab \code{numeric}   \tab sample size of the study arm \cr
\bold{g}          \tab \code{numeric}   \tab effect size as g \cr
\bold{se}         \tab \code{numeric}   \tab standard error for effect size g \cr
\bold{var}        \tab \code{numeric}   \tab variance for effect size g \cr
\bold{r}          \tab \code{numeric}   \tab effect size as r \cr
\bold{Var_HS}     \tab \code{numeric}   \tab conservative sampling error variance \cr
\bold{comparison} \tab \code{character} \tab (first) author and year of study \cr
\bold{age}        \tab \code{character} \tab age group \cr
\bold{type}       \tab \code{character} \tab type of cognitive training \cr
\bold{Notes}      \tab \code{character} \tab comments on effect size \cr
\bold{Test}       \tab \code{character} \tab measurement of cognitive domain \cr
\bold{Model}      \tab \code{numeric}   \tab models reported in paper \cr

}
}
\details{
   The dataset includes the data for three meta-analytic models (Models 1 (k = 99), 2 (k = 119), 3 (k = 233)) examining the effects of cognitive-training across different programs and populations. These models address this issue with a second-order meta-analysis (meta-analysis of meta-analyses). 

   Example analysis code can be found here https://osf.io/qk2vu/.
}
\source{
   Sala, G., Aksayli, N. D., Tatlidil, K. S., Tatsumi, T., Gondo, Y., & Gobet, F. (2019, July 5). Near and Far Transfer in Cognitive Training: A Second-Order Meta-Analysis. \verb{https://doi.org/10.17605/OSF.IO/QK2VU}
}
\references{
   Sala, G., Aksayli, N. D., Tatlidil, K. S., Tatsumi, T., Gondo, Y., & Gobet, F. (2019). Near and Far Transfer in Cognitive Training: A Second-Order Meta-Analysis. \emph{Collabra: Psychology}, \bold{5}(1). \verb{https://doi.org/10.1525/collabra.203}
}
\author{
   W. Kyle Hamilton \email{whamilton@ucmerced.edu} \url{https://www.kylehamilton.com}
}
}
\keyword{datasets}
\concept{psychology}
\concept{publication bias}
\concept{second order meta-analysis}
