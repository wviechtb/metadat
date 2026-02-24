\name{dat.huber2000}
\docType{data}
\alias{dat.huber2000}
\title{Individual Participant Data (IPD) from Five Studies on Uro-Vaxom in Urinary Tract Infections}
\description{Individual participant data (IPD) of 601 patients from 5 studies comparing Uro-Vaxom versus placebo in recurrent urinary tract infections (UTI) based on the numbers of recurrences experienced.}
\usage{
dat.huber2000
}
\format{The data frame contains the following columns (one row per patient):
\tabular{lll}{
\bold{study}       \tab \code{factor}  \tab study identifier \cr
\bold{treatment}   \tab \code{factor}  \tab treatment (Uro-Vaxom or Placebo) \cr
\bold{recurrences} \tab \code{numeric} \tab number of recurrences (relapses)
}
}
\details{
   Huber et al. (2000) jointly analyzed data from five randomized, placebo-controlled studies investigating the use of \emph{OM-89} (Uro-Vaxom) in recurrent urinary tract infections (UTI). Treatment efficacy was evaluated based on the numbers of recurrences experienced by study participants.

   The eventual analysis was carried out based on nonparametric Wilcoxon-Mann-Whitney (WMW) tests applied for each study individually and then synthesizing the five resulting test statistic values. The WMW test statistics may be expressed in terms of \emph{common language effect sizes} (CLES), that is, the estimated probability that a patient in the treatment group has a better outcome than a control patient.
}
\source{
   Bauer, H. W., Rahlfs, V. W., Lauener, P. A., & \enc{Bleßmann}{Blessmann}, G. S. S. (2002). Prevention of recurrent urinary tract infections with immuno-active E. coli fractions: A meta-analysis of five placebo-controlled double-blind studies. \emph{International Journal of Antimicrobial Agents}, \bold{19}(6), 451--456. \verb{https://doi.org/10.1016/s0924-8579(02)00106-1}
}
\seealso{
   \code{\link{dat.bauer2002}}
}
\author{
   Christian \enc{Röver}{Roever}, \email{christian.roever@med.uni-goettingen.de}
}
\examples{
# show data
head(dat.huber2000)
str(dat.huber2000)
summary(dat.huber2000)
table(dat.huber2000[,1:2])
table(dat.huber2000[,c(2,3,1)])

# compute WMW statistics for all 5 studies
wmw <- tapply(dat.huber2000, dat.huber2000$study,
              function(x){wilcox.test(x$recurrences[x$treatment=="Placebo"],
                                      x$recurrences[x$treatment=="Uro-Vaxom"])$statistic},
              simplify=TRUE)
wmw

# determine treatment group sizes
patients <- table(dat.huber2000[,1:2])
patients

# convert WMW statistics into estimated probability of superiority
# ("common language effect size")
prob <- wmw / (patients[,1]*patients[,2])
round(prob, 3)
}
\keyword{datasets}
\concept{medicine}
\concept{proportions}
\concept{individual participant data}
\section{Concepts}{
   medicine, proportions, individual participant data)
}
