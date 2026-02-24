\name{dat.chiarito2020}
\docType{data}
\alias{dat.chiarito2020}
\title{Studies Investigating the Efficacy of P2Y12-Inhibitors in Atherosclerosis}
\description{Data on baseline parameters, efficacy endpoints and risk-of-bias from nine studies.}
\usage{
dat.chiarito2020
}
\format{The data frame contains the following columns:
\tabular{lll}{
\bold{study}                  \tab \code{character} \tab study identifier \cr
\bold{year}                   \tab \code{numeric}   \tab publication year \cr
\bold{p2y12}                  \tab \code{character} \tab type of P2Y12 inhibitor \cr
\bold{duration.months}        \tab \code{numeric}   \tab study duration \cr
\bold{p2y12.daily.dosage}     \tab \code{character} \tab daily dosage of P2Y12 inhibitor \cr
\bold{aspirin.daily.dosage}   \tab \code{character} \tab daily dosage of aspirin \cr
\bold{p2y12.daily.mg}         \tab \code{numeric}   \tab daily dose of P2Y12 inhibitor (mg) \cr
\bold{aspirin.daily.mg}       \tab \code{numeric}   \tab daily dose of aspirin (mg) \cr
\bold{baseline.age}           \tab \code{numeric}   \tab mean age at baseline \cr
\bold{baseline.males}         \tab \code{numeric}   \tab proportion of males in study population \cr
\bold{baseline.diabetes}      \tab \code{numeric}   \tab proportion of diabetic patients in study population \cr
\bold{baseline.hypertension}  \tab \code{numeric}   \tab proportion of patients with hypertension in study population \cr
\bold{baseline.dyslipidaemia} \tab \code{numeric}   \tab proportion of patients with dyslipidaemia in study population \cr
\bold{p2y12.mi}               \tab \code{numeric}   \tab number of patients with myocardial infarction in experimental group \cr
\bold{p2y12.stroke}           \tab \code{numeric}   \tab number of patients with stroke in experimental group \cr
\bold{p2y12.death}            \tab \code{numeric}   \tab number of deaths in experimental group \cr
\bold{p2y12.vdeath}           \tab \code{numeric}   \tab number of vascular deaths in experimental group \cr
\bold{p2y12.total}            \tab \code{numeric}   \tab total number of patients experimental group \cr
\bold{aspirin.mi}             \tab \code{numeric}   \tab number of patients with myocardial infarction in control group \cr
\bold{aspirin.stroke}         \tab \code{numeric}   \tab number of patients with stroke in control group \cr
\bold{aspirin.death}          \tab \code{numeric}   \tab number of deaths in control group \cr
\bold{aspirin.vdeath}         \tab \code{numeric}   \tab number of vascular deaths in control group \cr
\bold{aspirin.total}          \tab \code{numeric}   \tab total number of patients in control group \cr
\bold{rob.R}                  \tab \code{factor}    \tab risk of bias arising from the randomization process (R) \cr
\bold{rob.D}                  \tab \code{factor}    \tab risk of bias due to deviations from intended interventions (D) \cr
\bold{rob.Mi}                 \tab \code{factor}    \tab risk of bias due to missing outcome data (Mi) \cr
\bold{rob.Me}                 \tab \code{factor}    \tab risk of bias in measurement of the outcome (Me) \cr
\bold{rob.S}                  \tab \code{factor}    \tab risk of bias in selection of the reported result (S) \cr
\bold{rob.overall}            \tab \code{factor}    \tab overall risk of bias
}
}
\details{
   Chiarito et al. (2020) reviewed studies investigating the efficacy of P2Y12-inhibitors (compared to aspirin) for the secondary prevention of myocardial infarction in patients with established atherosclerosis.

   A diagnosis of atherosclerosis, the development of lesions in arteries, is a risk factor for myocardial infarction or stroke, and a range of therapies (including aspirin, other drugs, or surgery) are available. P2Y12-inhibitors are antiplatelet drugs and as such might serve as an alternative to the commonly used aspirin; it was of interest to review and summarize the current scientific evidence on the efficacy of this type of drug in comparison to aspirin. To this end, Chiarito et al. (2020) performed a systematic review and meta-analysis; the systematic review had been pre-registered (PROSPERO CRD42018115037), and the investigation included a risk-of-bias assessment of the nine studies included. Co-primary endpoints were myocardial infarction and stroke, secondary endpoints were death and vascular death.
}
\source{
   Chiarito, M., Sanz-Sánchez, J., Cannata, F., Cao, D., Sturla, M., Panico, C., Godino, C., Regazzoli, D., Reimers, B., De Caterina, R., Condorelli, G., Ferrante, G., & Stefanini, G. G. (2020). Monotherapy with a P2Y12 inhibitor or aspirin for secondary prevention in patients with established atherosclerosis: A systematic review and meta-analysis. \emph{The Lancet}, \bold{395}(10235), 1487--1495. \verb{https://doi.org/10.1016/s0140-6736(20)30315-9}
}
\author{
   Christian \enc{Röver}{Roever}, \email{christian.roever@med.uni-goettingen.de}
}
\references{
   Zapf, A., \enc{Röver}{Roever}, C. (2023). Metaanalyse. In J. Gertheiss, M. Schmid, & M. Spindler (Eds.), \emph{Moderne Verfahren der Angewandten Statistik}. Berlin, Germany: Springer Spektrum. \verb{https://doi.org/10.1007/978-3-662-63496-7_19-1}
}
\examples{
dat.chiarito2020

\dontrun{
library(metafor)
library(meta)
library(bayesmeta)

# show plain data on stroke
dat.chiarito2020[-5, c("study","p2y12.stroke","p2y12.total","aspirin.stroke","aspirin.total")]

# show event rates in both treatment groups
cbind.data.frame("study"   = dat.chiarito2020$study,
                 "p2y12"   = dat.chiarito2020$p2y12.stroke / dat.chiarito2020$p2y12.total,
                 "aspirin" = dat.chiarito2020$aspirin.stroke / dat.chiarito2020$aspirin.total)

# compute effect measures (log-ORs)
# (using the "escalc()" function from the "metafor" package)
es.stroke <- escalc(measure="OR",
                    ai=p2y12.stroke,   n1i=p2y12.total,
                    ci=aspirin.stroke, n2i=aspirin.total,
                    slab=study, subset=is.finite(p2y12.stroke),
                    data=dat.chiarito2020)

# show effect measures (log-ORs)
summary(es.stroke)

# show effect measures (ORs und 95 percent CI)
cbind("study" = es.stroke$study,
      exp(summary(es.stroke)[,c("yi","ci.lb","ci.ub")]))

# show data in a forest plot
forestplot(es.stroke, xlab="log-OR")
forestplot(es.stroke, expo=TRUE, xlog=TRUE, xlab="odds ratio (OR)")

############################################################
#  meta-analysis (frequentist, "metafor" package)

# using default settings (random-effects model, REML-estimator)
rma.uni(es.stroke)

# analysis using Paule-Mandel estimator and HKSJ intervals
rma01 <- rma.uni(es.stroke, method="PM", test="knha")

# show results
rma01

# illustrate in a forest plot
forest(rma01)
forest(rma01, atransf=exp)

############################################################
#  meta-analysis (frequentist, "meta" package)

# analogous analysis to above, using the "meta" package
meta01 <- metabin(event.e=p2y12.stroke,   n.e=p2y12.total,
                  event.c=aspirin.stroke, n.c=aspirin.total,
                  studlab=study, data=dat.chiarito2020,
                  subset=is.finite(p2y12.stroke),
                  sm="OR",
                  method.tau="PM",
                  method.random.ci="HK", method="Inverse")

meta01
summary(meta01)
forest(meta01)

############################################################
#  meta-analysis (Bayesian, "bayesmeta" package)

# analysis using default settings (uniform prior for mu und tau)
bma01 <- bayesmeta(es.stroke)

# show results
bma01

# show forest plots (for log-OR and OR)
forestplot(bma01, xlab="log-OR")
forestplot(bma01, exponentiate=TRUE, xlog=TRUE, xlab="OR")
}
}
\keyword{datasets}
\concept{medicine}
\concept{cardiology}
\concept{odds ratios}
\concept{risk-of-bias}
\section{Concepts}{
   medicine, cardiology, odds ratios, risk-of-bias
}
