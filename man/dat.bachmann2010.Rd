\name{dat.bachmann2010}
\docType{data}
\alias{dat.bachmann2010}
\title{Studies on the Inpatient Rehabilitation for Geriatric Patients}
\description{Results from studies examining inpatient rehabilitation for geriatric patients with respect to various outcomes.}
\usage{
dat.bachmann2010
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{author}     \tab \code{character}  \tab first author of study \cr
\bold{year}       \tab \code{numeric}    \tab publication year \cr
\bold{country}    \tab \code{numeric}    \tab country where study was conducted \cr
\bold{rehabtype}  \tab \code{character}  \tab type of rehabilitation (general / orthopaedic) \cr
\bold{lohs1}      \tab \code{numeric}    \tab mean/median length of hospital stay before randomization (days) \cr
\bold{lohs2}      \tab \code{numeric}    \tab mean/median length of hospital stay after randomization (days) \cr
\bold{mage}       \tab \code{numeric}    \tab mean age of participants \cr
\bold{nti}        \tab \code{numeric}    \tab number of participants in the intervention group \cr
\bold{nci}        \tab \code{numeric}    \tab number of participants in the control group \cr
\bold{multidim}   \tab \code{character}  \tab multidimensional geriatric assessment (yes / no) \cr
\bold{assign}     \tab \code{character}  \tab assignment to therapy (yes / no) \cr
\bold{meetings}   \tab \code{character}  \tab intervention team meetings for goal setting \cr
\bold{fup}        \tab \code{character}  \tab follow-up after discharge (yes / no) \cr
\bold{conc}       \tab \code{character}  \tab concealment of allocation (yes / no) \cr
\bold{blind}      \tab \code{character}  \tab blinding of outcome assessor (yes / no) \cr
\bold{itt}        \tab \code{character}  \tab intention to treat analysis (yes / no) \cr
\bold{outcome}    \tab \code{character}  \tab outcome variable (function, admission, mortality) \cr
\bold{time}       \tab \code{character}  \tab time of assessment (at discharge, at follow-up) \cr
\bold{or}         \tab \code{numeric}    \tab odds ratio for functional improvement \cr
\bold{lb}         \tab \code{numeric}    \tab lower 95\% CI bound for the odds ratio \cr
\bold{ub}         \tab \code{numeric}    \tab upper 95\% CI bound for the odds ratio \cr
\bold{ai}         \tab \code{numeric}    \tab number of cases in the intervention group \cr
\bold{n1i}        \tab \code{numeric}    \tab total number of patients in the intervention group \cr
\bold{ci}         \tab \code{numeric}    \tab number of cases in the control group \cr
\bold{n2i}        \tab \code{numeric}    \tab total number of patients in the control group
}
}
\details{
   The meta-analysis by Bachmann et al. (2010) assessed the effects of inpatient rehabilitation specifically designed for geriatric patients compared with usual care on functional status, admissions to nursing homes, and mortality. For outcome functional status (\code{outcome=="function"}), odds ratios with corresponding confidence interval bounds are provided via variables \code{or}, \code{lb}, and \code{ub}. For outcomes admissions to nursing homes and mortality, the number of cases and the group sizes for the intervention and control groups are given via variables \code{ai}, \code{n1i}, \code{ci}, and \code{n2i}.

   Riley et al. (2011) used these data in their discussion of prediction intervals in the context of the random-effects model for meta-analysis.
}
\source{
   Bachmann, S., Finger, C., Huss, A., Egger, M., Stuck, A. E., & Clough-Gorr, K. M. (2010). Inpatient rehabilitation specifically designed for geriatric patients: Systematic review and meta-analysis of randomised controlled trials. \emph{British Medical Journal}, \bold{340}, c1718. \verb{https://doi.org/10.1136/bmj.c1718}
}
\references{
   Riley, R. D., Higgins, J. P. T., & Deeks, J. J. (2011). Interpretation of random effects meta-analyses. \emph{British Medical Journal}, \bold{342}, d549. \verb{https://doi.org/10.1136/bmj.d549}
}
\author{
   Wolfgang Viechtbauer, \email{wvb@metafor-project.org}, \url{https://www.metafor-project.org}
}
\examples{
### copy data to 'dat' and examine the data
dat <- dat.bachmann2010
head(dat)

\dontrun{
### load metafor package
library(metafor)

### compute log odds ratios and corresponding sampling variances from the
### reported odds ratios and confidence interval bounds
dat <- conv.wald(or, ci.ub=ub, transf=log, data=dat)

### meta-analyze the effects on functional status at discharge
res <- rma(yi, vi, data=dat, method="DL",
           slab=paste0(author, ", ", year),
           subset=outcome=="function"&time=="discharge")
res
predict(res, transf=exp, digits=2)

### meta-analyze the effects on functional status at follow-up
res <- rma(yi, vi, data=dat, method="DL",
           slab=paste0(author, ", ", year),
           subset=outcome=="function"&time=="followup")
res
predict(res, transf=exp, digits=2)

### compute log risk ratios and corresponding sampling variances from the
### reported 2x2 table counts
dat <- escalc(measure="RR", ai=ai, n1i=n1i,
                            ci=ci, n2i=n2i,
                            data=dat, drop00=TRUE)

### meta-analyze the effects on admission to nursing homes at discharge
res <- rma(yi, vi, data=dat, method="DL",
           slab=paste0(author, ", ", year),
           subset=outcome=="admission"&time=="discharge")
res
predict(res, transf=exp, digits=2)

### meta-analyze the effects on admission to nursing homes at follow-up
res <- rma(yi, vi, data=dat, method="DL",
           slab=paste0(author, ", ", year),
           subset=outcome=="admission"&time=="followup")
res
predict(res, transf=exp, digits=2)

### meta-analyze the effects on mortality at discharge
res <- rma(yi, vi, data=dat, method="DL",
           slab=paste0(author, ", ", year),
           subset=outcome=="mortality"&time=="discharge")
res
predict(res, transf=exp, digits=2)

### meta-analyze the effects on mortality at follow-up
res <- rma(yi, vi, data=dat, method="DL",
           slab=paste0(author, ", ", year),
           subset=outcome=="mortality"&time=="followup")
res
predict(res, transf=exp, digits=2)
}
}
\keyword{datasets}
\concept{medicine}
\concept{odds ratios}
\concept{risk ratios}
\section{Concepts}{
   medicine, odds ratios, risk ratios
}
