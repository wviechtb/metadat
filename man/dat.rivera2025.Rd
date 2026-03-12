\name{dat.rivera2025}
\docType{data}
\alias{dat.rivera2025}
\title{Comparison of Two Diagnostic Tests for the Detection of Temporomandibular Disorders}
\description{Studies evaluating the diagnostic accuracy of the IAF and 3Q-TMD instruments based on the reference tests RDC and DC-TMD for the diagnosis of temporomandibular disorders.}
\usage{
dat.rivera2025
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{Author}      \tab \code{character} \tab study author(s) \cr
\bold{Year}        \tab \code{integer}   \tab year of the study \cr
\bold{Title}       \tab \code{character} \tab title of the article  \cr
\bold{DOI}         \tab \code{character} \tab DOI for the article \cr
\bold{TP}          \tab \code{integer}   \tab number of true positives \cr
\bold{FP}          \tab \code{integer}   \tab number of false positives \cr
\bold{FN}          \tab \code{integer}   \tab number of false negatives \cr
\bold{TN}          \tab \code{integer}   \tab number of true negatives \cr
\bold{Sensitivity} \tab \code{numeric}   \tab sensitivity \cr
\bold{Specificity} \tab \code{numeric}   \tab specificity \cr
\bold{PPV}         \tab \code{numeric}   \tab positive predictive value \cr
\bold{NPV}         \tab \code{numeric}   \tab negative predictive value \cr
\bold{Sample.size} \tab \code{integer}   \tab sample size \cr
\bold{n1}          \tab \code{integer}   \tab number of people with the disease \cr
\bold{n2}          \tab \code{integer}   \tab number of people without the disease \cr
\bold{Prevalence}  \tab \code{numeric}   \tab prevalence \cr
\bold{AUC}         \tab \code{numeric}   \tab area under the curve \cr
\bold{SampleID}    \tab \code{character} \tab sample identifier
}  
}
\details{
   Results of 10 studies that evaluated the diagnostic accuracy of the IAF and 3Q-TMD instruments based on the reference tests RDC and DC-TMD were included. The search period ranged from 1992 to April 2022 in six electronic databases. Two independent reviewers selected the studies. Risk of bias and applicability were assessed using the QUADAS 2 instrument.
}
\source{
   Rivera, Hugo Daniel; Álvarez-Vaz, Ramón, 2025, "Conjunto de datos de: Comparación de dos pruebas diagnósticas para la detección de trastornos témporomandibulares. Una revisión sistemática y metaanálisis.", \verb{https://doi.org/10.60895/redata/YIEGLZ}, Repositorio de datos abiertos de investigación de Uruguay, V1
}
\references{
   Rivera, H. D., Rodríguez, C. I., Álvarez Vaz, R., & Kreiner, M. (2025). Comparison of two diagnostic tests for the detection of temporomandibular disorders: A systematic review and meta-analysis. Odontoestomatología, 27(45). \verb{https://doi.org/10.22592/ode2025n45e338}
}
\author{
   Álvarez-Vaz, Ramón, \email{ramon.alvarez@fcea.edu.uy}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.rivera2025
dat

\dontrun{
suppressPackageStartupMessages(library(meta))

### sensitivity
round(dat$TP / dat$n1, 4)
report1 <- metaprop(TP, n1, data=dat, common=TRUE, random=TRUE, studlab=paste(Author, Year))
report1
summary(report1)
forest(report1)

### specificity
round(dat$TN / dat$n2, 4)
report2 <- metaprop(TN, n2, data=dat, common=TRUE, random=TRUE, studlab=paste(Author, Year))
summary(report2)
forest(report2)

### diagnostic odds ratio
report3 <- metabin(TP, n1, n2-TN, n2, data=dat, sm="OR",common=FALSE, random=TRUE,
                   studlab=paste(Author, Year), allstudies=TRUE)
summary(report3)
}
}
\keyword{datasets}
\concept{medicine}
\concept{dentistry}
\concept{diagnostic accuracy studies}
\section{Concepts}{
   medicine, dentistry, diagnostic accuracy studies
}
