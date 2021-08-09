\name{dat.weaver2018}
\docType{data}
\alias{dat.weaver2018}
\title{The correlation between feather coloration and measures of individual quality}
\description{Results from 50 studies on the correlation between avian feather coloration and individual quality.}
\usage{dat.weaver2018}
\format{The data frame contains the following columns:
    \tabular{lll}{
      \bold{author}       \tab \code{numeric}     \tab study authors \cr
      \bold{year}   \tab \code{numeric} \tab publication year \cr
      \bold{exppop}     \tab \code{numeric}   \tab within-study experimental population id \cr
      \bold{history_trait} \tab \code{character}   \tab focal life history trait \cr
      \bold{category} \tab \code{character}   \tab category of individual quality measurement  \cr
      \bold{color} \tab \code{character}   \tab human-subjective color of the measured patch \cr
      \bold{species} \tab \code{character}   \tab species \cr
      \bold{carotenoid_form} \tab \code{character}   \tab form of carotenoid \cr
      \bold{col_variable} \tab \code{character}   \tab measure of patch color used \cr
      \bold{animal} \tab \code{character}   \tab animal common name \cr
      \bold{n} \tab \code{numeric}   \tab sample size \cr
      \bold{r} \tab \code{numeric}   \tab correlation coefficient \cr
      \bold{yi}       \tab \code{numeric}   \tab fishers Z transformed correlation coefficent  \cr
      \bold{vi}       \tab \code{numeric}   \tab corresponding sampling variance \cr
      \bold{se} \tab \code{numeric}   \tab standard error \cr
      \bold{lcl} \tab \code{numeric}   \tab lower 95 confidence limit \cr
      \bold{ucl} \tab \code{numeric}   \tab upper 95 confidence limit \cr
  }
}
\details{
A meta-analysis of the relationship between carotenoid-based feather coloration and measures of individual quality. The strength of the summary effect sizes are indicative of the plausibility of different forms of carotenoid-based colouration as 'honest' signals of mate quality, along several axes (condition, immune resilience, reproductive success, parasite load, and overall). The effect size measure for this meta-analysis was the Fisher's Z transformed correlation.
}
\source{
Weaver, R. J., Santos, E. S. A., Tucker A. M., Wilson, A. E., Hill, G. E. (2018). Carotenoid metabolism strengthens the link between feather coloration and individual quality. \emph{Nature Communications}, \bold{9}, 73.
}
\author{Thomas E. White, \email{thomas.white026@gmail.com}}
\examples{
  ### copy data into 'dat' and examine data
  dat <- dat.weaver2018
  dat
}
\keyword{datasets}
