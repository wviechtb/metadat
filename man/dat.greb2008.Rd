\name{dat.greb2008}
\docType{data}
\alias{dat.greb2008}
\title{Trials on High-Dose Chemotherapy with Autologous Stem Cell Transplantation in Aggressive Non-Hodgkin Lymphoma}
\description{Results on complete response from 14 trials evaluating high-dose chemotherapy with autologous stem cell transplantation in patients with aggressive non-Hodgkin lymphoma.}
\usage{
dat.greb2008
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study} \tab \code{character} \tab study label \cr
\bold{Ee} \tab \code{integer} \tab complete responses (high-dose chemotherapy) \cr
\bold{Ne} \tab \code{integer} \tab number of patients (high-dose chemotherapy) \cr
\bold{Ec} \tab \code{integer} \tab complete responses (standard chemotherapy) \cr
\bold{Nc} \tab \code{integer} \tab number of patients (standard chemotherapy) \cr
}
}
\details{
Greb et al. (2008) conducted a Cochrane Review to assess the effects of high-dose chemotherapy with autologous stem cell transplantation as part of the first-line treatment of adult patients with aggressive non-Hodgkin lymphoma. The primary outcome was survival time; the binary outcome 'complete response' was one of several secondary outcomes. For binary outcomes, the Cochrane review used the risk ratio and the common effect model.

This data set is used as an example in Schwarzer et al. (2015).
}
\source{
Greb, A., Bohlius, J., Schiefer, D., et al. (2008). High‐dose chemotherapy with autologous stem cell transplantation in the first line treatment of aggressive non‐Hodgkin lymphoma (NHL) in adults. Cochrane Database of Systematic Reviews, \bold{1}, \verb{ https://doi.org/10.1002/14651858.CD004024.pub2}
}
\references{
Schwarzer, G., Carpenter, J. R., & Rücker, G. (2015). \emph{Meta-analysis with R}. Cham, Switzerland: Springer.
}
\author{
Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}, \url{https://github.com/guido-s/}
}
\examples{
### Show first five studies
head(dat.greb2008, 5)

\dontrun{
### Load meta package
suppressPackageStartupMessages(library("meta"))

### Use RevMan 5 settings
oldset <- settings.meta("RevMan5")

### Conduct common effect meta-analysis with risk ratio as effect measure
mb1 <- metabin(Ee, Ne, Ec, Nc, 
  data = dat.greb2008, studlab = study,
  label.e = "High dose", label.c = "Standard",
  label.left = "Favours standard chemotherapy",
  label.right = "Favours high dose chemotherapy",
  col.label.left = "red", col.label.right = "green")
mb1

### Create forest plot
forest(mb1)

### Use previous settings
settings.meta(oldset)
}
}
\keyword{datasets}
\concept{medicine}
\concept{oncology}
\concept{risk ratios}
\section{Concepts}{
   medicine, oncology, risk ratios
}
