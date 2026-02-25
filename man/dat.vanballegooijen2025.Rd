\name{dat.vanballegooijen2025}
\docType{data}
\alias{dat.vanballegooijen2025}
\title{Psychological treatments for suicidal ideation}
\description{Results of twelve trials reporting suicidal ideation outcomes 
of psychological treatment compared to inactive controls.}
\usage{
dat.vanballegooijen2025
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study} \tab \code{character} \tab First author of the study and year. \cr
\bold{m1i} \tab \code{numeric} \tab Mean suicidal ideation score in the treatment group. \cr
\bold{sd1i} \tab \code{numeric} \tab Standard deviation in the treatment group. \cr
\bold{m2i} \tab \code{numeric} \tab Mean suicidal ideation score in the control group. \cr
\bold{sd2i} \tab \code{numeric} \tab Standard deviation in the control group. \cr
\bold{n1i} \tab \code{integer} \tab Sample size of the treatment group. \cr
\bold{n2i} \tab \code{integer} \tab Sample size of the control group. \cr
\bold{week} \tab \code{integer} \tab Assessment time in weeks after randomization. \cr
\bold{control} \tab \code{character} \tab Type of control group. \cr
\bold{agegroup} \tab \code{character} \tab Age group of the sample. \cr
}  
}
\details{
The dataset includes results from 12 randomized trials examining the effect of psychological
treatment on suicidal ideation compared to inactive control groups. 

This dataset was extracted from the \emph{Metapsy} living evidence database 
on psychological treatment for suicidality (\code{suicide-psyctr}). 
Further information on this database can be found on its 
\href{https://docs.metapsy.org/databases/suicide-psyctr/}{documentation page}.
A comprehensive meta-analytic synthesis of this database was published 
by van Ballegooijen et al. (2025). An update of the living database with all trials 
published up to April 1st, 2024 was used to compile the present dataset.
Only a small subset of the overall database was included, focusing on direct
prevention trials in inpatient populations in which post-test means and standard deviations
were reported for both groups, and selecting only one outcome measure per study.

The dataset can be used to illustrate meta-analyses of standardized mean differences
or ratios of means.
}
\source{
van Ballegooijen, W., Rawee, J., Palantza, C., Miguel, C., Harrer, M., 
Cristea, I., ... & Cuijpers, P. (2025). Suicidal ideation and suicide 
attempts after direct or indirect psychotherapy: a systematic review and 
meta-analysis. \emph{JAMA Psychiatry}, \bold{82}(1).
}
\author{Mathias Harrer, \email{m.harrer@vu.nl}; Wouter van Ballegooijen, \email{w.vanballegooijen@amsterdamumc.nl}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.vanballegooijen2025
dat

\dontrun{
library(metafor)

# Calculate standardized mean differences
dat.smd <- escalc(m1i=m1i, sd1i=sd1i, n1i=n1i, 
                  m2i=m2i, sd2i=sd2i, n2i=n2i,
                  data=dat, measure = "SMD")

# Calculate log-mean ratio
dat.rom <- escalc(m1i=m1i, sd1i=sd1i, n1i=n1i, 
                  m2i=m2i, sd2i=sd2i, n2i=n2i,
                  data=dat, measure = "ROM")

# Calculate pooled outcomes
rma(yi, vi, data=dat.smd)
rma(yi, vi, data=dat.rom) |> predict(transf=exp)
}
}
\keyword{datasets}
\concept{psychiatry}
\concept{psychology}
\concept{standardized mean differences}
\section{Concepts}{
   psychiatry, psychology, standardized mean differences
}
