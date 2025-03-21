\name{dat.bartos2023}
\docType{data}
\alias{dat.bartos2023}
\title{Results of 350,757 Coin Flips to Examine Same-Side Bias}
\description{Results from 350,757 coin flips by 48 people to examine the presence of same-side bias.}
\usage{
dat.bartos2023
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{person} \tab \code{character} \tab person identifier \cr
\bold{hsame}  \tab \code{numeric}   \tab number of flips where the coin landed on heads and on the same side as where it started \cr
\bold{hdiff}  \tab \code{numeric}   \tab number of flips where the coin landed on heads and on the different side as where it started \cr
\bold{tsame}  \tab \code{numeric}   \tab number of flips where the coin landed on tails and on the same side as where it started \cr
\bold{tdiff}  \tab \code{numeric}   \tab number of flips where the coin landed on tails and on the different side as where it started \cr
\bold{same}   \tab \code{numeric}   \tab number of flips where the coin landed on the same side as where it started \cr
\bold{flips}  \tab \code{numeric}   \tab total number of flips
}
}
\details{
   In a landmark study by \enc{Bartoš}{Bartos} et al. (2023), 48 people flipped a coin (of various currencies and/or denominations) a total of 350,757 times, recording on each flip whether it landed on heads or tails and whether the coin landed on the same side as where it started or on the different side. The goal of this experiment was to examine the model by Diaconis, Holmes, and Montgomery (2007), according to which flipped coins have a slightly higher than 50\% chance (of around 51\% according to the D-H-M model) of landing on the same side as where they started.
}
\source{
   \enc{Bartoš}{Bartos}, F., Sarafoglou, A., Godmann, H. R., Sahrani, A., Leunk, D. K., Gui, P. Y., Voss, D., Ullah, K., Zoubek, M. J., Nippold, F., Aust, F., Vieira, F. F., Islam, C.-G., Zoubek, A. J., Shabani, S., Petter, J., Roos, I. B., Finnemann, A., Lob, A. B., Hoffstadt, M. F., Nak, J., de Ron, J., Derks, K., Huth, K., Terpstra, S., Bastelica, T., Matetovici, M., Ott, V. L., Zetea, A. S., Karnbach, K., Donzallaz, M. C., John, A., Moore, R. M., Assion, F., van Bork, R., Leidinger, T. E., Zhao, X., Motaghi, A. K., Pan, T., Armstrong, H., Peng, T., Bialas, M., Pang, J. Y.-C., Fu, B., Yang, S., Lin, X., Sleiffer, D., Bognar, M., Aczel, B., & Wagenmakers, E.-J. (2023). Fair coins tend to land on the same side they started: Evidence from 350,757 flips. \emph{arXiv}, 2310.04153, v2. \verb{https://arxiv.org/abs/2310.04153}
}
\references{
   Diaconis, P., Holmes, S., & Montgomery, R. (2007). Dynamical bias in the coin toss. \emph{SIAM Review}, \bold{49}(2), 211--235. \verb{https://doi.org/10.1137/s0036144504446436}
}
\author{
   Wolfgang Viechtbauer, \email{wvb@metafor-project.org}, \url{https://www.metafor-project.org}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.bartos2023
dat

\dontrun{
### load metafor package
library(metafor)

### compute proportions and the corresponding sampling variances
dat <- escalc(measure="PR", xi=same, ni=flips, data=dat, slab=person)
dat

### compute confidence intervals for the individual proportions (as in Table 1)
summary(dat, digits=3)[c(1,6:8,13,14)]

### compute a confidence interval based on the column totals
summary(escalc(measure="PR", xi=sum(dat$same), ni=sum(dat$flips)), digits=3)

### this is the same as meta-analyzing the proportions directly using an equal-effects
### model and also computing the sampling variances under the assumption that the true
### proportions are homogeneous
rma(measure="PR", xi=same, ni=flips, vtype="AV", method="EE", data=dat, digits=3)

### fit a random-effects model
res <- rma(yi, vi, data=dat)
res

### profile likelihood confidence interval for tau^2
confint(res, type="PL")

### forest plot
forest(res, refline=0.5, xlim=c(0.38,0.72), digits=c(3,2), efac=c(0,1))

### funnel plot
funnel(res, xlim=c(0.45,0.6), ylim=c(0,0.02))

### fit a random-effects model excluding those with same-side proportions larger than 0.53
res <- rma(yi, vi, data=dat, subset=yi<=0.53)
res
confint(res, type="PL")

### fit a binomial-normal model
res <- rma.glmm(measure="PLO", xi=same, ni=flips, data=dat)
res
predict(res, transf=plogis)

### conduct a meta-analysis for the proportions of heads (to examine heads-tails bias)
dat <- escalc(measure="PR", xi=hdiff+hsame, ni=flips, data=dat)
res <- rma(yi, vi, data=dat)
res
confint(res, type="PL")

### restructure the dataset for a bivariate meta-analysis of same-side and heads proportions
dat <- dat.bartos2023
dat <- dat[rep(1:nrow(dat), each=2),]
rownames(dat) <- NULL
dat$outcome <- c("heads", "same")
dat <- escalc(measure="PR", xi=hsame+hdiff, ni=flips, data=dat, include=outcome=="heads")
dat <- escalc(measure="PR", xi=hsame+tsame, ni=flips, data=dat, include=outcome=="same")
dat

### construct the 2x2 variance-covariance matrix of the proportions within persons
dat$cov <- with(dat, (hsame/flips * (1-hsame/flips) - hsame/flips * tsame/flips -
                      hsame/flips * hdiff/flips - hdiff/flips * tsame/flips) / flips)
V <- lapply(split(dat, dat$person), \(x) matrix(c(x$vi[1], x$cov, x$vi[2]), nrow=2))

### fit bivariate meta-analysis model
res <- rma.mv(yi, V, mods = ~ 0 + outcome, random = ~ outcome | person, struct="UN", data=dat)
res

### create plot with confidence ellipses ('ellipse' package must be installed)
library(ellipse)
plot(NA, xlim=c(0.45,0.62), ylim=c(0.45,0.62), bty="l", xlab="Pr(heads)", ylab="Pr(same)")
abline(h=0.5, lty="dotted")
abline(v=0.5, lty="dotted")
# add confidence ellipses for persons
invisible(tapply(dat, dat$person, \(x) {
   xy <- ellipse(matrix(c(x$vi[1],x$cov,x$vi[2]), nrow=2), centre=x$yi, level=0.95)
   lines(xy[,1],xy[,2], col="gray80")
}))
# add the points
invisible(tapply(dat, dat$person, \(x) points(x$yi[1], x$yi[2], pch=21, bg="gray80", cex=1.5)))
# add the 95\% PI ellipsis based on the model
xy <- ellipse(res$G, centre=coef(res), level=0.95)
lines(xy[,1],xy[,2], col="gray30", lwd=3, lty="dotted")
# add the 95\% CI ellipsis based on the model
xy <- ellipse(vcov(res), centre=coef(res), level=0.95)
lines(xy[,1],xy[,2], col="gray30", lwd=3)
# add the point for the pooled effects
points(coef(res)[1], coef(res)[2], pch=21, bg="gray40", cex=2)
}
}
\keyword{datasets}
\concept{physics}
\concept{human factors}
\concept{proportions}
\concept{multivariate models}
\section{Concepts}{
   physics, human factors, proportions, multivariate models
}
