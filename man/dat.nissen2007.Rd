\name{dat.nissen2007}
\docType{data}
\alias{dat.nissen2007}
\title{Studies on Effect of Rosiglitazone on the Risk of Myocardial Infarction and Death from Cardiovascular Causes}
\description{Results from 48 trials examining the effect of rosiglitazone on the risk of myocardial infarction and death from cardiovascular causes.}
\usage{
dat.nissen2007
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study} \tab \code{character} \tab Study ID \cr
\bold{group} \tab \code{character} \tab Treatment group (rosiglitazone or control) \cr
\bold{intervention} \tab \code{character} \tab Intervention group, i.e., combination of drug classes \cr
\bold{detailed.intervention} \tab \code{character} \tab Intervention group with drug names instead of classes \cr
\bold{phase} \tab \code{integer} \tab Phase of clinical trial \cr
\bold{duration} \tab \code{integer} \tab Duration of the trial (in weeks) \cr
\bold{n.all} \tab \code{integer} \tab Number of patients \cr
\bold{n} \tab \code{integer} \tab Number of patients with information on outcomes \cr
\bold{deaths} \tab \code{integer} \tab Number of deaths \cr
\bold{infarcts} \tab \code{integer} \tab Number of myocardial infarctions \cr
\bold{type} \tab \code{character} \tab ADD_DESCRIPTION \cr
\bold{population} \tab \code{character} \tab Details on the trial population \cr
\bold{period} \tab \code{character} \tab Trial period \cr
\bold{age} \tab \code{numeric} \tab Mean age (in years) \cr
\bold{male} \tab \code{numeric} \tab Percentage of males \cr
\bold{hemoglobin} \tab \code{numeric} \tab Mean baseline glycated hemoglobin level \cr
}  
}
\details{This is a data set with very rare events. In six trials, no event was observed at all. The data set is in long arm-based format.}
\source{
  Nissen, S.E. & Wolski K. (2007). Effect of Rosiglitazone on the Risk of Myocardial Infarction and Death from Cardiovascular Causes. \emph{New England Journal of Medicine}, \bold{356}(24), 2457--71. \verb{https://doi.org/10.1056/NEJMoa072761}}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show first 6 rows / 3 trials of the dataset
head(dat.nissen2007)

\dontrun{
### Load meta package
suppressPackageStartupMessages(library("meta"))

### Print odds ratios and confidence limits with two digits and define
### labels shown in forest plots
oldset <- settings.meta(digits = 2,
  label.e = "Rosiglitazone", label.c = "Control",
  label.left = "Favors rosiglitazome",
  label.right = "Favors control")

### Transform data from long arm-based format to contrast-based
### format. Argument 'sm' has to be used for odds ratio as summary
### measure; by default the risk ratio is used in the metabin function
### called internally.
pw <- pairwise(treat = group, event = deaths, n = n, studlab = study,
  data = dat.nissen2007, sm = "OR", varnames = c("lnOR", "selnOR"))

### Fit the inverse variance model
mod_iv <- metabin(pw,
  text.common = "IV method (common)",
  text.random = "IV method (random)")

### Fit the Mantel-Haenszel model
mod_mh <- update(mod_iv, method = "MH", random = FALSE,
  method.incr = gs("method.incr"),
  text.common = "MH method")

### Fit the Peto model
mod_peto <- update(mod_mh, method = "Peto",
  text.common = "Peto method")

### Fit generalized linear mixed models (GLMM)
mod_glmm <- update(mod_mh, method = "glmm", model = "CM.AL",
  random = TRUE,
  text.common = "GLMM (common)",
  text.random = "GLMM (random)")

if (requireNamespace("brglm2", quietly = TRUE)) {
### Fit the logistic regression model with penalized likelihood (LRP)
mod_plma <- update(mod_glmm, method = "LRP",
  text.common = "LRP method (common)",
  text.random = "LRP method (random)")

### Fit the logistic regression model after excluding double zero studies
mod_plma1 <- metabin(event1, n1, event2, n2, studlab = study,
  data = subset(pw, !is.na(lnOR)), sm = "OR", method = "LRP",
  text.common = "LRP method, exclude zeros (common)",
  text.random = "LRP method, exclude zeros (random)")
}

### Create forest plot with all results
mm <- metaadd(mod_iv, data = mod_mh)
mm <- metaadd(mm, data = mod_peto)
mm <- metaadd(mm, data = mod_glmm)
#
if (requireNamespace("brglm2", quietly = TRUE)) {
mm <- metaadd(mm, data = mod_plma)
mm <- metaadd(mm, data = mod_plma1)
}
#
# Filename for forest plot
#
fname <- tempfile(pattern = "forest", fileext = ".pdf")
fname
#
forest(mm, hetstat = FALSE, file = fname, width = 10, rows.gr = 1)

### Use previous settings
settings.meta(oldset)
}
}
\keyword{datasets}
\concept{odds ratios}
