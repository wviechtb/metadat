\name{dat.hannum2020}
\docType{data}
\alias{dat.hannum2020}
\title{Studies Comparing Objective and Subjective Olfactory Loss in COVID-19 Patients}
\description{Results from 35 studies measuring olfactory loss in COVID-19 patients using either objective or subjective measures.}
\usage{dat.hannum2020}
\format{The data frame contains the following columns:
\tabular{lll}{
\bold{authorName}           \tab \code{character} \tab (first) author of study \cr
\bold{DOI}                  \tab \code{character} \tab article DOI number \cr
\bold{ni}                   \tab \code{numeric}   \tab number of Covid-19 positive patients in the study \cr
\bold{xi}                   \tab \code{numeric}   \tab number of Covid-19 positive patients in the study with olfactory loss \cr
\bold{percentOlfactoryLoss} \tab \code{numeric}   \tab percent of the sample with olfactory loss \cr
\bold{objectivity}          \tab \code{character} \tab objective or subjective measure used \cr
\bold{measured}             \tab \code{character} \tab outcome measure \cr
\bold{testType}             \tab \code{character} \tab type of test used \cr
\bold{country}              \tab \code{character} \tab country where patients were treated \cr
\bold{patientType}          \tab \code{character} \tab type of patient information and location where being treated
}
}
\details{
   One of the symptoms of COVID-19 infection is olfactory loss (loss of smell) either recently acquired anosmia (complete loss of smell) or hyposmia (partial loss of smell). One challenge to reaching this symptom is the wide range of reported prevalence for this symptom ranging from 5 percent to 98 percent. In this dataset studies were grouped into one of two groups based on the type of method used to measure smell loss (either subjective measures, such as self-reported smell loss, or objective measures using rated stimuli).
}
\source{
   Ramirez VA , Hannum ME, Lipson SJ, Herriman RD, Toskala AK, Lin C, Joseph PV, Reed DR. 2020. COVID-19 Smell Loss Prevalence Tracker. Available from: \verb{https://vicente-ramirez.shinyapps.io/COVID19_Olfactory_Dashboard/} and \verb{https://github.com/vramirez4/OlfactoryLoss} (accessed August 11, 2021)
}
\references{
   Hannum, M. E., Ramirez, V. A., Lipson, S. J., Herriman, R. D., Toskala, A. K., Lin, C., Joseph, P. V., & Reed, D. R. (2020). Objective sensory testing methods reveal a higher prevalence of olfactory loss in COVID-19 positive patients compared to subjective methods: A systematic review and meta-analysis. \emph{Chemical Senses}, \bold{45}(9), 865--874. \verb{https://doi.org/10.1093/chemse/bjaa064}
}
\author{
   W. Kyle Hamilton \email{whamilton@ucmerced.edu} \url{https://kylehamilton.com}
}
\examples{
# copy data into 'dat' and examine data
dat <- dat.hannum2020
dat

\dontrun{
   
# load metafor package
require(metafor)

# compute effect size
dat <- escalc(measure="PR", xi=xi, ni=ni, data=dat)

# split data into objective and subjective datasets
dat_split <- split(dat, dat$objectivity)
dat_objective <- dat_split[["Objective"]]
dat_subjective <- dat_split[["Subjective"]]

# random-effects model all studies
res_all <- rma(yi, vi, data=dat)
print(res_all, digits=2)

# random-effects model objective
res_objective <- rma(yi, vi, data=dat_objective)
print(res_objective, digits=2)

# random-effects model subjective
res_subjective <- rma(yi, vi, data=dat_subjective)
print(res_subjective, digits=2)

}
}
\keyword{datasets}
\concept{medicine}
\concept{covid-19}
\concept{proportions}
