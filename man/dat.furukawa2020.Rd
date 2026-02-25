\name{dat.furukawa2020}
\docType{data}
\alias{dat.furukawa2020}
\title{BDI-II and HAM-D scores in clinical depression trials}
\description{Results of seven trials reporting baseline means and standard deviations of the Beck Depression Inventory (BDI-II) and Hamilton Depression Rating Scale (HAM-D) in patients with major depression.}
\usage{
dat.furukawa2020
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{author} \tab \code{character} \tab First author and year of the study. \cr
\bold{mi} \tab \code{numeric} \tab Mean depression score at baseline (BDI-II). \cr
\bold{sdi} \tab \code{numeric} \tab Standard deviation of the depression score at baseline (BDI-II). \cr
\bold{ni} \tab \code{integer} \tab Sample size. \cr
\bold{m.hamd} \tab \code{numeric} \tab Mean depression score at baseline (HAM-D). \cr
\bold{sd.hamd} \tab \code{numeric} \tab Standard deviation of the depression score at baseline (HAM-D). \cr
\bold{n.hamd} \tab \code{integer} \tab Sample size (for HAM-D; typically same as \code{ni}). \cr
}
}
\details{
This dataset was derived from an individual patient data analysis by Furukawa et al. (2020), examining the relationship between the Beck Depression Inventory (BDI; Beck et al., 1961, 1996) and the Hamilton Depression Rating Scale (HAM-D; Hamilton, 1960). It contains baseline means and standard deviations of both the BDI-II and HAM-D in patients with major depression, as measured in seven clinical trials examining the effects of antidepressants and/or psychotherapy. 

The dataset can be used to illustrate meta-analyses of means (pooling means for BDI and HAM-D separately), or a bivariate meta-analysis in which both outcomes are modeled jointly.
}
\source{
Furukawa, T. A., Reijnders, M., Kishimoto, S., Sakata, M., DeRubeis, R. J., Dimidjian, S., \dots, \& Lespérance, F. (2020). Translating the BDI and BDI-II into the HAMD and vice versa with equipercentile linking. \emph{Epidemiology and Psychiatric Sciences}, \bold{29}.
}
\references{
Beck, A. T., Ward, C., Mendelson, M., Mock, J., \& Erbaugh, J. (1961). Beck Depression Inventory (BDI). \emph{Archives of General Psychiatry}, \bold{4}(6), 561--571.

Beck, A. T., Steer, R. A., \& Brown, G. (1996). Beck Depression Inventory--II. \emph{Psychological Assessment}.

Hamilton, M. (1960). A rating scale for depression. \emph{Journal of Neurology, Neurosurgery and Psychiatry}, \bold{23}, 56--62.
}
\author{Mathias Harrer, \email{m.harrer@vu.nl}, Toshi A. Furukawa, Pim Cuijpers}
\examples{
### copy data into 'dat' and examine data
dat <- dat.furukawa2020
dat

\dontrun{
library(metafor)

# Calculate sampling variance for BDI score means
dat <- escalc(mi = mi, sdi = sdi, ni = ni, 
              data = dat, measure = "MN")

# Run meta-analysis
rma(yi=yi, vi=vi, data = dat, slab = author)

# Also calculate sampling variances for HAMD scores
# Bind together to form long-format dataset
rbind(
   escalc(mi = mi, sdi = sdi, ni = ni, 
       data = dat, measure = "MN") |>
       within({outcome = "bdi"}),
   escalc(mi = m.hamd, sdi = sd.hamd, ni = ni, 
       data = dat, measure = "MN") |>
       within({outcome = "hamd"})
) -> dat

# Run a bivariate model
res <- rma.mv(yi, vi, mods = ~ outcome -1,
              random = ~ outcome | author, struct="UN",
              data=dat, method="ML")

# Regression of the true study means
reg <- matreg(y=2, x=1, R=res$G, cov=TRUE, 
              means=coef(res), n=res$g.levels.comb.k)

# Create a bubble plot with the regression line
plot(dat$mi, dat$m.hamd, xlab="BDI Score", ylab="HAMD Score",
     pch=21, bg="grey70", col="black",     
     cex=sqrt(dat$ni)/max(sqrt(dat$ni))*3)
abline(a=reg$tab$beta[1], b=reg$tab$beta[2], lwd=3)
}
}
\keyword{datasets}
\concept{psychiatry}
\concept{psychology}
\concept{raw means}
\concept{multivariate models}
\concept{single-arm studies}
\section{Concepts}{
   psychiatry, psychology, raw means, multivariate models, single-arm studies
}