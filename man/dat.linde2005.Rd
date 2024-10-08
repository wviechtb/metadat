\name{dat.linde2005}
\docType{data}
\alias{dat.linde2005}
\title{Studies on the Effectiveness of St. John's Wort for Treating Depression}
\description{Results from 26 studies on the effectiveness of Hypericum perforatum extracts (St. John's wort) for treating depression.}
\usage{
dat.linde2005
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{id}       \tab \code{numeric}   \tab study number \cr
\bold{study}    \tab \code{character} \tab study author(s) \cr
\bold{year}     \tab \code{numeric}   \tab publication year \cr
\bold{country}  \tab \code{character} \tab study location \cr
\bold{ni}       \tab \code{numeric}   \tab total sample size \cr
\bold{major}    \tab \code{numeric}   \tab sample restricted to patients who met criteria for major depression \cr
\bold{baseline} \tab \code{numeric}   \tab HRSD baseline score \cr
\bold{version}  \tab \code{numeric}   \tab HRSD version (17 or 21 items) \cr
\bold{duration} \tab \code{numeric}   \tab study duration (in weeks) \cr
\bold{prep}     \tab \code{character} \tab Hypericum extract preparation \cr
\bold{dosage}   \tab \code{numeric}   \tab dosage (in mg) \cr
\bold{response} \tab \code{numeric}   \tab definition of response (see \sQuote{Details}) \cr
\bold{ai}       \tab \code{numeric}   \tab number of responses in treatment group \cr
\bold{n1i}      \tab \code{numeric}   \tab number of patients in treatment group \cr
\bold{ci}       \tab \code{numeric}   \tab number of responses in placebo group \cr
\bold{n2i}      \tab \code{numeric}   \tab number of patients in placebo group \cr
\bold{group}    \tab \code{numeric}   \tab stratification variable used by the authors (see \sQuote{Details})
}
}
\details{
   The dataset includes the results from 26 double-blind placebo-controlled trials on the effectiveness of Hypericum perforatum extracts (St. John's wort) for treating depression (note that 2 studies did not provide sufficient response information).

   Data were extracted from Table 1 and Figure 3 from Linde et al. (2005). For study duration, the assessment week (instead of the total study duration) was coded for Philipp et al. (1999) and Montgomery et al. (2000). For dosage, the midpoint was coded when a range of values was given.

   The definition of what constitutes a \code{response} differed across studies and is coded as follows:
   \enumerate{
   \item HRSD score reduction of at least 50\% or HRSD score after therapy <10,
   \item HRSD reduction of at least 50\%,
   \item based on HRSD scale but exact definition not reported,
   \item global patient assessment of efficacy,
   \item at least \sQuote{much improved} on the Clinical Global Impression sub-scale for global improvement.
   }

   The \code{group} variable corresponds to the variable used by Linde et al. (2005) to stratify their analyses and is coded as follows:
   \enumerate{
   \item smaller trials restricted to major depression,
   \item larger trials restricted to major depression,
   \item smaller trials not restricted to major depression,
   \item larger trials not restricted to major depression.
   }
}
\source{
   Linde, K., Berner, M., Egger, M., & Mulrow, C. (2005). St John's wort for depression: Meta-analysis of randomised controlled trials. \emph{British Journal of Psychiatry}, \bold{186}(2), 99--107. \verb{https://doi.org/10.1192/bjp.186.2.99}
}
\references{
   Viechtbauer, W. (2007). Accounting for heterogeneity via random-effects models and moderator analyses in meta-analysis. \emph{Zeitschrift \enc{für}{fuer} Psychologie / Journal of Psychology}, \bold{215}(2), 104--121. \verb{https://doi.org/10.1027/0044-3409.215.2.104}
}
\author{
   Wolfgang Viechtbauer, \email{wvb@metafor-project.org}, \url{https://www.metafor-project.org}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.linde2005
head(dat)

\dontrun{
### load metafor package
library(metafor)

### remove studies with no response information and study with no responses in either group
dat <- dat[-c(5,6,26),]

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=ai, ci=ci, n1i=n1i, n2i=n2i, data=dat)
head(dat)

### meta-analysis of the log risk ratios using a random-effects model
res <- rma(yi, vi, data=dat, method="DL")
res

### mixed-effects meta-regression model with stratification variable
res <- rma(yi, vi, mods = ~ 0 + factor(group), data=dat, method="DL")
res

### predicted average risk ratio for each level of the stratification variable
predict(res, newmods=diag(4), transf=exp, digits=2)
}
}
\keyword{datasets}
\concept{medicine}
\concept{psychiatry}
\concept{risk ratios}
\section{Concepts}{
   medicine, psychiatry, risk ratios
}
