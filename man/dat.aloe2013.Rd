\name{dat.aloe2013}
\docType{data}
\alias{dat.aloe2013}
\title{Studies on the Association Between Supervision Quality and Various Outcomes in Social, Mental Health, and Child Welfare Workers}
\description{Results from 5 studies examining the association between various measures of supervision quality and various work-related outcomes in social, mental health, and child welfare workers.}
\usage{
dat.aloe2013
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study} \tab \code{character} \tab study author(s) and year \cr
\bold{n}     \tab \code{integer}   \tab sample size \cr
\bold{tval}  \tab \code{numeric}   \tab t-statistic for the test of the association/predictor \cr
\bold{preds} \tab \code{integer}   \tab number of predictors included in the regression model \cr
\bold{R2}    \tab \code{numeric}   \tab the coefficient of determination (i.e., R-squared value) of the regression model \cr
}  
}
\details{
   The dataset is based on studies that used regression models to examine the association between some measure of perceived supervision quality (e.g., the quality of the relationship with one's supervisor) and some work-related outcome (e.g., job satisfaction) in social, mental health, and child welfare workers. The dataset was extracted from Aloe and Thompson (2013), which in turn is a subset of the studies included in the meta-analysis by Mor Barak et al. (2009).

   The dataset can be used to illustrate the meta-analysis of regression models, using measures such as the (semi-)partial correlation coefficient. For this, the t-statistic from the regression model for the association (i.e., predictor) of interest was extracted from each regression model (\code{tval}), as well as the sample size (\code{n}), the number of predictors included in the regression model (\code{preds}), and the coefficient of determination (i.e., R-squared value) of the regression model (\code{R2}). Based on this information, the (semi-)partial correlation coefficient can be computed for each study, as well as its corresponding sampling variance. These values can then be meta-analyzed using standard methods.
}
\source{
   Aloe, A. M., & Thompson, C. G. (2013). The synthesis of partial effect sizes. \emph{Journal of the Society for Social Work and Research}, \bold{4}(4), 390--405. \verb{https://doi.org/10.5243/jsswr.2013.24}
}
\references{
   Mor Barak, M. E., Travis, D. J., Pyun, H., & Xie, B. (2009). The impact of supervision on worker outcomes: A meta-analysis. \emph{Social Service Review}, \bold{83}(1), 3--32. \verb{https://doi.org/10.1086/599028}
}
\author{
   Wolfgang Viechtbauer, \email{wvb@metafor-project.org}, \url{https://www.metafor-project.org}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.aloe2013
dat

\dontrun{
### load metafor package
suppressPackageStartupMessages(library(metafor))

### compute the partial correlation coefficients and corresponding sampling variances
dat <- escalc(measure="PCOR", ti=tval, ni=n, mi=preds, data=dat)
dat

### random-effects model
res <- rma(yi, vi, data=dat)
res

### mixed-effects meta-regression model examining the relationship between the partial
### correlation coefficients and the number of predictors included in the models
res <- rma(yi, vi, mods = ~ preds, data=dat)
res

### compute the r-to-z transformed partial correlation coefficients and their variances
dat <- escalc(measure="ZPCOR", ti=tval, ni=n, mi=preds, data=dat)
dat

### random-effects model
res <- rma(yi, vi, data=dat)
res

### back-transformation to the partial correlation scale
predict(res, transf=transf.ztor)

### compute the semi-partial correlation coefficients and their variances
dat <- escalc(measure="SPCOR", ti=tval, ni=n, mi=preds, r2i=R2, data=dat)
dat

### random-effects model
res <- rma(yi, vi, data=dat)
res
}
}
\keyword{datasets}
\concept{social work}
\concept{(semi-)partial correlations}
\concept{meta-regression}
\section{Concepts}{
   social work, (semi-)partial correlations, meta-regression
}
