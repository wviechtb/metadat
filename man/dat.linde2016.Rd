\name{dat.linde2016}
\docType{data}
\alias{dat.linde2016}
\title{Studies on Antidepressants for the Primary Care Setting}
\description{Results from 93 trials examining 22 interventions (including placebo and usual care) for the primary care of depression.}
\usage{
dat.linde2016
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{id}     \tab \code{integer}   \tab study ID \cr
\bold{lnOR}   \tab \code{numeric}   \tab response after treatment (log odds ratio) \cr
\bold{selnOR} \tab \code{numeric}   \tab standard error of log odds ratio \cr
\bold{treat1} \tab \code{character} \tab first treatment \cr
\bold{treat2} \tab \code{character} \tab second treatment
}
}
\details{
   This dataset comes from a network meta-analysis of 22 treatments of depression in primary care (Linde et al., 2016), based on 93 trials (79 two-arm trials, 13 three-arm trials, and one four-arm trial). The primary outcome was response after treatment (yes/no), defined as a reduction from baseline by at least 50\% on a depression scale. The dataset contains log odds ratios with standard errors for all pairwise comparisons.

   The interventions comprised both medical and psychological treatments, also in combination, including placebo and usual care (UC) (Linde et al., 2016). Pharmacological interventions were tricyclic antidepressants (TCA), selective serotonin reuptake inhibitors (SSRI), serotonin-noradrenaline reuptake inhibitors (SNRI), noradrenaline reuptake inhibitors (NRI), low- dose serotonin (5-HT2) antagonists and reuptake inhibitors (low-dose SARI), noradrenergic and specific serotonergic agents (NaSSa), reversible inhibitors of monoaminoxidase A (rMAO-A), hypericum extracts, and an individualized drug. Psychological interventions were cognitive behavioral therapy (CBT; four forms: face-to-face CBT, remote therapist-led CBT, guided self-help CBT, and no or minimal contact CBT), face-to-face problem-solving therapy (PST), face-to-face interpersonal psychotherapy, face-to-face psychodynamic therapy, and \dQuote{other face-to-face therapy}. Combination therapies were face-to-face CBT + SSRI, face-to-face PST + SSRI, and face-to-face interpersonal psychotherapy + SSRI.

   The dataset was used as an example in Rücker et al. (2020) to illustrate component network meta-analysis using frequentist methods.
}
\source{
   Linde, K., Rücker, G., Schneider, A., & Kriston, L. (2016). Questionable assumptions hampered interpretation of a network meta-analysis of primary care depression treatments. \emph{Journal of Clinical Epidemiology}, \bold{71}, 86--96. \verb{https://doi.org/10.1016/j.jclinepi.2015.10.010}
}
\references{
   Rücker, G., Petropoulou, M., & Schwarzer, G. (2020). Network meta-analysis of multicomponent interventions. \emph{Biometrical Journal}, \bold{62}(3), 808--821. \verb{https://doi.org/10.1002/bimj.201800167}
}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show results of first three studies (first study has three treatment
### arms)
head(dat.linde2016, 5)

\dontrun{
### Load netmeta package
suppressPackageStartupMessages(library("netmeta"))

### Print odds ratios and confidence limits with two digits
oldset <- settings.meta(digits = 2)

### Define order of treatments in printouts and forest plots
trts <- c("SSRI",
  "Face-to-face CBT", "Face-to-face interpsy", "Face-to-face PST",
  "Face-to-face CBT + SSRI", "Face-to-face interpsy + SSRI",
  "Face-to-face PST + SSRI",
  "Face-to-face psychodyn", "Other face-to-face",
  "TCA", "SNRI", "NRI", "Low-dose SARI", "NaSSa", "rMAO-A", "Ind drug",
  "Hypericum",
  "Remote CBT", "Self-help CBT", "No contact CBT",
  "UC", "Placebo")

### Conduct random effects network meta-analysis
net <- netmeta(lnOR, selnOR, treat1, treat2, id,
  data = dat.linde2016, reference.group = "placebo",
  seq = trts, sm = "OR", fixed = FALSE)

### Network graph
netgraph(net, seq = "o", number = TRUE)

### Show results
net
forest(net, xlim = c(0.2, 50))

### Additive component network meta-analysis with placebo as inactive
### treatment
nc <- netcomb(net, inactive = "placebo")
nc
forest(nc, xlim = c(0.2, 50))

### Use previous settings
settings.meta(oldset)
}
}
\keyword{datasets}
\concept{medicine}
\concept{psychiatry}
\concept{odds ratios}
\concept{network meta-analysis}
\concept{component network meta-analysis}
\section{Concepts}{
   medicine, psychiatry, odds ratios, network meta-analysis, component network meta-analysis
}
