\name{dat.harrer2021}
\docType{data}
\alias{dat.harrer2021}
\title{"Third-wave" cognitive behavioral interventions for perceived stress in university students}
\description{Results of 18 trials examining the effect of "third-wave" cognitive behavioral interventions on perceived stress in university student populations.}
\usage{
dat.harrer2021
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study} \tab \code{character} \tab First author and year of the study. \cr
\bold{yi} \tab \code{numeric} \tab Small-sample bias corrected standardized mean difference in perceived stress scores between the treatment and control group (Hedges' \emph{g}). \cr
\bold{sei} \tab \code{numeric} \tab Standard error of \emph{g}. \cr
\bold{ni} \tab \code{integer} \tab Total sample size. \cr
\bold{intervention} \tab \code{character} \tab Type of intervention provided in the treatment group. \cr
\bold{control} \tab \code{character} \tab Type of control group. \cr
\bold{duration} \tab \code{character} \tab Intervention duration (\code{short} or \code{long}). \cr
\bold{delivery} \tab \code{character} \tab Delivery mode of the intervention (\code{book}, \code{group}, \code{online}). \cr
\bold{rob} \tab \code{character} \tab Risk of bias judgment (\code{low}, \code{high}). \cr
}  
}
\details{
This dataset contains results of 18 trials comparing the effect of "third-wave" (i.e., acceptance or mindfulness-based) cognitive behavioral interventions on perceived stress in college students. Effects are expressed as small-sample bias corrected standardized mean differences (Hedges' \emph{g}) in perceived stress scores at post-test (\code{yi} column).

Under the name \code{ThirdWave}, this dataset was introduced in the first edition of the guide \emph{Doing Meta-Analysis with R} (Harrer et al., 2021). Trials and their results were extracted from a larger meta-analytic project examining mental health interventions in university settings (Rathner et al., 2018). Note that values in the \code{ni} column were introduced solely for instructional purposes and do not exactly match the original sample sizes reported in the trial publications. The sign of all outcome measures in \code{yi} has been recoded so that positive values indicate favorable outcomes (i.e., less perceived stress on average in the intervention group).
}
\source{
Harrer, M., Cuijpers, P., Furukawa, T.A., & Ebert, D.D. (2021). 
\emph{Doing Meta-Analysis with R: A Hands-On Guide} (Chapter 3: Pooling Effect Sizes). Boca Raton, FL and London: Chapman & Hall/CRC Press. ISBN 978-0-367-61007-4. Available from \href{https://doing-meta.guide/}{doing-meta.guide}

Rathner, E.-M., Goosen, S., Ebert, D.D., Harrer, M., Adam, S., Küchler, A.-M.,
Saruhanjan, K., Baumeister, H. (2018). \emph{The efficacy of third wave interventions to reduce stress among university 
students: a meta-analysis of randomized-controlled trials}. PROSPERO. 
Available from \href{https://www.crd.york.ac.uk/PROSPERO/view/CRD42018091683}{crd.york.ac.uk/PROSPERO/view/CRD42018091683}

}
\author{Mathias Harrer, \email{m.harrer@vu.nl}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.harrer2021
dat

\dontrun{
library(metafor)

# Pool effect in random-effects meta-analysis
(res <- rma(yi=yi, sei=sei, slab=study, data=dat))

# Conduct multiple meta-regression
rma(yi=yi, sei=sei, slab=study, data=dat,
    mods = ~ control + rob + duration)

# Create funnel plot and adjust for funnel plot asymmetry
# We use an equal-random approach for the trim and fill method
funnel(res)
regtest(res)
tf <- rma(yi=yi, sei=sei, data=dat, method="EE") |> trimfill()
rma(tf$yi, tf$vi)
}
}
\keyword{datasets}
\concept{psychiatry}
\concept{psychology}
\concept{outliers}
\concept{standardized mean differences}
\section{Concepts}{
   psychiatry, psychology, outliers, standardized mean differences
}
