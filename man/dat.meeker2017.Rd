\name{dat.meeker2017}
\docType{data}
\alias{dat.meeker2017}
\title{Baseball Batting Averages}
\description{Batting averages in 2014 for 10 baseball teams.}
\usage{
dat.meeker2017
}
\format{The data frame contains the following columns:
\tabular{lll}{
\bold{team}     \tab \code{character} \tab baseball team \cr
\bold{division} \tab \code{factor}    \tab division \cr
\bold{mean}     \tab \code{numeric}   \tab batting average (team sample mean) \cr
\bold{se}       \tab \code{numeric}   \tab team standard error \cr
\bold{batters}  \tab \code{integer}   \tab number of batters
}
}
\details{
   Meeker, Hahn, and Escobar (2017) considered an example application concerning batting averages from 10 baseball teams during 2014. The data (from chapter 17) consist of sample means (batting averages) and corresponding standard errors for each team's batters who had at least 300 \emph{at-bats}. Baseball teams are associated with one of two divisions, namely \emph{American League Central (AL-C)} or \emph{National League Central (NL-C)}.
}
\source{
   Meeker, W. Q. , Hahn, G. J., & Escobar, L. A. (2017).  \emph{Statistical intervals: A guide for practitioners and researchers} (2nd ed.). Hoboken, NJ: John Wiley and Sons.
}
\author{
   Christian \enc{Röver}{Roever}, \email{christian.roever@med.uni-goettingen.d}
}
\examples{
dat.meeker2017

\dontrun{
library(metafor)
library(bayesmeta)

# convert data to an "escalc" object
es <- escalc(measure="GEN",
             yi=mean, sei=se, slab=team, ni=batters,
             data=dat.meeker2017)

# illustrate the plain data
forestplot(es, zero=NA, title="baseball batting averages (dat.meeker2017)")

# specify regressor matrix,
# distinguishing between AL-C and NL-C divisions
Xmat <- cbind("intercept" = 1,
              "offset"    = rep(c(0.5, -0.5), each=5))
rownames(Xmat) <- rownames(dat.meeker2017)
Xmat

# reproduce analysis from Sec.17.2
# (using improper uniform priors for all 3 parameters)
mreg <- bmr(es, X=Xmat)
mreg

# generate a plot similar to Fig.17.2
forestplot(mreg,
           X.mean=rbind("AL-C" = c(1, 0.5),
                        "NL-C" = c(1, -0.5),
                        "mu"   = c(1, 0)),
           xlab="batting average", zero=NA)

# show more summary stats for some estimates
summary(mreg,
        X.mean=rbind("AL-C"              = c(1, 0.5),
                     "NL-C"              = c(1, -0.5),
                     "mean (mu)"         = c(1, 0),
                     "difference (beta)" = c(0, 1)))

# show shrinkage estimates
t(mreg$theta)

# show trace plot
traceplot(mreg,
          X=rbind("AL-C" = c(1, 0.5),
                  "NL-C" = c(1, -0.5)),
          infinity=TRUE, ylab="batting average")
}
}
\keyword{datasets}
\concept{sports}
\concept{raw means}
\section{Concepts}{
   sports, raw means
}
