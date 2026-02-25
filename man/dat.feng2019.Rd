\name{dat.feng2019}
\docType{data}
\alias{dat.feng2019}
\title{Studies on the Prevalence of Depression After Myocardial Infarction}
\description{Results from 19 studies assessing the prevalence of depression after myocardial infarction}
\usage{
dat.feng2019
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{author}        \tab \code{character} \tab first author \cr
\bold{year}          \tab \code{integer}   \tab publication year \cr
\bold{region}        \tab \code{character} \tab country \cr
\bold{design}        \tab \code{character} \tab study design \cr
\bold{source}        \tab \code{character} \tab sample source \cr
\bold{age}           \tab \code{numeric}   \tab mean age \cr
\bold{males}         \tab \code{numeric}   \tab percentage of males \cr
\bold{first}         \tab \code{numeric}   \tab percentage of first-time MI \cr
\bold{questionnaire} \tab \code{character} \tab self-report questionnaire \cr
\bold{interview}     \tab \code{character} \tab structured interview \cr
\bold{timing}        \tab \code{character} \tab timing of depression assessment \cr
\bold{depr}          \tab \code{integer}   \tab subjects with depression \cr
\bold{n}             \tab \code{integer}   \tab sample size
}
}
\details{
   This data set comes from a meta-analysis with 19 studies to estimate the prevalence of depression after a myocardial infarction. The variables \code{depr} and \code{n} contain the number of depressive patients and the total number of patients.
}
\source{
   Feng, L., Li, L., Liu, W., Yang, J., Wang, Q., Shi, L., & Luo, M. (2019). Prevalence of depression in myocardial infarction: A PRISMA-compliant meta-analysis. \emph{Medicine}, \bold{98}(8), e14596. \verb{https://doi.org/10.1097/md.0000000000014596}
}
\author{
   Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show results of first six studies
head(dat.feng2019)

\dontrun{
### Load meta package
suppressPackageStartupMessages(library(meta))

### Conduct random effects meta-analysis
mp1 <- metaprop(depr, n, data = dat.feng2019,
  studlab = paste(author, year),
  common = FALSE, prediction = TRUE)

### Create forest plot
forest(mp1, digits = 3, xlim = c(0, 1),
  print.pval.Q = FALSE, details = TRUE)
}
}
\keyword{datasets}
\concept{psychology}
\concept{cardiology}
\concept{prevalence}
\section{Concepts}{
   psychology, cardiology, prevalence
}
