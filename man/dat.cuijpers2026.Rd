\name{dat.cuijpers2026}
\docType{data}
\alias{dat.cuijpers2026}
\title{Long-term benefits of psychotherapy for depression}
\description{Results from 193 trials examining the effect of depression psychotherapies from randomization up to 10 years.}
\usage{
dat.cuijpers2026
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study} \tab \code{character} \tab First author and year of the study. \cr
\bold{treatment} \tab \code{character} \tab Type of therapy in the treatment arm  \cr
\bold{control} \tab \code{character} \tab Type of control comparison. \cr
\bold{week} \tab \code{integer} \tab Assessment time after randomization in weeks. \cr
\bold{yi} \tab \code{numeric} \tab Small-sample bias corrected standardized mean difference between the two groups (Hedges' \emph{g}). \cr
\bold{vi} \tab \code{numeric} \tab Sampling variance of Hedges' \emph{g}. \cr
\bold{n1i} \tab \code{integer} \tab Sample size in the treatment group. \cr
\bold{n2i} \tab \code{integer} \tab Sample size in the control group. \cr
\bold{instrument} \tab \code{character} \tab Instrument to assess depressive symptom severity. \cr
\bold{region} \tab \code{character} \tab Region in which the study was conducted. \cr
\bold{mean.age} \tab \code{numeric} \tab Mean age of the sample. \cr
\bold{percent.women} \tab \code{numeric} \tab Percentage of women in the sample. \cr
\bold{rob} \tab \code{character} \tab Overall risk of bias rating of the trial. \cr
}  
}
\details{
The dataset includes results from 193 trials examining the effect of psychological
treatment for depression, compared to inactive control groups. Long-term follow-ups up to
ten years are included.

The \code{treatment} column indicates the psychological treatment investigated in each trial.
Examined treatments include:

\itemize{
  \item \code{3rd}: "third-wave" cognitive behavior therapy
  \item \code{bat}: behavior activation therapy
  \item \code{cbt}: cognitive behavior therapy
  \item \code{dyn}: psychodynamic therapy
  \item \code{ipt}: interpersonal therapy
  \item \code{lrt}: life-review therapy
  \item \code{pst}: problem-solving therapy
  \item \code{other psy}: other/mixed psychological treatment
}

The \code{control} column indicates the comparator in each trial, coded as:

\itemize{
  \item \code{cau}: care as usual
  \item \code{wl}: waitlist control group
  \item \code{other ctr}: other inactive control group
}

This dataset was extracted from the \emph{Metapsy} living evidence database 
on psychological treatments for depression (\code{depression-psyctr}). 
Further information on this database can be found on its 
\href{https://docs.metapsy.org/databases/depression-psyctr/}{documentation page}.
An update of the living database with all trials published up to May 1st, 2025 was used
to compile the present dataset.

}
\source{
Cuijpers, P., Miguel, C., Harrer, M., Plessen, C.Y., Ciharova, M., 
Ebert, D. & Karyotaki, E. (2026). Database of depression psychotherapy 
trials with control conditions. Part of the Metapsy project. 
URL \href{https://docs.metapsy.org/databases/depression-psyctr/}{docs.metapsy.org/databases/depression-psyctr}. 
DOI https://doi.org/10.5281/zenodo.7254845.
}
\author{Mathias Harrer, \email{m.harrer@vu.nl}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.cuijpers2026
dat

\dontrun{
library(metafor)
library(rms)

# Construct variance-covariance matrices
# We assume a 1-week autocorrelation of phi=0.9
V <- vcalc(vi, cluster=study, time1=week, phi=0.9, data=dat)

# Fit multivariate model with a continuous-time autoregressive (CAR)
# heterogeneity variance structure. Time is modeled as a cubic spline
# with 5 knots.
m <- rma.mv(yi, V, mods = ~ rcs(week, 5), random = ~ week | study,
            struct = "CAR", data = dat)
  
# Create a plot to inspect the fit for the first 104 weeks
xs <- seq(-1, 104, length=5000)
knots <- attr(rcs(dat$week, 5), "parms")
sav <- predict(m, newmods=rcspline.eval(xs, knots, inclx=TRUE))
tmp <- regplot(m, mod=2, pred=sav, xvals=xs, las=1, digits=1, bty="l",
               psize=.20/sqrt(dat$vi), xlab="Weeks", 
               ylab = "Standardized Mean Difference",
               main=paste0("Restricted Cubic Spline Model"),
               ylim = c(-.5, 1), xlim = c(0, 104))
abline(v=knots, lty="dotted")
abline(0, 0, col="red")
points(tmp)
}
}
\keyword{datasets}
\concept{psychiatry}
\concept{psychology}
\concept{standardized mean differences}
\concept{multilevel models}
\concept{longitudinal models}
\section{Concepts}{
   psychiatry, psychology, standardized mean differences, multilevel models, longitudinal models
}

