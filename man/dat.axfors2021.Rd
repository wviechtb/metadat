\name{dat.axfors2021}
\docType{data}
\alias{dat.axfors2021}
\title{Mortality Outcomes with Hydroxychloroquine and Chloroquine in COVID-19 from an International Collaborative Meta-Analysis of Randomized Trials}
\description{Results from 33 trials examining the effectiveness of hydroxychloroquine or chloroquine in patients with COVID-19.}
\usage{
dat.axfors2021
}
\format{The data frame contains the following columns:
\tabular{lll}{
\bold{id}                \tab \code{character} \tab registry number \cr
\bold{acronym}           \tab \code{character} \tab shortened registry number \cr
\bold{patient_setting}   \tab \code{character} \tab patient setting \cr
\bold{blinding_exact}    \tab \code{character} \tab study blinding \cr
\bold{high_dose}         \tab \code{character} \tab high or low dose of medication \cr
\bold{Published}         \tab \code{character} \tab publication status \cr
\bold{hcq_cq}            \tab \code{character} \tab medication type (hcq = hydroxychloroquine or cq = chloroquine) \cr
\bold{hcq_arm_event}     \tab \code{numeric}   \tab number of deaths in the treatment group \cr
\bold{hcq_arm_total}     \tab \code{numeric}   \tab number of patients in the treatment group \cr
\bold{control_arm_event} \tab \code{numeric}   \tab number of deaths in the control group \cr
\bold{control_arm_total} \tab \code{numeric}   \tab number of patients in the control group \cr
\bold{Control}           \tab \code{character} \tab control group type (Standard of Care or Placebo)
}
}
\details{
   The dataset includes the results from 33 published and unpublished randomized clinical trials that examined the effectiveness of hydroxychloroquine or chloroquine in patients with COVID-19. The results given here are focused on the total mortality in the treatment versus control groups.
}
\references{
   Axfors, C., Schmitt, A. M., Janiaud, P., van’t Hooft, J., Abd-Elsalam, S., Abdo, E. F., Abella, B. S., Akram, J., Amaravadi, R. K., Angus, D. C., Arabi, Y. M., Azhar, S., Baden, L. R., Baker, A. W., Belkhir, L., Benfield, T., Berrevoets, M. A. H., Chen, C.-P., Chen, T.-C., … Hemkens, L. G. (2021). Mortality outcomes with hydroxychloroquine and chloroquine in COVID-19 from an international collaborative meta-analysis of randomized trials. Nature Communications, 12(1), 2349. \verb{https://doi.org/10.1038/s41467-021-22446-z}

}
\source{
   Axfors, C., Schmitt, A., Janiaud, P., van ’t Hooft, J., Moher, D., Goodman, S., … Hemkens, L. G. (2021, March 9). Hydroxychloroquine and chloroquine for survival in COVID-19: An international collaborative meta-analysis of randomized trials. \verb{https://doi.org/10.17605/OSF.IO/QESV4}
}
\author{
   W. Kyle Hamilton \email{whamilton@ucmerced.edu} \url{https://kylehamilton.com}
}
\examples{
# copy data into 'dat' and examine data
dat <- dat.axfors2021
dat

\dontrun{

# load metafor package
require(metafor)

# calculate log odds ratios and corresponding sampling variances
dat <- escalc(measure="OR", ai=hcq_arm_event, n1i=hcq_arm_total,
                            ci=control_arm_event, n2i=control_arm_total, data=dat)

# meta-analysis Hydroxychloroquine
res_hcq <- rma(yi, vi, subset=(hcq_cq=="hcq"), slab = id, data=dat)
print(res_hcq, digits=2)

# meta-analysis Chloroquine
res_cq <- rma(yi, vi, subset=(hcq_cq=="cq"), slab = id, data=dat)
print(res_cq, digits=2)

}
}
\keyword{datasets}
\concept{medicine}
\concept{covid-19}
\concept{odds ratios}
