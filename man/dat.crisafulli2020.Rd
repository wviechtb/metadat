\name{dat.crisafulli2020}
\docType{data}
\alias{dat.crisafulli2020}
\title{Duchenne Muscular Dystrophy (DMD) Prevalence Data}
\description{26 studies reporting estimates of the birth prevalence of Duchenne muscular dystrophy.}
\usage{
dat.crisafulli2020
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study}           \tab \code{character} \tab study label (first author, year) \cr
\bold{pubyear}         \tab \code{integer}   \tab publication year \cr
\bold{country}         \tab \code{factor}    \tab origin of investigated population \cr
\bold{from}, \bold{to} \tab \code{integer}   \tab time span of investigation (years) \cr
\bold{cases}           \tab \code{integer}   \tab number of DMD cases \cr
\bold{total}           \tab \code{integer}   \tab corresponding total population \cr
}
}
\details{
   \emph{Duchenne muscular dystrophy} (DMD) is a rare disease that is caused by a genetic mutation and is characterized by impairment through muscle weakness and a reduced life expectancy.

   Crisafulli et al. (2020) reported on a systematic review of data on the epidemiology of DMD, including estimates of the \emph{birth prevalence} (which is of the order of a few per ten thousand). One of the originally reported studies (Koenig, 2019) is omitted here, as it constitutes an obvious outlier, and the reliability of the reported data is doubtful; Crisafulli et al. (2020) pointed out that \dQuote{\emph{Concerning birth prevalence, Koenig et al. were found to be outliers. This study had problems with data collection in the last study year, as due to privacy issues, DMD cases were under-reported.}}
}
\source{
   Crisafulli, S., Sultana, J., Fontana, A., Salvo, F., Messina, S., & Trifiro, G. (2020). Global epidemiology of Duchenne muscular dystrophy: an updated systematic review and meta-analysis. \emph{Orphanet Journal of Rare Diseases}, \bold{15}, 141. \verb{https://doi.org/10.1186/s13023-020-01430-8}
}
\author{
   Christian Roever, \email{christian.roever@med.uni-goettingen.de}
}
\examples{
# show (some) data
head(dat.crisafulli2020)

\dontrun{
# compute logarithmic proportions and associated standard errors
library(metafor)
logp <- escalc(measure="PLN",
               xi=cases, ni=total, slab=study,
               data=dat.crisafulli2020)

# perform meta-analysis
rma01 <- rma.uni(logp)

# show results
rma01

# illustrate in a forest plot
forest(rma01, xlim=c(-12,-5))
}
}
\keyword{datasets}
\concept{medicine}
\concept{epidemiology}
\concept{proportions}
\concept{dose-response models}
\section{Concepts}{
   medicine, epidemiology, proportions, dose-response models
}
