\name{dat.english2016}
\docType{data}
\alias{dat.english2016}
\alias{dat.english2016.1}
\alias{dat.english2016.2}
\title{Does early-life diet affect longevity? A meta-analysis across experimental studies}
\description{Results from studies on the effects of early-life dietary restriction on longevity.}
\usage{dat.english2016}
\format{
	The data.frame, dat.english2016.1, contains the following columns:
    \tabular{lll}{
      \bold{StudyNo}       \tab \code{integer}     \tab unique study identifier \cr
      \bold{EffectID}   \tab \code{integer} \tab unique effect size identifier \cr
      \bold{Author}     \tab \code{character}   \tab first author of primary study \cr
      \bold{Year} \tab \code{integer}   \tab year of publication \cr
      \bold{Journal} \tab \code{character}   \tab journal of publication \cr
      \bold{Species} \tab \code{character}   \tab experimental organism \cr
      \bold{Phylum} \tab \code{character}   \tab invertebrate or vertebrate \cr
      \bold{ExptLifeStage} \tab \code{character}   \tab whether the treatment is intitated pre- or post-natally \cr
      \bold{ManipType} \tab \code{character}   \tab was the quality or quantity of the diet restricted \cr
      \bold{CatchUp} \tab \code{character}   \tab did the experimental group experience catch-up growth \cr
      \bold{Sex} \tab \code{character}   \tab males, females or both were studied \cr
      \bold{AdultDiet} \tab \code{character}   \tab was the restriction continuued post-maturity \cr
      \bold{NStartControl} \tab \code{integer}   \tab size of control cohort \cr
      \bold{NStartExpt} \tab \code{integer}   \tab size of restricted cohort \cr
      \bold{yi} \tab \code{numeric}   \tab log hazard ratio; negative values suggest lower survival in restricted group \cr
      \bold{vi} \tab \code{numeric}   \tab sample variance for log hazard ratio \cr
  }
  The data.frame, dat.english2016.2, contains the following columns:
  \tabular{lll}{
      \bold{StudyNo}       \tab \code{integer}     \tab unique study identifier \cr
      \bold{EffectID}   \tab \code{integer} \tab unique effect size identifier \cr
      \bold{Author}     \tab \code{character}   \tab first author of primary study \cr
      \bold{Year} \tab \code{integer}   \tab year of publication \cr
      \bold{Journal} \tab \code{character}   \tab journal of publication \cr
      \bold{Species} \tab \code{character}   \tab experimental organism \cr
      \bold{Phylum} \tab \code{character}   \tab invertebrate or vertebrate \cr
      \bold{ExptLifeStage} \tab \code{character}   \tab whether the treatment is intitated pre- or post-natally \cr
      \bold{ManipType} \tab \code{character}   \tab was the quality or quantity of the diet restricted \cr
      \bold{CatchUp} \tab \code{character}   \tab did the experimental group experience catch-up growth \cr
      \bold{Sex} \tab \code{character}   \tab males, females or both were studied \cr
      \bold{AdultDiet} \tab \code{character}   \tab was the restriction continuued post-maturity \cr
      \bold{NStartControl} \tab \code{integer}   \tab size of control cohort \cr
      \bold{NStartExpt} \tab \code{integer}   \tab size of restricted cohort \cr
      \bold{MeanC} \tab \code{numeric}   \tab mean age at death in the control group \cr
      \bold{MeanE} \tab \code{numeric}   \tab mean age at death in the restricted group \cr
      \bold{SD_C} \tab \code{numeric}   \tab sd in age at death in the control group \cr
      \bold{SD_E} \tab \code{numeric}   \tab sd in age at death in the restricted group \cr
  }
}
\details{
A meta-analysis of the effects of early-life dietary restriction on longevity. The data come studies in a range of species, where one group experiences a dietary restriction (quantity and/or quality, usually protein and/or calorie restrictions) early in life, and the other (control group) is given an unrestricted diet (often ad libitum food access).

Longevity was quantified in two different ways in the primary literature, either as survival curves, or as average life-span, which were thus analysed in two analyses using two effect sizes were used, the log hazard ratio (lnHR), and standardized mean difference, (dat.english2016.1 and dat.english2016.2) respectively. In the case of the lnHR data the effect size has been pre-computed. There can be more than one effect size per-study, depending on the experimental design. dat.english2016.2 was re-analysed in Senior, Nakagawa, Raubenheimer, Simpson & Noble. 2017. Dietary restriction increases variability in longevity. Biology Letters, 13, 3.
}
\source{
English, S. & Uller, T. (2018). Does early-life diet affect longevity? A meta-analysis across experimental studies. \emph{Biology Letters}, \bold{12}, 9.
}
\examples{
  ### copy data into 'dat' and examine data
  dat <- dat.english2016.1
  dat
}
\keyword{datasets}
\concept{ecology}
\concept{evolution}
\concept{standardized mean difference}
\concept{hazard ratio}
\concept{variance ratio}