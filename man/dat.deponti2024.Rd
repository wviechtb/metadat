\name{dat.deponti2024}
\docType{data}
\alias{dat.deponti2024}
\title{Effectiveness of psychological treatments for social anxiety disorder}
\description{Results from 66 clinical trials comparing psychological treatments for social anxiety disorder with control conditions.}
\usage{
dat.deponti2024
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study} \tab \code{character} \tab First author and year of the study. \cr
\bold{treatment} \tab \code{character} \tab Type of therapy in the treatment arm. \cr
\bold{control} \tab \code{character} \tab Type of control comparison. \cr
\bold{yi} \tab \code{numeric} \tab Standardized mean difference between groups (Hedges' \emph{g}). \cr
\bold{sei} \tab \code{numeric} \tab Standard error of Hedges' \emph{g}. \cr
\bold{vi} \tab \code{numeric} \tab Sampling variance of Hedges' \emph{g}. \cr
\bold{m1i} \tab \code{numeric} \tab Mean instrument score in the treatment group. \cr
\bold{sd1i} \tab \code{numeric} \tab Standard deviation in the treatment group. \cr
\bold{n1i} \tab \code{integer} \tab Sample size in the treatment group. \cr
\bold{m2i} \tab \code{numeric} \tab Mean instrument score in the control group. \cr
\bold{sd2i} \tab \code{numeric} \tab Standard deviation in the control group. \cr
\bold{n2i} \tab \code{integer} \tab Sample size in the control group. \cr
\bold{instrument} \tab \code{character} \tab Instrument used to assess social anxiety disorder severity. \cr
\bold{time.week} \tab \code{integer} \tab Assessment time in weeks after randomization. \cr
\bold{sessions} \tab \code{integer} \tab Number of treatment sessions. \cr
\bold{country} \tab \code{character} \tab Region in which the study was conducted. \cr
\bold{mean.age} \tab \code{numeric} \tab Mean age of the sample. \cr
\bold{percent.women} \tab \code{numeric} \tab Percentage of women in the sample. \cr
\bold{rob} \tab \code{character} \tab Overall risk of bias rating. \cr
}
}
\details{
This dataset includes 66 randomized trials comparing psychological treatments for social anxiety disorder with inactive comparators.

The \code{treatment} column indicates the psychological treatment investigated in each trial. Examined treatments include:

\itemize{
  \item \code{cbt}: cognitive behaviour therapy
  \item \code{3rd}: third wave cognitive behaviour therapy
  \item \code{exposure}: exposure therapy
  \item \code{other psy}: other type of psychotherapy
}

The \code{control} column indicates the comparator in each trial, coded as:

\itemize{
  \item \code{cau}: care as usual
  \item \code{wlc}: waitlist
  \item \code{other ctr}: other type of inactive control group
}

For many studies, multiple effect measures are available, either because (i) the study was a multiarm trial, (ii)
multiple post-test assessments were made over time, and/or (iii) multiple instruments were used to measure the outcome.

The dataset can be used to illustrate the application of a "cross-classified" random-effects model, in which one captures
both the clustering of effect sizes within studies, and the variability due to different measurement instruments across studies (Fernández-Castilla et al., 2019).

The present dataset was used in a meta-analysis by de Ponti et al. (2024). All data were extracted from the \emph{Metapsy} living evidence database on psychological 
interventions for social anxiety disorder (\code{sad-psyctr}), including all trials published up to January 1st, 2024.
Further information on this database can be found on its \href{https://docs.metapsy.org/databases/sad-psyctr/}{documentation page}. 
}
\source{
de Ponti, N., Matbouriahi, M., Franco, P., Harrer, M., Miguel, C., Papola, D., \dots, & Karyotaki, E. (2024). The efficacy of psychotherapy for social anxiety disorder: A systematic review and meta-analysis. \emph{Journal of Anxiety Disorders}, \bold{104}, 102881. 10.1016/j.janxdis.2024.102881.

de Ponti, N., Matbouriahi, M., Franco, P., Harrer, M., Miguel, C., Papola, D., \dots, & Karyotaki, E. (2024). \emph{Database of social anxiety disorder trials comparing psychological interventions with control conditions}. Part of the Metapsy project (Version 24.0.1). URL \href{https://docs.metapsy.org/databases/sad-psyctr}{docs.metapsy.org/databases/sad-psyctr}. DOI https://doi.org/10.5281/zenodo.12726122

Fernández-Castilla, B., Maes, M., Declercq, L., Jamshidi, L., Beretvas, S. N., Onghena, P., & Van den Noortgate, W. (2019). A demonstration and evaluation of the use of cross-classified random-effects models for meta-analysis. \emph{Behavior Research Methods}, \bold{51}(3), 1286-1304.
}
\author{Mathias Harrer, \email{m.harrer@vu.nl}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.deponti2024
dat

\dontrun{
library(metafor)

# Run a hierarchical cross-classified random-effects model
# with measurement instrument used as the crossed factor
dat$outcome <- 1:nrow(dat)
rma.mv(yi, vi, data = dat,
       random = list(~ 1 | study/outcome, 
       ~ 1 | instrument))
}
}
\keyword{datasets}
\concept{psychiatry}
\concept{psychology}
\concept{multilevel meta-analysis}
\concept{meta-analysis}
\section{Concepts}{
   psychiatry, psychology, standardized mean differences, multilevel meta-analysis
}
