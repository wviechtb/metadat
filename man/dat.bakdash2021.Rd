\name{dat.bakdash2021}
\docType{data}
\alias{dat.bakdash2021}
\title{Dataset on Situation Awareness and Task Performance Associations}
\description{Results from 77 papers with 678 effects evaluating associations among measures of situation awareness and task performance.}
\usage{
dat.bakdash2021
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{Author}            \tab \code{character} \tab paper author(s) \cr
\bold{Year}              \tab \code{integer}   \tab year of paper publication \cr
\bold{Title}             \tab \code{character} \tab title of paper \cr
\bold{DOI}               \tab \code{character} \tab digital object identifier (DOI) \cr
\bold{DTIC.link}         \tab \code{character} \tab permanent link for Defense Technical Information Collection (DITC) reports; see: \verb{https://www.dtic.mil} \cr
\bold{SA.measure.type}   \tab \code{character} \tab type of SA measure \cr
\bold{Sample.size}       \tab \code{integer}   \tab reported sample size \cr
\bold{Sample.size.stats} \tab \code{integer}   \tab reported sample size based on reported statistics (this reflects excluded participants) \cr
\bold{es.z}              \tab \code{numeric}   \tab z-transformed correlation coefficient; includes ghost results (disclosed and undisclosed non-significant effects not reported in detail) imputed using the draw method described in Bakdash et al. (2021a) \cr
\bold{vi.z}              \tab \code{numeric}   \tab variance for z-transformed correlation (calculated using \code{Sample.size.stats}, \emph{not} \code{Sample.size}) \cr
\bold{SampleID}          \tab \code{character} \tab unique identifier for each experiment/study \cr
\bold{Outcome}           \tab \code{integer}   \tab unique value for each effect size
}
}
\details{
   The dataset contains behavioral experiments from 77 papers/79 studies with a total of 678 effects, evaluating associations among measures of situation awareness (\dQuote{knowing what is going on}) and task performance. Examples of situation awareness include knowledge of current vehicle speed in a simulated driving task and location and heading of aircraft in a simulated air traffic control task. Corresponding examples of task performance include \dQuote{the number of collisions in a simulated driving task} and \dQuote{subject matter expert rating of conflict management in a simulated air control task} (Bakdash et al. 2021a, p. 2). This dataset and the \sQuote{Examples} are a highly simplified version of the data and code in Bakdash et al. (2021b; 2021c). The journal article by Bakdash et al. (2021a) describes the systematic review and meta-analysis in detail.

   This dataset is used to illustrate multilevel multivariate meta-analytic models for the overall pooled effect and pooled effects by situation awareness measure. We also adjust meta-analytic models using cluster-robust variance estimation / cluster-robust inference with the \code{\link[metafor]{robust}} function in \emph{metafor}. Results are shown graphically in a customized forest plot with a prediction interval (estimated plausible range of individual effects). Last, we create a table summarizing the estimated meta-analytic heterogeneity parameters.

   The meta-analytic results show most pooled effect sizes in the positive medium range or less. There was also substantial meta-analytic heterogeneity (estimated systematic variance in true effects), nearing the magnitude of the overall pooled effect. We interpret the meta-analytic results as situation awareness typically having limited validity for task performance (i.e., good situation awareness does not tend to have strong probabilistic links with good performance and vice-versa). More formally, measures of situation awareness do not generally and meaningfully capture cognitive processes and other relevant factors underlying task performance.

   \subsection{Run-Time}{

   The code run-time can be greatly sped-up using a linear algebra library with \emph{R} that makes use of multiple CPU cores. See: \url{https://www.metafor-project.org/doku.php/tips:speeding_up_model_fitting}. To measure the run-time, uncomment these three lines: \code{start.time <- Sys.time()}, \code{end.time <- Sys.time()}, and \code{end.time - start.time}. Run-times on Windows 10 x64 with the Intel Math Kernel Library are:
   \tabular{rll}{
   \tab \emph{CPU} \tab \emph{Run-Time (Minutes)} \cr
   \tab i7-11850H  \tab 2.49 \cr
   \tab i7-4770    \tab 5.38 \cr
   }
   }

}
\source{
   Bakdash, J. Z., Marusich, L. R., Cox, K. R., Geuss, M. N., Zaroukian, E. G., & Morris, K. M. (2021b). The validity of situation awareness for performance: A meta-analysis (Code Ocean Capsule). \verb{https://doi.org/10.24433/CO.1682542.v4}

   Bakdash, J. Z., Marusich, L. R., Cox, K. R., Geuss, M. N., Zaroukian, E. G., & Morris, K. M. (2021c). The validity of situation awareness for performance: A meta-analysis (Systematic Review, Data, and Code). \verb{https://doi.org/10.17605/OSF.IO/4K7ZV}
}
\references{
   Bakdash, J. Z., Marusich, L. R., Cox, K. R., Geuss, M. N., Zaroukian, E. G., & Morris, K. M. (2021a). The validity of situation awareness for performance: A meta-analysis. \emph{Theoretical Issues in Ergonomics Science}, 1--24. \verb{https://doi.org/10.1080/1463922X.2021.1921310}

   Supplemental materials: \verb{https://www.tandfonline.com/doi/suppl/10.1080/1463922X.2021.1921310/suppl_file/ttie_a_1921310_sm5524.docx}
}
\author{
   Jonathan Bakdash, \email{jonathan.z.bakdash.civ@army.mil}, \email{jbakdash@gmail.com} \cr
   Laura Marusich, \email{laura.m.cooper20.civ@army.mil}, \email{lmarusich@gmail.com}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.bakdash2021
head(dat[c(1,2,6,8:12)])

\dontrun{
#start.time <- Sys.time()

### load metafor
library(metafor)

### multilevel meta-analytic model to get the overall pooled effect
res.overall <- rma.mv(es.z, vi.z, mods = ~ 1,
                      random = ~ 1 | SampleID / Outcome,
                      data = dat,
                      test = "t")
res.overall

### get prediction interval
predict(res.overall)

### cluster-robust variance estimation (CRVE) / cluster-robust inference
res.overall.crve <- robust(res.overall, cluster = SampleID)
res.overall.crve

### get prediction interval
res.overall.crve.pred <- predict(res.overall.crve)
res.overall.crve.pred

### multilevel meta-analytic model for SA measures
res.sa <-  rma.mv(es.z, vi.z, mods = ~ SA.measure.type - 1,
                  random = ~ 1 | SampleID / Outcome,
                  data = dat,
                  test = "t")
res.sa

### cluster-robust variance estimation (CRVE) / cluster-robust inference
res.sa.crve <- robust(res.sa, cluster = SampleID)
res.sa.crve

### profile likelihood plots
par(mfrow=c(2,1))
profile(res.sa.crve, progbar = FALSE)

### format and combine output of meta-analytic models for the forest plot
all.z        <- c(res.sa.crve$beta,            # SA measures
                  res.overall.crve$beta,       # pooled effect for confidence interval (CI)
                  res.overall.crve$beta)       # pooled effect for prediction interval (PI)

all.ci.lower <- c(res.sa.crve$ci.lb,           # SA measures
                  res.overall.crve.pred$ci.lb, # pooled effect, lower CI
                  res.overall.crve.pred$pi.lb) # pooled effect, lower PI

all.ci.upper <- c(res.sa.crve$ci.ub,           # SA measures
                  res.overall.crve.pred$ci.ub, # pooled effect, upper CI
                  res.overall.crve.pred$pi.ub) # pooled effect, upper PI

### note: there is no p-value for the PI
all.pvals  <- c(res.sa.crve$pval, res.overall.crve$pval)
all.labels <- c(sort(unique(dat$SA.measure.type)), "Overall", "95\% Prediction Interval")

### function to round p-values for the forest plot
pvals.round <- function(input) {
  input <- ifelse(input < 0.001, "< 0.001",
           ifelse(input < 0.01, "< 0.01",
           ifelse(input < 0.05 & input >= 0.045, "< 0.05",
           ifelse(round(input, 2) == 1.00, "0.99",
           sprintf("\%.2f", round(input, 2))))))}

all.pvals.rounded <- pvals.round(all.pvals)

### forest plot
plot.vals <- data.frame(all.labels, all.z, all.ci.lower, all.ci.upper)

par(mfrow=c(1,1), cex = 1.05)
forest(plot.vals$all.z,
       ci.lb = plot.vals$all.ci.lower,
       ci.ub = plot.vals$all.ci.upper,
       slab  = plot.vals$all.labels,
       psize = 1,
       efac = 0, xlim = c(-1.8, 2.5), clim = c(-1, 1),
       transf = transf.ztor, # transform z to r
       at = seq(-0.5, 1, by = 0.25),
       xlab = expression("Correlation Coefficient"~"("*italic('r')*")"),
       main = "\n\n\nSA Measures",
       ilab = c(all.pvals.rounded, ""), ilab.xpos = 2.45, ilab.pos = 2.5,
       digits = 2, refline = 0, annotate = FALSE)

### keep trailing zero using sprintf
output <- cbind(sprintf("\%.2f", round(transf.ztor(plot.vals$all.z), 2)),
                sprintf("\%.2f", round(transf.ztor(plot.vals$all.ci.lower), 2)),
                sprintf("\%.2f", round(transf.ztor(plot.vals$all.ci.upper), 2)))

### alignment kludge
annotext <- apply(output, 1, function(x) {paste0("  ", x[1], " [", x[2],", ", x[3], "]")})
text( 1.05, 12:1, annotext, pos = 4, cex = 1.05)
text(-1.475, 14.00, "SA Measure", cex = 1.05)
text( 2.30,  14.00, substitute(paste(italic('p-value'))), cex = 1.05)
text( 1.55,  14.00, "Correlation [95\% CI]", cex = 1.05)
abline(h = 1.5)

### black polygon for overall mean CIs
addpoly(all.z[11], ci.lb = all.ci.lower[11], ci.ub = all.ci.upper[11],
        rows = 2, annotate = FALSE, efac = 1.5, transf = transf.ztor)

### white polygon for PI
addpoly(all.z[12], ci.lb = all.ci.lower[12], ci.ub = all.ci.upper[12],
        rows = 1, col = "white", border = "black",
        annotate = FALSE, efac = 1.5, transf = transf.ztor)

par(mfrow=c(1,1), cex = 1) # reset graph parameters to default

### confidence intervals for the variance components
re.CI.variances <- confint(res.overall)
re.CI.variances

sigma1.z <- data.frame(re.CI.variances[[1]]["random"])
sigma2.z <- data.frame(re.CI.variances[[2]]["random"])

### fit model using alternative multivariate parameterization
res.overall.alt <- rma.mv(es.z, vi.z, mods = ~ 1,
                          random = ~ factor(Outcome) | factor(SampleID),
                          data = dat,
                          test = "t")

### confidence intervals for the total amount of heterogeneity variance component
res.overall.alt.tau <- confint(res.overall.alt, tau2=1)$random

### I^2: http://www.metafor-project.org/doku.php/tips:i2_multilevel_multivariate
W <- diag(1/dat$vi.z)
X <- model.matrix(res.overall)
P <- W - W \%*\% X \%*\% solve(t(X) \%*\% W \%*\% X) \%*\% t(X) \%*\% W

### I^2 (variance due to heterogeneity): 61\%
I2 <- 100 * res.overall.alt$tau2 /
      (res.overall.alt$tau2 + (res.overall$k-res.overall$p)/sum(diag(P)))
I2

### 95\% CI for I^2 using uncertainty around tau^2
I2.CI.lb <- 100 * res.overall.alt.tau[1,2] /
            (res.overall.alt.tau[1,2] + (res.overall$k-res.overall$p)/sum(diag(P)))
I2.CI.lb

I2.CI.ub <- 100 * res.overall.alt.tau[1,3] /
            (res.overall.alt.tau[1,3] + (res.overall$k-res.overall$p)/sum(diag(P)))
I2.CI.ub

### total amount of heterogeneity (tau)
sqrt(res.overall.alt$tau2)

### heterogeneity table
table.heterogeneity <- data.frame(matrix(ncol = 3, nrow = 4))
colnames(table.heterogeneity) <- c("Parameter Value",
                                   "Lower 95\% CI",
                                   "Upper 95\% CI")
rownames(table.heterogeneity) <- c("Tau (Total)",
                                   "Tau1 (Between paper)",
                                   "Tau2 (Within paper)",
                                   "I2 (\%)")

table.heterogeneity[1,] <- res.overall.alt.tau[2,]
table.heterogeneity[2,] <- sigma1.z[2,]
table.heterogeneity[3,] <- sigma2.z[2,]
table.heterogeneity[4,] <- c(I2, I2.CI.lb, I2.CI.ub)

round(table.heterogeneity, 2)

#end.time <- Sys.time()
#end.time - start.time

}
}
\keyword{datasets}
\concept{psychology}
\concept{human factors}
\concept{engineering}
\concept{correlation coefficients}
\concept{multilevel models}
\concept{multivariate models}
\concept{cluster-robust inference}
\section{Concepts}{
   psychology, human factors, engineering, correlation coefficients, multilevel models, multivariate models, cluster-robust inference
}
