\name{dat.nissen2007}
\docType{data}
\alias{dat.nissen2007}
\title{Rosiglitazone data set}
\description{Data on the effect of Rosiglitazone on infarction risk and mortality.}
\usage{
dat.nissen2007
}
\format{The data frame contains the following columns:
\tabular{lll}{
\bold{study}            \tab \code{character} \tab study identifier \cr
\bold{phase}            \tab \code{factor}    \tab study phase \cr
\bold{treatment}        \tab \code{character} \tab treatment group medication \cr
\bold{control}          \tab \code{character} \tab control group medication \cr
\bold{weeks}            \tab \code{numeric}   \tab follow-up duration (weeks) \cr
\bold{treat.total}      \tab \code{numeric}   \tab total number of patients in the treatment group \cr
\bold{treat.infarction} \tab \code{numeric}   \tab number of patients with myocardial infarction in the treatment group \cr
\bold{treat.death}      \tab \code{numeric}   \tab number of deaths in the treatment group \cr
\bold{cont.total}       \tab \code{numeric}   \tab total number of patients in the control group \cr
\bold{cont.infarction}  \tab \code{numeric}   \tab number of patients with myocardial infarction in the control group \cr
\bold{cont.death}       \tab \code{numeric}   \tab number of deaths in the control group
}
}
\details{
   Nissen and Wolski (2007) performed a systematic literature review aiming for randomized controlled trials (RCTs) investigating the effects of Rosiglitazone (Avandia) in comparison to a control treatment, and with a follow-up duration of at least 24 weeks. 42 studies were included. A meta-analysis was performed to quantify the treatment effect on the risks of myocardial infarction and cardiovascular death in terms of the associated odds ratio (OR).

   The data set features a number of \dQuote{zero} trials (no event observed in one of the treatment groups) as well as \dQuote{double-zero} trials (no event in either treatment group), which poses a challenge for some analysis methods. The original analysis was a common-effect analysis based on the \emph{Peto method} (see the \code{\link[metafor]{rma.peto}} help and the example code below). The data set as well as its original analysis have subsequently been discussed by other investigators (e.g., Diamond, Bax, & Kaul, 2007; Ruecker & Schumacher, 2008; Friedrich, Beyene, & Adhikari, 2009; Nissen & Wolski, 2010). Jackson et al. (2018) later surveyed a range of (random-effects) models that may be applicable in this context; see also the examples below.
}
\source{
   Nissen, S. E., & Wolski, K. (2007). Effect of Rosiglitazone on the risk of myocardial infarction and death from cardiovascular causes. \emph{New England Journal of Medicine}, \bold{356}(24), 2457-2471. \verb{https://doi.org/10.1056/NEJMoa072761}
}
\author{
   Christian \enc{Röver}{Roever}, \email{christian.roever@med.uni-goettingen.d}}
\references{
   Diamond, G. A., Bax, L., & Kaul, S. (2007). Uncertain effects of Rosiglitazone on the risk for myocardial infarction and cardiovascular death. \emph{Annals of Internal Medicine}, \bold{147}(8), 578--581. \verb{https://doi.org/10.7326/0003-4819-147-8-200710160-00182}

   Rücker, G., & Schumacher, M. (2008). Simpson’s paradox visualized: The example of the Rosiglitazone meta-analysis. \emph{BMC Medical Research Methodology}, \bold{8}, 34. \verb{https://doi.org/10.1186/1471-2288-8-34}

   Friedrich, J. O., Beyene, J., & Adhikari, N. K. J. (2009). Rosiglitazone: Can meta-analysis accurately estimate excess cardiovascular risk given the available data? Re-analysis of randomized trials using various methodologic approaches. \emph{BMC Research Notes}, \bold{2}, 5. \verb{https://doi.org/10.1186/1756-0500-2-5}

   Nissen, S. E., & Wolski, K. (2010). Rosiglitazone revisited: An updated meta-analysis of risk for myocardial infarction and cardiovascular mortality. \emph{Archives of Internal Medicine}, \bold{170}(14), 1191--1201. \verb{https://doi.org/10.1001/archinternmed.2010.207}

   Jackson, D., Law, M., Stijnen, T., Viechtbauer, W., & White, I. R. (2018). A comparison of seven random-effects models for meta-analyses that estimate the summary odds ratio. \emph{Statistics in Medicine}, \bold{37}(7), 1059--1085. \verb{https://doi.org/10.1002/sim.7588}
}
\examples{
dat.nissen2007

\dontrun{
library(metafor)

############################################################
# reproduce original "Peto" analyses

# infarction
ma01 <- rma.peto(ai=treat.infarction, ci=cont.infarction,
                 n1i=treat.total, n2i=cont.total,
                 slab=study, data=dat.nissen2007)
ma01

# mortality
ma02 <- rma.peto(ai=treat.death, ci=cont.death,
                 n1i=treat.total, n2i=cont.total,
                 slab=study, data=dat.nissen2007)
ma02

############################################################
# reproduce "Fixed, IV (CC)" analyses
# from Diamond/Bax/Kaul (2007), Table 1

# infarction
ma03 <- rma.uni(measure="OR", method="FE",
                drop00=TRUE,  # (exclude "double-zeroes")
                ai=treat.infarction, ci=cont.infarction,
                n1i=treat.total, n2i=cont.total,
                slab=study, data=dat.nissen2007)
ma03

# mortality
ma04 <- rma.uni(measure="OR", method="FE",
                drop00=TRUE,  # (exclude "double-zeroes")
                ai=treat.death, ci=cont.death,
                n1i=treat.total, n2i=cont.total,
                slab=study, data=dat.nissen2007)
ma04

############################################################
# estimate ORs based on a binomial GLMM
# (with *fixed* study effects)
# ("model 4" in Jackson et al., 2018)

# infarction
ma05 <- rma.glmm(measure="OR", model="UM.FS",
                 ai=treat.infarction, ci=cont.infarction,
                 n1i=treat.total, n2i=cont.total,
                 slab=study, data=dat.nissen2007)
ma05

# mortality
ma06 <- rma.glmm(measure="OR", model="UM.FS",
                 ai=treat.death, ci=cont.death,
                 n1i=treat.total, n2i=cont.total,
                 slab=study, data=dat.nissen2007)
ma06

############################################################
# estimate ORs based on binomial GLMM
# (with *random* study effects)
# ("model 5" in Jackson et al., 2018)

# infarction
ma07 <- rma.glmm(measure="OR", model="UM.RS", nAGQ=1,
                 ai=treat.infarction, ci=cont.infarction,
                 n1i=treat.total, n2i=cont.total,
                 slab=study, data=dat.nissen2007)
ma07

# mortality
ma08 <- rma.glmm(measure="OR", model="UM.RS", nAGQ=1,
                 ai=treat.death, ci=cont.death,
                 n1i=treat.total, n2i=cont.total,
                 slab=study, data=dat.nissen2007)
ma08

############################################################
# estimate ORs based on hypergeometric model
# (model 7 (approx.) in Jackson et al., 2018)

# infarction
ma09 <- rma.glmm(measure="OR", model="CM.AL",
                 ai=treat.infarction, ci=cont.infarction,
                 n1i=treat.total, n2i=cont.total,
                 slab=study, data=dat.nissen2007)
ma09

# mortality
ma10 <- rma.glmm(measure="OR", model="CM.AL",
                 ai=treat.death, ci=cont.death,
                 n1i=treat.total, n2i=cont.total,
                 slab=study, data=dat.nissen2007)
ma10

############################################################
# tabulate estimates and CIs

# log-OR infarction
logOR.inf <- rbind("Peto"    =c("OR"=ma01$b, "lower"=ma01$ci.lb, "upper"=ma01$ci.ub),
                   "IV-CC"   =c("OR"=ma03$b, "lower"=ma03$ci.lb, "upper"=ma03$ci.ub),
                   "M4-UM.FS"=c("OR"=ma05$b, "lower"=ma05$ci.lb, "upper"=ma05$ci.ub),
                   "M5-UM.RS"=c("OR"=ma07$b, "lower"=ma07$ci.lb, "upper"=ma07$ci.ub),
                   "M7-CM.AL"=c("OR"=ma09$b, "lower"=ma09$ci.lb, "upper"=ma09$ci.ub))

# log-OR mortality
logOR.mort <- rbind("Peto"    =c("OR"=ma02$b, "lower"=ma02$ci.lb, "upper"=ma02$ci.ub),
                    "IV-CC"   =c("OR"=ma04$b, "lower"=ma04$ci.lb, "upper"=ma04$ci.ub),
                    "M4-UM.FS"=c("OR"=ma06$b, "lower"=ma06$ci.lb, "upper"=ma06$ci.ub),
                    "M5-UM.RS"=c("OR"=ma08$b, "lower"=ma08$ci.lb, "upper"=ma08$ci.ub),
                    "M7-CM.AL"=c("OR"=ma10$b, "lower"=ma10$ci.lb, "upper"=ma10$ci.ub))

# show ORs (infarction)
round(exp(logOR.inf), 2)
# show ORs (mortality)
round(exp(logOR.mort), 2)
}
}
\keyword{datasets}
\concept{medicine}
\concept{cardiology}
\concept{odds ratios}
\concept{Peto's method}
\concept{generalized linear models}
\section{Concepts}{
   medicine, cardiology, odds ratios, Peto's method, generalized linear models
}
