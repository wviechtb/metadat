\name{dat.michael2013}
\docType{data}
\alias{dat.michael2013}
\title{The non-persuasive power of a brain image}
\description{Results from studies exploring how a superfluous fMRI brain image influences the persuasiveness of a scientific claim}
\usage{
dat.michael2013
}
\format{
The data frame contains the following columns:
\tabular{lll}{
{Study}               \tab    \code{character}  \tab  name of the study: Citation - Experiment - Subgroup \cr
{No_brain_n}          \tab    \code{numeric}    \tab  sample size for no-brain condition \cr
{No_brain_m}          \tab    \code{numeric}    \tab  mean agreement rating for no-brain-image condition \cr
{No_brain_s}          \tab    \code{numeric}    \tab  standard deviation for no-brain-image condition \cr
{Brain_n}             \tab    \code{numeric}    \tab  sample size for brain-image condition \cr
{Brain_m}             \tab    \code{numeric}    \tab  mean for brain-image condition \cr
{Brain_s}             \tab   \code{numeric}     \tab  standard deviation for brain-image condition \cr
{Included_Critique}   \tab    \code{character}  \tab  'Critique' if article included critical commentary on conclusions, otherwise 'No_critique' \cr
{Medium}              \tab    \code{character}  \tab  'Paper' if conducted in person; 'Online' if conducted online \cr
{Compensation}        \tab    \code{character}  \tab  notes on compensation provided to participants \cr
{Participant_Pool}    \tab    \code{character}  \tab  notes on where participants were recruited \cr
{yi}                  \tab    \code{numeric}    \tab  mean difference, calculated as Brain_m - No_brain_m. \cr
{vi}                  \tab    \code{numeric}    \tab  corresponding sampling variance. \cr
}
}
\details{
   Meta-analysis by Michael et al. (2013) of experiments on the persuasive power of a brain image.  The meta-analysis analyzed an original study by McCabe & Castel (2008) as well as 10 replication attempts conducted by the authors of the meta-analysis.  In each study, participants read an article about using brain imaging as a lie detector.  The article either included a superfluous fMRI image of a brain (brain) or not (no_brain).  After reading the article, all participants responded to the statement "Do you agree or disagree with the conclusion that brain imaging can be used as a lie detector?" on a scale from 1 (strongly disagree) to 4 (strongly agree).  The original study by McCabe & Castel (2008) reported a relatively large increase in agreement due to the prence of brain images.  Meta-analysis of the original study with the 10 replications suggests, however, a small, possibly null effect: estimated raw effect size of 0.07, 95\% CI [0.00, 0.14] under a random-effects model.  In some studies, the article included a passage critiquing the primary claims made in the article; this is coded in the 'Included_Critique' column for analysis as a possible moderator.  Note that Experiment 3 by McCabe & Castel was a 2x2 between subjects design: brain image presence was manipulated as well as the inclusion of a critique.  The two different critique conditions are recorded as separate rows in this data set.  Analysis of this data set with metafor yields the same results (given rounding) reported in the manuscript.  Original study by McCabe & Castel 2008 at \url{10.1016/j.cognition.2007.07.017}.  Replications and meta-analysis by Michael at \url{https://doi.org/10.3758/s13423-013-0391-6}
}
\source{
   Michael, R. B., Newman, E. J., Vuorre, M., Cumming, G., & Garry, M. (2013). On the (non)persuasive power of a brain image. \emph{Psychonomic Bulletin & Review}, \bold{20}(4), 720–725. \url{https://doi.org/10.3758/s13423-013-0391-6}
}
\author{
   Robert Calin-Jageman, \email{rcalinjageman@dom.edu}, \url{https://calin-jageman.net}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.michael2013 
head(dat)

\dontrun{

### load metafor package
require(metafor)

### Data prep
# yi and vi already provided, but here's how you would use escalc to obtain
#  a raw-mean difference and its variance.  
#  Note the measure parameter is "MD" for 'raw mean difference'
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


### meta-analyses 
res <- rma(yi, vi, data=dat)
res
}
}
\keyword{datasets}
\concept{psychology}
\concept{persuasion}
\concept{raw mean differences}