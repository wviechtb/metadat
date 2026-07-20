\name{dat.miguel2026}
\docType{data}
\alias{dat.miguel2026}
\title{Social functioning outcomes of psychotherapy, antidepressants, and combined treatment for depressive disorders}
\description{Results of 94 trials examining the effect of psychological treatment, antidepressants or combination therapy on social functioning outcomes in patients with depressive disorders.}
\usage{
dat.miguel2026
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study} \tab \code{character} \tab First author and year of the study. \cr
\bold{treatment1} \tab \code{character} \tab Treatment in the first group. \cr
\bold{treatment2} \tab \code{character} \tab Treatment in the second group. \cr
\bold{yi} \tab \code{numeric} \tab Small-sample bias corrected standardized mean difference (Hedges' \emph{g}) between the two groups. \cr
\bold{vi} \tab \code{numeric} \tab Sampling variance of \code{yi}. \cr
\bold{sei} \tab \code{numeric} \tab Standard error of Hedges' \emph{g}. \cr
\bold{treatment1.details} \tab \code{character} \tab Detailed description of the treatment in the first group. \cr
\bold{treatment2.details} \tab \code{character} \tab Detailed description of the treatment in the second group. \cr
\bold{design} \tab \code{character} \tab Description of the study design (compared treatments). \cr
\bold{instrument} \tab \code{character} \tab Rating instrument used to assess social functioning. \cr
\bold{time.weeks} \tab \code{integer} \tab Assessment point in weeks after randomization. \cr
\bold{mean.age} \tab \code{numeric} \tab Mean age of the sample. \cr
\bold{percent.women} \tab \code{integer} \tab Percentage of women in the sample. \cr
\bold{rob} \tab \code{character} \tab Risk of bias assessment. \cr
\bold{country} \tab \code{character} \tab Region in which the trial was conducted. \cr
}  
}
\details{
The dataset includes outcomes on social functioning from 94 trials examining the effect of psychological
treatment, antidepressants, or combination therapy in patients with depressive disorders. 

The \code{treatment1} and \code{treatment2} columns indicate the treatments compared in each trial:

\itemize{
  \item \code{psy}: psychological treatment
  \item \code{pha}: pharmacological treatment (antidepressants)
  \item \code{pla}: placebo
  \item \code{wl}: waitlist
  \item \code{nt}: no treatment
  \item \code{cau}: care as usual
}


This dataset was extracted from the \emph{Metapsy} living evidence database 
on psychological treatments for depression (\code{depression-psyctr}). 
Further information on this database can be found on its 
\href{https://docs.metapsy.org/databases/depression-psyctr/}{documentation page}.
An update of the living database with all trials published up to May 1st, 2025 was used
to compile the present dataset.

The dataset can be used to illustrate network meta-analytic methods with a contrast-level
("wide format") data frame and precalculated effect size information.  

}
\source{
Miguel, C., Tong, L., Tajika, A., Harrer, M., de Ponti, N., Yoshimura, K., 
Ciharova, M., van Haaren, P., Buntrock, C., Cipriani, A., Salanti, G., 
Ostinelli, E., Cristea, I. A., Cuijpers, P., Karyotaki, E., & 
Furukawa, T. A. (2026). \emph{Psychotherapy, antidepressants, and combined 
treatment for depression: A network meta-analysis on social functioning 
outcomes.}

Cuijpers, P., Miguel, C., Harrer, M., Plessen, C.Y., Ciharova, M., 
Ebert, D. & Karyotaki, E. (2026). \emph{Database of depression psychotherapy 
trials with control conditions. Part of the Metapsy project}. 
URL \href{https://docs.metapsy.org/databases/depression-psyctr/}{docs.metapsy.org/databases/depression-psyctr}. 
DOI https://doi.org/10.5281/zenodo.7254845.
}
\author{Mathias Harrer, \email{m.harrer@vu.nl}; Clara Miguel, \email{clara.miguelsanz@vu.nl}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.miguel2026
dat

\dontrun{
library(netmeta)

# Run network meta-analysis
(res <- netmeta(yi, sei, treatment1, treatment2, study, dat, 
                common = FALSE, reference.group = "cau"))

# Generate network graph
netgraph(res, plastic=TRUE)

# Generate forest plot
forest(res, sortvar=TE)
}
}
\keyword{datasets}
\concept{psychiatry}
\concept{psychology}
\concept{standardized mean differences}
\concept{network meta-analysis}
\section{Concepts}{
   psychiatry, psychology, standardized mean differences, network meta-analysis
}
