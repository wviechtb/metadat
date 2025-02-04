\name{dat.linde2015}
\docType{data}
\alias{dat.linde2015}
\title{Studies on Classes of Antidepressants for the Primary Care Setting}
\description{Results from 66 trials examining eight classes of antidepressants and placebo for the primary care setting.}
\usage{
dat.linde2015
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{id}         \tab \code{integer}   \tab study ID \cr
\bold{author}     \tab \code{character} \tab first author \cr
\bold{year}       \tab \code{integer}   \tab year of publication \cr
\bold{treatment1} \tab \code{character} \tab treatment 1 \cr
\bold{treatment2} \tab \code{character} \tab treatment 2 \cr
\bold{treatment3} \tab \code{character} \tab treatment 3 \cr
\bold{n1}         \tab \code{integer}   \tab number of patients (arm 1) \cr
\bold{resp1}      \tab \code{integer}   \tab number of early responder (arm 1) \cr
\bold{remi1}      \tab \code{integer}   \tab number of early remissions (arm 1) \cr
\bold{loss1}      \tab \code{integer}   \tab number of patients loss to follow-up (arm 1) \cr
\bold{loss.ae1}   \tab \code{integer}   \tab number of patients loss to follow-up due to adverse events (arm 1) \cr
\bold{ae1}        \tab \code{integer}   \tab number of patients with adverse events (arm 1) \cr
\bold{n2}         \tab \code{integer}   \tab number of patients (arm 2) \cr
\bold{resp2}      \tab \code{integer}   \tab number of early responder (arm 2) \cr
\bold{remi2}      \tab \code{integer}   \tab number of early remissions (arm 2) \cr
\bold{loss2}      \tab \code{integer}   \tab number of patients loss to follow-up (arm 2) \cr
\bold{loss.ae2}   \tab \code{integer}   \tab number of patients loss to follow-up due to adverse events (arm 2) \cr
\bold{ae2}        \tab \code{integer}   \tab number of patients with adverse events (arm 2) \cr
\bold{n3}         \tab \code{integer}   \tab number of patients (arm 3) \cr
\bold{resp3}      \tab \code{integer}   \tab number of early responder (arm 3) \cr
\bold{remi3}      \tab \code{integer}   \tab number of early remissions (arm 3) \cr
\bold{loss3}      \tab \code{integer}   \tab number of patients loss to follow-up (arm 3) \cr
\bold{loss.ae3}   \tab \code{integer}   \tab number of patients loss to follow-up due to adverse events (arm 3) \cr
\bold{ae3}        \tab \code{integer}   \tab number of patients with adverse events (arm 3)
}
}
\details{
   This dataset comes from a systematic review of 8 pharmacological treatments of depression and placebo in primary care with 66 studies (8 of which were 3-arm studies) including 14,785 patients.

   The primary outcome is early response, defined as at least a 50\% score reduction on a depression scale after completion of treatment. Secondary outcomes (also measured as dichotomous) were early remission (defined as having a symptom score below a fixed threshold after completion of treatment), lost to follow-up, lost to follow-up due to adverse events, and any adverse event. The odds ratio was used as effect measure.

   This dataset was used as an example in Rücker and Schwarzer (2017) who introduced methods to resolve conflicting rankings of outcomes in network meta-analysis.
}
\source{
   Linde, K., Kriston, L., Rücker, G., Jamil, S., Schumann, I., Meissner, K., Sigterman, K., & Schneider, A. (2015). Efficacy and acceptability of pharmacological treatments for depressive disorders in primary care: Systematic review and network meta-analysis. \emph{Annals of Family Medicine}, \bold{13}(1), 69--79. \verb{https://doi.org/10.1370/afm.1687}
}
\references{
   Rücker, G., & Schwarzer, G. (2017). Resolve conflicting rankings of outcomes in network meta-analysis: Partial ordering of treatments. \emph{Research Synthesis Methods}, \bold{8}(4), 526--536. \verb{https://doi.org/10.1002/jrsm.1270}
}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show results from first three studies (including three-arm study
### Lecrubier 1997)
head(dat.linde2015, 3)

\dontrun{
### Load netmeta package
suppressPackageStartupMessages(library("netmeta"))

### Print odds ratios and confidence limits with two digits
oldset <- settings.meta(digits = 2)

### Change appearance of confidence intervals
cilayout("(", "-")

### Define order of treatments in printouts
trts <- c("TCA", "SSRI", "SNRI", "NRI", "Low-dose SARI",
 "NaSSa", "rMAO-A", "Hypericum", "Placebo")

### Transform data from wide arm-based format to contrast-based format
### (outcome: early response). Argument 'sm' has to be used for odds
### ratio as summary measure; by default the risk ratio is used in the
### metabin function called internally.
pw1 <- pairwise(list(treatment1, treatment2, treatment3),
  event = list(resp1, resp2, resp3),
  n = list(n1, n2, n3),
  studlab = id, data = dat.linde2015, sm = "OR")

### Conduct random effects network meta-analysis for primary outcome
### (early response); small number of early responses is bad (argument
### small.values)
net1 <- netmeta(pw1, fixed = FALSE, reference = "Placebo", seq = trts,
  small.values = "bad")
net1

### Random effects NMA for early remission
pw2 <- pairwise(treat = list(treatment1, treatment2, treatment3),
  event = list(remi1, remi2, remi3),
  n = list(n1, n2, n3),
  studlab = id, data = dat.linde2015, sm = "OR")
net2 <- netmeta(pw2, fixed = FALSE,
   seq = trts, ref = "Placebo", small.values = "bad")
net2

### Ranking of treatments
nr1 <- netrank(net1)
nr2 <- netrank(net2)
nr1
nr2

### Partial order of treatment rankings (two outcomes)
outcomes <- c("Early response", "Early remission")
po12 <- netposet(nr1, nr2, outcomes = outcomes)
plot(po12)

### Use previous settings
settings.meta(oldset)
}
}
\keyword{datasets}
\concept{medicine}
\concept{psychiatry}
\concept{odds ratios}
\concept{network meta-analysis}
\section{Concepts}{
   medicine, psychiatry, odds ratios, network meta-analysis
}
