\name{dat.michael2013}
\docType{data}
\alias{dat.michael2013}
\title{The Non-Persuasive Power of a Brain Image}
\description{Results from studies exploring how a superfluous fMRI brain image influences the persuasiveness of a scientific claim.}
\usage{
dat.michael2013
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{Study}             \tab \code{character} \tab name of the study: Citation - Experiment - Subgroup \cr
\bold{No_brain_n}        \tab \code{numeric}   \tab sample size for no-brain-image condition \cr
\bold{No_brain_m}        \tab \code{numeric}   \tab mean agreement rating for no-brain-image condition \cr
\bold{No_brain_s}        \tab \code{numeric}   \tab standard deviation for no-brain-image condition \cr
\bold{Brain_n}           \tab \code{numeric}   \tab sample size for brain-image condition \cr
\bold{Brain_m}           \tab \code{numeric}   \tab mean agreement rating for brain-image condition \cr
\bold{Brain_s}           \tab \code{numeric}   \tab standard deviation for brain-image condition \cr
\bold{Included_Critique} \tab \code{character} \tab \sQuote{Critique} if article included critical commentary on conclusions, otherwise \sQuote{No_critique} \cr
\bold{Medium}            \tab \code{character} \tab \sQuote{Paper} if conducted in person; \sQuote{Online} if conducted online \cr
\bold{Compensation}      \tab \code{character} \tab notes on compensation provided to participants \cr
\bold{Participant_Pool}  \tab \code{character} \tab notes on where participants were recruited \cr
\bold{yi}                \tab \code{numeric}   \tab raw mean difference, calculated as \code{Brain_m - No_brain_m} \cr
\bold{vi}                \tab \code{numeric}   \tab corresponding sampling variance \cr
}
}
\details{
   The dataset contains the data from the meta-analysis by Michael et al. (2013) of experiments on the persuasive power of a brain image. The meta-analysis analyzed an original study by McCabe and Castel (2008) as well as 10 replication attempts conducted by the authors of the meta-analysis.

   In each study, participants read an article about using brain imaging as a lie detector. The article either included a superfluous fMRI image of a brain (brain) or not (no_brain). After reading the article, all participants responded to the statement \dQuote{Do you agree or disagree with the conclusion that brain imaging can be used as a lie detector?} on a scale from 1 (strongly disagree) to 4 (strongly agree).

   The original study by McCabe and Castel (2008) reported a relatively large increase in agreement due to the presence of brain images. Meta-analysis of the original study with the 10 replications suggests, however, a small, possibly null effect: an estimated average raw mean difference of 0.07 points, 95\% CI [-0.00, 0.14], under a random-effects model.

   In some studies, the article included a passage critiquing the primary claims made in the article; this is coded in the \code{Included_Critique} column for analysis as a possible moderator. Note that Experiment 3 by McCabe and Castel (2008) was a 2x2 between subjects design: brain image presence was manipulated as well as the inclusion of a critique. The two different critique conditions are recorded as separate rows in this dataset. Analysis of this dataset with metafor yields the same results (given rounding) reported in the manuscript.
}
\source{
   Michael, R. B., Newman, E. J., Vuorre, M., Cumming, G., & Garry, M. (2013). On the (non)persuasive power of a brain image. \emph{Psychonomic Bulletin & Review}, \bold{20}(4), 720–-725. \verb{https://doi.org/10.3758/s13423-013-0391-6}
}
\references{
   McCabe, D. P., & Castel, A. D. (2008). Seeing is believing: The effect of brain images on judgments of scientific reasoning. \emph{Cognition}, \bold{107}(1), 343--352. \verb{https://doi.org/10.1016/j.cognition.2007.07.017}
}
\author{
   Robert Calin-Jageman, \email{rcalinjageman@dom.edu}, \url{https://calin-jageman.net}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.michael2013
dat

\dontrun{
### load metafor package
library(metafor)

### Data prep
# yi and vi are already provided, but here's how you would use escalc() to obtain
# a raw-mean difference and its variance.
# Note the measure parameter is "MD" for 'raw mean difference'
dat <- metafor::escalc(
  measure = "MD",
  m1i = Brain_m,
  m2i = No_brain_m,
  sd1i = Brain_s,
  sd2i = No_brain_s,
  n1i = Brain_n,
  n2i = No_brain_n,
  data = dat
)

### meta-analysis using a random-effects model of the raw mean differences
res <- rma(yi, vi, data=dat)
print(res, digits=2)

### examine if Included_Critique is a potential moderator
res <- rma(yi, vi, mods = ~ Included_Critique, data=dat)
print(res, digits=2)
}
}
\keyword{datasets}
\concept{psychology}
\concept{persuasion}
\concept{raw mean differences}
\section{Concepts}{
   psychology, persuasion, raw mean differences
}
