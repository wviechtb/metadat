\name{dat.bauer2002}
\docType{data}
\alias{dat.bauer2002}
\title{Studies on OM-89 (Uro-Vaxom) in Urinary Tract Infections}
\description{Estimated Wilcoxon-Mann-Whitney (WMW) effect sizes from five studies on OM-89 (Uro-Vaxom) in patients with recurrent urinary tract infections.}
\usage{
dat.bauer2002
}
\format{The data frame contains the following columns:
\tabular{lll}{
\bold{study}     \tab \code{character} \tab study identifier \cr
\bold{year}      \tab \code{numeric}   \tab publication year \cr
\bold{threshold} \tab \code{numeric}   \tab threshold (for bacteriuria / UTI definition) \cr
\bold{n.treat}   \tab \code{numeric}   \tab number of patients in treatment group \cr
\bold{n.control} \tab \code{numeric}   \tab number of patients in control group \cr
\bold{n.total}   \tab \code{numeric}   \tab total number of patients \cr
\bold{wmwstat}   \tab \code{numeric}   \tab Wilcoxon-Mann-Whitney statistic \cr
\bold{lower}     \tab \code{numeric}   \tab lower CI bound for the WMW-statistic \cr
\bold{upper}     \tab \code{numeric}   \tab upper CI bound for the WMW-statistic \cr
\bold{stderr}    \tab \code{numeric}   \tab standard error for the WMW-statistic
}
}
\details{
   Bauer et al. (2002) analyzed data from five randomized, placebo-controlled studies investigating the use of OM-89 (Uro-Vaxom) in recurrent urinary tract infections (UTI). Treatment effects were quantified in terms of the \emph{Wilcoxon-Mann-Whitney statistic} computed based on the numbers of recurrences experienced by included patients from each study.

   The WMW-statistic gives an estimate of the probability that a randomly selected patient from the treatment group is superior to a randomly selected control patient, also denoted as the \emph{common language effect size} (CLES). \dQuote{Superiority} in this case relates to fewer UTI recurrences experienced. A WMW-statistic \eqn{>0.5} then suggests a beneficial treatment effect.
}
\source{
   Bauer, H. W., Rahlfs, V. W., Lauener, P. A., & \enc{Bleßmann}{Blessmann}, G. S. S. (2002). Prevention of recurrent urinary tract infections with immuno-active E. coli fractions: A meta-analysis of five placebo-controlled double-blind studies. \emph{International Journal of Antimicrobial Agents}, \bold{19}(6), 451--456. \verb{https://doi.org/10.1016/s0924-8579(02)00106-1}
}
\seealso{
   \code{\link{dat.huber2000}}
}
\author{
   Christian \enc{Röver}{Roever}, \email{christian.roever@med.uni-goettingen.de}
}
\examples{
dat.bauer2002

\dontrun{
library(metafor)
library(bayesmeta)

# analyze based on plain probabilities as effect sizes
wmw.prob <- escalc(measure="CLES",
                   yi = wmwstat, sei = stderr,
                   ni = n.total, slab = study,
                   data = dat.bauer2002)

# perform a random-effects meta-analysis
ma01 <- rma.uni(wmw.prob, method="PM", test="adhoc")

# show forest plot
forest(ma01, addpred=TRUE, predstyle="bar",
       refline=0.5, main="dat.bauer2002 (probabilities)")


# analyze based on log-odds (logits) as effect sizes
wmw.logit <- escalc(measure="PLO",
                    yi   = log(wmwstat / (1-wmwstat)),
                    sei  = stderr / (wmwstat*(1-wmwstat)),
                    ni   = n.total, slab = study,
                    data = dat.bauer2002)

# perform a random-effects meta-analysis
ma02 <- rma.uni(wmw.logit, method="PM", test="adhoc")

# show forest plot (back-transformed to probabilities)
forest(ma02, addpred=TRUE, predstyle="bar",
       transf=transf.ilogit,
       header=c("study", "CLES [95 percent CI]"),
       xlab="common language effect size",
       refline=0.5, main="dat.bauer2002 (log-odds)")

# show forest plot (in terms of log-odds)
forest(ma02, addpred=TRUE, predstyle="bar",
       header=c("study", "logit(CLES) [95 percent CI]"),
       xlab="logit(common language effect size)",
       refline=0.0, main="dat.bauer2002 (log-odds)")

# perform Bayesian meta-analsis
# (using a half-normal prior for the (logit-WMW) effect heterogeneity
#  and a Normal(0.0, 1.814) prior for the overall mean logit;
#  the overall mean prior (with variance (pi/sqrt(3))^2)
#  roughly corresponds to a uniform prior in probability)
ma03 <- bayesmeta(wmw.logit,
                  tau.prior = function(t){dhalfnormal(t,scale=0.5)},
                  mu.prior = c(0.0, 1.814))
forestplot(ma03, title = "dat.bauer2002 (log-odds)",
           xlab = "logit(CLES)",
           txt_gp = fpTxtGp(ticks = gpar(cex=1), xlab = gpar(cex=1)))
}
}
\keyword{datasets}
\concept{medicine}
\concept{common language effect sizes}
\concept{proportions}
\section{Concepts}{
   medicine, common-language effect sizes, proportions
}
