\name{dat.karner2014}
\docType{data}
\alias{dat.karner2014}
\title{Studies on Tiotropium in Patients with COPD}
\description{Data on several endpoints and risk-of-bias from a systematic review of studies on tiotropium in patients with chronic obstructive pulmonary disease (COPD).}
\usage{
dat.karner2014
}
\format{The data frame contains the following columns:
\tabular{lll}{
\bold{study}                   \tab \code{character} \tab publication identifier (first author and publication year) \cr
\bold{year}                    \tab \code{numeric}   \tab publication year \cr
\bold{duration}                \tab \code{factor}    \tab study duration (\eqn{<1} year vs. \eqn{\geq 1}{>=1} year) \cr
\bold{inhaler}                 \tab \code{factor}    \tab type of inhaler investigated (\dQuote{dry powder} or \dQuote{soft mist}) \cr
\bold{baseline.age}            \tab \code{numeric}   \tab mean age at baseline \cr
\bold{baseline.males}          \tab \code{numeric}   \tab proportion of males among study participants \cr
\bold{baseline.fev1}           \tab \code{numeric}   \tab mean FEV1 at baseline (L) \cr
\bold{baseline.fev1pp}         \tab \code{numeric}   \tab mean FEV1 (percent of predicted) at baseline \cr
\bold{baseline.pyr}            \tab \code{numeric}   \tab mean number of pack-years (smoking history) \cr
\bold{tiotropium.total}        \tab \code{numeric}   \tab total number of patients in the treatment group \cr
\bold{tiotropium.exa}          \tab \code{numeric}   \tab number of patients with \eqn{\geq 1}{>=1} exacerbation in the treatment group \cr
\bold{tiotropium.sexa}         \tab \code{numeric}   \tab number of patients with \eqn{\geq 1}{>=1} \emph{severe} exacerbation in the treatment group \cr
\bold{tiotropium.hospi}        \tab \code{numeric}   \tab number of patients with \eqn{\geq 1}{>=1} hospitalization (all-cause) in the treatment group \cr
\bold{tiotropium.deaths}       \tab \code{numeric}   \tab number of deaths in the treatment group \cr
\bold{tiotropium.sae}          \tab \code{numeric}   \tab number of patients with \eqn{\geq 1}{>=1} serious adverse event (non-fatal) in the treatment group \cr
\bold{tiotropium.dropout}      \tab \code{numeric}   \tab number of withdrawals in the treatment group \cr
\bold{placebo.total}           \tab \code{numeric}   \tab total number of patients in the control group \cr
\bold{placebo.exa}             \tab \code{numeric}   \tab number of patients with \eqn{\geq 1}{>=1} exacerbation in the control group \cr
\bold{placebo.sexa}            \tab \code{numeric}   \tab number of patients with \eqn{\geq 1}{>=1} \emph{severe} exacerbation in the control group \cr
\bold{placebo.hospi}           \tab \code{numeric}   \tab number of patients with \eqn{\geq 1}{>=1} hospitalization (all-cause) in the control group \cr
\bold{placebo.deaths}          \tab \code{numeric}   \tab number of deaths in the control group \cr
\bold{placebo.sae}             \tab \code{numeric}   \tab number of patients with \eqn{\geq 1}{>=1} serious adverse event (non-fatal) in the control group \cr
\bold{placebo.dropout}         \tab \code{numeric}   \tab number of withdrawals in the control group \cr
\bold{sgrq.md}, \bold{sgrq.se} \tab \code{numeric}   \tab mean difference and associated standard error for \emph{St. George's respiratory questionnaire (SGRQ)} total score \cr
\bold{fev1.md}, \bold{fev1.se} \tab \code{numeric}   \tab mean difference and associated standard error for \emph{forced expiratory volume in 1 second (FEV1, mL)} \cr
\bold{rob.rand}                \tab \code{factor}    \tab random sequence generation (selection bias) \cr
\bold{rob.alloc}               \tab \code{factor}    \tab allocation concealment (selection bias) \cr
\bold{rob.perf}                \tab \code{factor}    \tab blinding of participants and personnel (performance bias) \cr
\bold{rob.det}                 \tab \code{factor}    \tab blinding of outcome assessment (detection bias) \cr
\bold{rob.att}                 \tab \code{factor}    \tab incomplete outcome data (attrition bias) \cr
\bold{rob.rep}                 \tab \code{factor}    \tab selective reporting bias (reporting bias)
}
}
\details{
   Chronic obstructive pulmonary disease (COPD) is a chronic and progressive condition characterized by recurrent exacerbation phases. Various treatment options are available, aimed at both providing relief during an acute exacerbation, and at delaying overall disease progression. A common drug used in the management of COPD is \emph{tiotropium}, a long-acting muscarinic antagonist (LAMA), which is administered via an inhaler device.

   Karner et al. (2014) conducted a systematic review in order to evaluate the evidence on the effects of tiotropium in comparison to placebo. 22 placebo-controlled studies were found, and a range of endpoints and subgroups were considered. The data reproduced here relate to analyses 1.1, 1.9, 1.14, 1.15, 1.19, 1.26, 1.27, and 1.28 in the original investigation. The risk-of-bias assessments were shown in Fig. 2. A number of study-level covariables are also provided.
}
\source{
   Karner, C., Chong, J., & Poole, P. (2014). Tiotropium versus placebo for chronic obstructive pulmonary disease. \emph{Cochrane Database of Systematic Reviews}, \bold{7}, CD009285. \verb{https://doi.org/10.1002/14651858.cd009285.pub3}
}
\author{
   Christian \enc{Röver}{Roever}, \email{christian.roever@med.uni-goettingen.d}
}
\examples{
dat.karner2014

\dontrun{
library(metafor)
library(bayesmeta)

# compute effect sizes (log odds ratios) from exacerbation count data
# (using the "metafor" package's "escalc()" function)
karner.exa <- escalc(measure="OR",
                     ai=tiotropium.exa, n1i=tiotropium.total,
                     ci=placebo.exa,    n2i=placebo.total,
                     slab=study, data=dat.karner2014)

# show forest plot
forestplot(karner.exa, title="exacerbation",
           exponentiate=TRUE, xlog=TRUE,
           xlab="odds ratio")

# derive St. George's Respiratory Questionnaire (SGRQ) effect sizes
# (change in SGRQ score)
karner.sgrq <- escalc(measure="MD",
                      yi=sgrq.md, sei=sgrq.se,
                      slab=study, data=dat.karner2014,
                      subset=is.finite(dat.karner2014$sgrq.md))

# show forest plot
forestplot(karner.sgrq, title="SGRQ", xlab="mean difference")
}
}
\keyword{datasets}
\concept{medicine}
\concept{pulmonology}
\concept{odds ratios}
\concept{raw mean differences}
\concept{meta-regression}
\concept{risk-of-bias}
\section{Concepts}{
   medicine, pulmonology, odds ratios, raw mean differences, meta-regression, risk-of-bias
}
