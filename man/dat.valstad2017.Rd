\name{dat.valstad2017}
\docType{data}
\alias{dat.valstad2017}
\title{The correlation between central and peripheral oxytocin concentrations}
\description{Results from 32 studies on the correlation between central and peripheral oxytocin concentrations.}
\usage{dat.valstad2017}
\format{The data frame contains the following columns:
    \tabular{lll}{
      \bold{id}       \tab \code{numeric}     \tab study number \cr
      \bold{study.id}   \tab \code{character} \tab study citation \cr
      \bold{year}     \tab \code{numeric}   \tab publication year \cr
      \bold{yi}       \tab \code{numeric}   \tab Fishers Z transformed correlation coefficent  \cr
      \bold{vi}       \tab \code{numeric}   \tab corresponding sampling variance \cr
      \bold{condition}  \tab \code{character}   \tab Experimental condition \cr
      \bold{csl}       \tab \code{character}   \tab Central sampling locator \cr
      \bold{species} \tab \code{character}   \tab Species \cr
      \bold{bam}       \tab \code{character}   \tab Biochemical analysis method \cr
      
  }
}
\details{
The present systematic review and meta-analysis synthesized studies in which central and peripheral measures of oxytocin were simultaneously sampled into a summary effect size. The strength of the summary effect size is indicative of the plausibility of peripheral oxytocin as an index for central oxytocin concentrations.

The effect size measure for this meta-analysis was the Fisher's Z transformed correlation between central and peripheral measures.

The effect size measure for this meta-analysis was the standardized mean difference (with positive scores indicating a higher mean level of academic achievement in the intervention group).
}
\source{
Valstad, M., Alvares, G. A., Egknud, M., Matziorinis, A. M., Andreassen, O. A., Westlye, L. T., & Quintana, D. S. (2017). The correlation between central and peripheral oxytocin concentrations: a systematic review and meta-analysis. \emph{Neuroscience & Biobehavioral Reviews}, \bold{78}, 117--124.
}
\examples{
  ### copy data into 'dat' and examine data
  dat <- dat.valstad2017
  dat
}
\keyword{datasets}
