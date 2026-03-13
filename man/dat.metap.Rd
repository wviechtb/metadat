\name{dat.metap}
\docType{data}
\alias{dat.metap}
\title{Example Data for the Meta-Analysis of Significance Values}
\description{A collection of datasets for illustrating the meta-analysis of significance values (i.e., methods for combining p-values from tests of significance).}
\usage{
dat.metap
}
\format{
A list with the following elements:
\describe{
   \item{\code{beckerp}}{A numeric vector with 5 hypothetical \eqn{p}-values}

   \item{\code{cholest}}{A data frame with 34 observations on the following 5 variables:
   \tabular{lll}{
   \bold{ntreat}   \tab \code{numeric} \tab number of patients in the treated group \cr
   \bold{ncontrol} \tab \code{numeric} \tab number of patients in the control group \cr
   \bold{dtreat}   \tab \code{numeric} \tab number of deaths in the treated group \cr
   \bold{dcontrol} \tab \code{numeric} \tab number of deaths in the control group \cr
   \bold{p}        \tab \code{numeric} \tab one-sided \eqn{p}-values \cr
   }}

   \item{\code{edgington}}{A vector of with 7 hypothetical \eqn{p}-values}

   \item{\code{mourning}}{A data frame with 9 observations on the following 3 variables:
   \tabular{lll}{
   \bold{stance} \tab \code{character} \tab character variable with levels \code{No stand}, \code{Opponent}, \code{Supporter} \cr
   \bold{grade}  \tab \code{character} \tab character variable with levels \code{G11-12}, \code{G7-8}, \code{G9-10} \cr
   \bold{p}      \tab \code{numeric}   \tab \eqn{p}-values \cr
   }}

   \item{\code{naep}}{A data frame with 34 observations on the following 2 variables:
   \tabular{lll}{
   \bold{state} \tab \code{character} \tab character variable with two-letter US state names \cr
   \bold{p}     \tab \code{numeric}   \tab \eqn{p}-values \cr
   }}

   \item{\code{rosenthal}}{A data frame with 5 observations on the following 3 variables:
   \tabular{lll}{
   \bold{t}  \tab \code{numeric} \tab t-statistics \cr
   \bold{df} \tab \code{numeric} \tab degrees of freedom \cr
   \bold{p}  \tab \code{numeric} \tab one-sided \eqn{p}-values \cr
   }}

   \item{\code{teachexpect}}{A vector of 19 \eqn{p}-values}

   \item{\code{validity}}{
   A data frame with 20 observations on the following 3 variables:
   \tabular{lll}{
   \bold{n} \tab \code{numeric} \tab sample sizes \cr
   \bold{r} \tab \code{numeric} \tab correlation coefficients \cr
   \bold{p} \tab \code{numeric} \tab one-sided \eqn{p}-values \cr
   }}

   \item{\code{zhang}}{A data frame with 22 observations on the following 11 variables:
   \tabular{lll}{
   \bold{study}  \tab \code{character} \tab study names \cr
   \bold{smd}    \tab \code{numeric}   \tab standardized mean differences \cr
   \bold{lo}     \tab \code{numeric}   \tab lower confidence interval limits \cr
   \bold{hi}     \tab \code{numeric}   \tab upper confidence interval limits \cr
   \bold{ntreat} \tab \code{numeric}   \tab treated group sample sizes \cr
   \bold{ncont}  \tab \code{numeric}   \tab control group sample sizes \cr
   \bold{n}      \tab \code{numeric}   \tab total sample sizes \cr
   \bold{phase}  \tab \code{factor}    \tab phase the patients were in: acute, healing, healed \cr
   \bold{sd}     \tab \code{numeric}   \tab the calculated standard deviations \cr
   \bold{z}      \tab \code{numeric}   \tab the calculated z-values \cr
   \bold{p}      \tab \code{numeric}   \tab one-sided \eqn{p}-values \cr
   }}
}
}
\details{
\describe{
   \item{\code{beckerp}}{Hypothetical \eqn{p}-values from Becker (1994).}
   \item{\code{cholest}}{Trials of interventions for cholesterol lowering from Sutton et al. (2000).}
   \item{\code{edgington}}{Hypothetical \eqn{p}-values from Edgington (1972).}
   \item{\code{mourning}}{Results from a study of mourning practices of Israeli youth following the assassination of Itzakh Rabin from Benjamini and Hochberg (2000).}
   \item{\code{naep}}{Results of mathematical achievement scores from the National Assessment of Educational Progress from Benjamini and Hochberg (2000).}
   \item{\code{rosenthal}}{Hypothetical example from Rosenthal (1978).}
   \item{\code{teachexpect}}{\eqn{p}-values from studies of the effect of manipulating teacher expectancy on student IQ from Becker (1994).}
   \item{\code{validity}}{Data from studies of validity of student ratings of their instructors from Becker (1994) including correlations and sample sizes as well as \eqn{p}-values.}
   \item{\code{zhang}}{Data from trials of exercise training for patients with cardiovascular disease from Zhang et al. (2016).}
}
}
\author{Michael Dewey}
\note{
   The \eqn{p}-values in \code{cholest} have been re-calculated from other data given in the book and so are of higher accuracy than the ones given in the book which are only to two decimal places.
}
\references{
   Becker, B. J. (1994). Combining significance levels. In H. Cooper & L. V. Hedges (Eds.), \emph{The handbook of research synthesis} (pp. 215–230). New York: Russell Sage Foundation.

   Benjamini, Y., & Hochberg, Y. (2000). On the adaptive control of the false discovery rate in multiple testing with independent statistics. \emph{Journal of Educational and Behavioral Statistics}, \bold{25}(1), 60--83. \verb{https://doi.org/10.3102/10769986025001060}

   Edgington, E. S. (1972). An additive method for combining probability values from independent experiments. \emph{Journal of Psychology}, \bold{80}(2), 351-363. \verb{https://doi.org/10.1080/00223980.1972.9924813}

   Rosenthal, R. (1978). Combining results of independent studies. \emph{Psychological Bulletin}, \bold{85}(1), 185--193. \verb{https://doi.org/10.1037/0033-2909.85.1.185}

   Sutton, A. J., Abrams, K. R., Jones, D. R., Sheldon, T. A., & Song, F. (2000). \emph{Methods for meta-analysis in medical research}. Chichester, UK: Wiley.

   Zhang, Y.-M., Lu, Y., Tang, Y., Yang, D., Wu, H.-F., Bian, Z.-P., Xu, J.-D., Gu, C.-R., Wang, L.-S., & Chen, X.-J. (2016). The effects of different initiation time of exercise training on left ventricular remodeling and cardiopulmonary rehabilitation in patients with left ventricular dysfunction after myocardial infarction. \emph{Disability and Rehabilitation}, \bold{38}(3), 268--276. \verb{https://doi.org/10.3109/09638288.2015.1036174}
}
\examples{
dat.metap
}
\keyword{datasets}
\concept{combining p-values}
\section{Concepts}{
   combining p-values
}
