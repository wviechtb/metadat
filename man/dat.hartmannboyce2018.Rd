\name{dat.hartmannboyce2018}
\docType{data}
\alias{dat.hartmannboyce2018}
\title{Studies on the Effectiveness of Nicotine Replacement Therapy for Smoking Cessation}
\description{Results from 133 studies examining the effectiveness of nicotine replacement therapy (NRT) for smoking cessation at 6+ months of follow-up.}
\usage{
dat.hartmannboyce2018
}
\format{The data frame contains the following columns:
\tabular{lll}{
\bold{study}     \tab \code{numeric}   \tab study identifier \cr
\bold{x.nrt}     \tab \code{numeric}   \tab number of participants in the NRT group who were abstinent at the follow-up \cr
\bold{n.nrt}     \tab \code{numeric}   \tab number of participants in the NRT group \cr
\bold{x.ctrl}    \tab \code{numeric}   \tab number of participants in the control group who were abstinent at the follow-up \cr
\bold{n.ctrl}    \tab \code{numeric}   \tab number of participants in the control group \cr
\bold{treatment} \tab \code{character} \tab type of NRT provided in the treatment group
}
}
\details{
   The dataset includes the results from 133 studies examining the effectiveness of nicotine replacement therapy (NRT) for smoking cessation. The results given in this dataset pertain to abstinence at 6+ months of follow-up. NRT was provided to participants in the treatment groups in various forms as indicated by the \code{treatment} variable (e.g., gum, patch, inhalator). Note that the dataset includes 136 rows, since a few studies included multiple treatments.
}
\source{
   Hartmann‐Boyce, J., Chepkin, S. C., Ye, W., Bullen, C. & Lancaster, T. (2018). Nicotine replacement therapy versus control for smoking cessation. \emph{Cochrane Database of Systematic Reviews}, \bold{5}, CD000146. \verb{https://doi.org//10.1002/14651858.CD000146.pub5}
}
\author{
   Wolfgang Viechtbauer, \email{wvb@metafor-project.org}, \url{https://www.metafor-project.org}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.hartmannboyce2018
head(dat, 10)

\dontrun{

### load metafor package
library(metafor)

### turn treatment into a factor with the desired ordering
dat$treatment <- factor(dat$treatment, levels=unique(dat$treatment))

### meta-analysis per treatment using the M-H method
lapply(split(dat, dat$treatment), function(x)
       rma.mh(measure="RR", ai=x.nrt,  n1i=n.nrt,
                            ci=x.ctrl, n2i=n.ctrl, data=x, digits=2))

### all combined
rma.mh(measure="RR", ai=x.nrt,  n1i=n.nrt,
                     ci=x.ctrl, n2i=n.ctrl, data=dat, digits=2)

}
}
\keyword{datasets}
\concept{medicine}
\concept{smoking}
\concept{risk ratios}
\concept{Mantel-Haenszel method}
\section{Concepts}{
   medicine, smoking, risk ratios, Mantel-Haenszel method
}
