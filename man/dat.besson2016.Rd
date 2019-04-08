
\name{dat.besson2016}
\docType{data}
\alias{dat.besson2016}
\title{Data set on how maternal diet impacts copying styles in rodents}
\description{Results from 48 studies on the effectiveness of school-based writing-to-learn interventions on academic achievement.}
\usage{dat.besson2016}
\format{The data frame contains the following columns:
\tabular{lll}{
\bold{comp_ID}       \tab \code{numecharacter}   \tab Effect size \cr
\bold{study_ID}   \tab \code{character} \tab study identification \cr
\bold{dam_ID}     \tab \code{character}   \tab mother identification \cr
\bold{animal_ID}    \tab \code{character}   \tab  \cr animal identification
\bold{Reference}   \tab \code{character}   \tab study reference \cr
\bold{species}  \tab \code{character}   \tab species name \cr
\bold{strain}      \tab \code{character}   \tab strain of mice / rats \cr
\bold{manip_type} \tab \code{character}   \tab  \cr
...
}
}
\details{
   TO DO HERE
}
\source{
   Besson, A. A., Lagisz, M., Senior, A.M., Hector, K.L. and Nakagawa, S. (2016). Effect of maternal diet on offspring coping styles in rodents: a systematic review and meta-analysis. \emph{Biological Reviews}, \bold{91}:1065--1080
 
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.besson2016
dat
}
\keyword{datasets}