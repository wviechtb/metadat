\name{dat.anker2025}
\docType{data}
\alias{dat.anker2025}
\title{Cardiology Example Data with Subgroup and Interaction Effects}
\description{Treatment effects, overall and in male/female patient subgroups, as well as treatment-by-subgroup interaction effects in six randomized, placebo-controlled trials.}
\usage{
dat.anker2025
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study}         \tab \code{character} \tab study identifier \cr
\bold{year}          \tab \code{integer}   \tab study year \cr
\bold{intv.n}        \tab \code{integer}   \tab number of patients in the intervention group \cr
\bold{placebo.n}     \tab \code{integer}   \tab number of patients in the placebo group \cr
\bold{iv.iron}       \tab \code{factor}    \tab the intravenous (IV) iron formulation investigated \cr
\bold{size}          \tab \code{factor}    \tab study size (\dQuote{small} or \dQuote{large}, based on total number of patients) \cr
\bold{followup}      \tab \code{numeric}   \tab followup duration (months) \cr
\bold{baseline.age}  \tab \code{numeric}   \tab mean age at baseline (years)\cr
\bold{baseline.lvef} \tab \code{numeric}   \tab mean \emph{left ventricular ejection fraction (LVEF)} at baseline (\%) \cr
\bold{baseline.hgb}  \tab \code{numeric}   \tab mean haemoglobin at baseline (g/dl) \cr
\bold{baseline.ft}   \tab \code{numeric}   \tab mean ferritin at baseline (\eqn{\mu}{mc}g/l) \cr
\bold{baseline.tsat} \tab \code{numeric}   \tab mean \emph{transferritin saturation (TSAT)} at baseline (\%) \cr
\bold{total.n}       \tab \code{integer}   \tab total number of patients \cr
\bold{total.logrr}   \tab \code{numeric}   \tab overall effect (log-RR) \cr
\bold{total.se}      \tab \code{numeric}   \tab standard error of overall effect \cr
\bold{female.n}      \tab \code{integer}   \tab number of female patients\cr
\bold{female.logrr}  \tab \code{numeric}   \tab effect (log-RR) in females \cr
\bold{female.se}     \tab \code{numeric}   \tab standard error of effect in females \cr
\bold{male.n}        \tab \code{integer}   \tab number of male patients \cr
\bold{male.logrr}    \tab \code{numeric}   \tab effect (log-RR) in males \cr
\bold{male.se}       \tab \code{numeric}   \tab standard error of effect in males \cr
\bold{sex.logrrr}    \tab \code{numeric}   \tab treatment-by-subgroup interaction (log-RRR) \cr
\bold{sex.se}        \tab \code{numeric}   \tab standard error of treatment-by-subgroup interaction
}
}
\details{
   Anker et al. (2025) analyzed the effects of intravenous (IV) iron therapy observed in six randomized, placebo-controlled trials. The primary endpoint was a composite of (recurrent) heart failure (HF) hospitalizations and cardiovascular (CV) death, and treatment effects were quantified in terms of risk ratios (RRs). Individual participant data were available for five trials, and analyses were harmonized to match the analysis of the sixth trial (the Ironman study). Meta-analyses were then performed based on logarithmic RRs (log-RRs).

   Besides investigation of the overall effect, it was of interest to what extent male and female patients benefited, and whether effects differed between both patient subgroups. The data set includes effect estimates within each study's male and female subgroups (in terms of log-RRs), as well as estimates of the difference between the subgroups (in terms of logarithmic ratios of RRs (log-RRRs). Technically, the RRRs then constitute treatment-by-subgroup interaction effects.
}
\source{
   Anker, S. D., Karakas, M., Mentz, R. J., Ponikowski, P., Butler, J., Khan, M. S., Talha, K. M., Kalra, P. R., Hernandez, A. F., Mulder, H., Rockhold, F. W., Placzek, M., Röver, C., Cleland, J. G. F., & Friede, T. (2025). Systematic review and meta-analysis of intravenous iron therapy for patients with heart failure and iron deficiency. Nature Medicine, 31(8), 2640-2646. \verb{https://doi.org/10.1038/s41591-025-03671-1}
}
\author{
  Christian Roever, \email{christian.roever@med.uni-goettingen.de}
}
\examples{
# show data
dat.anker2025
\dontrun{
library(bayesmeta)

# specify heterogeneity (tau) prior density (half-normal(0.5))
HN05 <- function(t){dhalfnormal(t, scale=0.5)}

#######################################
#  reproduce primary analysis (Fig.2)
es.primary <- escalc(measure="IRR", yi=total.logrr, sei=total.se,
                     ni=total.n, slab=study, data=dat.anker2025)
bma01 <- bayesmeta(es.primary, tau.prior=HN05)
forestplot(bma01, expo=TRUE, xlog=TRUE,
           xlab="rate ratio (RR)", title="HF hospitalizations / CV mortality")

######################################
#  reproduce sex interaction analysis
#  (Tab.2, Supplementary Fig.4)
es.sex <- escalc(measure="GEN", yi=sex.logrrr, sei=sex.se,
                 ni=total.n, slab=study, data=dat.anker2025)
bma02 <- bayesmeta(es.sex, tau.prior=HN05)
forestplot(bma02, expo=TRUE, xlog=TRUE,
           xlab="ratio of RRs (RRR)", title="sex interaction (females/males)")

###########################################
#  reproduce male/female subgroup analyses
#  (Tab.2, Supplementary Fig.12)
es.female <- escalc(measure="IRR", yi=female.logrr, sei=female.se,
                    ni=female.n, slab=study, data=dat.anker2025)
es.male   <- escalc(measure="IRR", yi=male.logrr, sei=male.se,
                    ni=male.n, slab=study, data=dat.anker2025)
bma03a <- bayesmeta(es.female, tau.prior=HN05)
bma03b <- bayesmeta(es.male, tau.prior=HN05)
forestplot(bma03a, expo=TRUE, xlog=TRUE,
           xlab="rate ratio (RR)", title="female subgroup")
forestplot(bma03b, expo=TRUE, xlog=TRUE,
           xlab="rate ratio (RR)", title="male subgroup")
}
}
\keyword{datasets}
\concept{medicine}
\concept{cardiology}
\concept{incidence rates}
\section{Concepts}{
   medicine, cardiology, incidence rates
}
