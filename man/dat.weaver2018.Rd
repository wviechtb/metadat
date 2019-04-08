\name{dat.weaver2018}
\docType{data}
\alias{dat.weaver2018}
\title{The correlation between feather coloration and measures of individual quality}
\description{Results from 50 studies on the correlation between avian feather coloration and individual quality.}
\usage{dat.weaver2018}
\format{The data frame contains the following columns:
    \tabular{lll}{
      \bold{author}       \tab \code{numeric}     \tab Study authors \cr
      \bold{year}   \tab \code{numeric} \tab Publication year \cr
      \bold{exppop}     \tab \code{numeric}   \tab Within-study experimental population id \cr
      \bold{history_trait} \tab \code{character}   \tab Focal life history trait \cr
      \bold{category} \tab \code{character}   \tab Category of individual quality measurement  \cr
      \bold{color} \tab \code{character}   \tab Human-subjective color of the measured patch \cr
      \bold{species} \tab \code{character}   \tab Species \cr
      \bold{carotenoid_form} \tab \code{character}   \tab Form of carotenoid \cr
      \bold{col_variable} \tab \code{character}   \tab Measure of patch color used \cr
      \bold{animal} \tab \code{character}   \tab Animal common name \cr
      \bold{n} \tab \code{numeric}   \tab Sample size \cr
      \bold{r} \tab \code{numeric}   \tab Correlation coefficient \cr
      \bold{yi}       \tab \code{numeric}   \tab Fishers Z transformed correlation coefficent  \cr
      \bold{vi}       \tab \code{numeric}   \tab Corresponding sampling variance \cr
      \bold{se} \tab \code{numeric}   \tab Standard error \cr
      \bold{lcl} \tab \code{numeric}   \tab Lower 95 confidence limit \cr
      \bold{ucl} \tab \code{numeric}   \tab Upper 95 confidence limit \cr
  }
}
\details{
A meta-analysis of the relationship between carotenoid-based feather coloration and measures of individual quality. The strength of the summary effect sizes are indicative of the plausibility of different forms of carotenoid-based colouration as 'honest' signals of mate quality, along several axes (condition, immune resilience, reproductive success, parasite load, and overall). The effect size measure for this meta-analysis was the Fisher's Z transformed correlation.
}
\source{
Weaver, R. J., Santos, E. S. A., Tucker A. M., Wilson, A. E., Hill, G. E. (2018). Carotenoid metabolism strengthens the link between feather coloration and individual quality. \emph{Nature Communications}, \bold{9}, 73.
}
\examples{
  ### copy data into 'dat' and examine data
  dat <- dat.weaver2018
  dat
}
\keyword{datasets}
