\name{dat.xia2008}
\docType{data}
\alias{dat.xia2008}
\title{Global Response Patterns of Terrestrial Plant Species to Nitrogen Addition}
\description{Results from 304 studies on the general response patterns of terrestrial plant species to the addition of N.}
\usage{dat.xia2008}
\format{The data frame contains the following columns:
  \tabular{lll}{
    \bold{Species_name}        \tab \code{character}   \tab species name \cr
    \bold{Seedplant_Sporeplant}        \tab \code{character}   \tab type of species \cr
    \bold{Woody_Herbaceous}          \tab \code{character}   \tab type of species \cr
    \bold{Evergreen_Deciduous}          \tab \code{character}   \tab type of species \cr
    \bold{Legume_Nonlegume}        \tab \code{character}   \tab type of species \cr
    \bold{Annual_Perennial}      \tab \code{character}   \tab type of species \cr
    \bold{Grass_Forb_Shrub_Tree}        \tab \code{character}   \tab type of species \cr
    \bold{C3_C4}        \tab \code{character}   \tab type of species, carbon \cr
    \bold{Tissue_type}        \tab \code{character}   \tab type of tissue measured \cr
    \bold{mean_control}        \tab \code{numeric}   \tab mean biomass in control \cr
    \bold{mean_treatment}        \tab \code{numeric}   \tab mean biomass in treatment \cr
    \bold{SD_control}        \tab \code{numeric}   \tab SD biomass in control \cr
    \bold{SD_treatment}        \tab \code{numeric}   \tab SD biomass in treatment \cr
    \bold{N_control}        \tab \code{numeric}   \tab sample size in control \cr
    \bold{N_treatment}        \tab \code{numeric}   \tab sample size in treatment \cr
    \bold{units}        \tab \code{character}   \tab units measured \cr
    \bold{Reference}        \tab \code{character}   \tab original reference, author, year \cr
    \bold{N_amount_g.m.2yr.1}        \tab \code{numeric}   \tab amount of nitrogen added \cr
    \bold{MAT}        \tab \code{numeric}   \tab mean annual temperature \cr
    \bold{MAP.mm.}        \tab \code{numeric}   \tab mean annual precipitation \cr
    \bold{Latitude}        \tab \code{numeric}   \tab latitude of experimental site \cr
  }
}
\details{
   In each study included in this meta-analysis the biomass of a specific plant species has been measured in an experimental and a control plot. Experimental plots consist of nitrogen (N) addition, where as corresponding control plots do not have N-addition. Each study may contribute more than one effect size (e.g. if >1 species/tissue type is measured, or >1 dose of N was added). A number of predictors relating to the type of plant and biomass measured are recorded, as well as the level of N added and climatological data related to the experimental site.

   The effect size used in the original analysis was a log response ratio. Potential sources of non-independence, which can be explored, but were not in the original study are: multiple comparisons to the same control group, phylogenetic effects, multiple measurements from the same group of plants, spatial effects and more.
}
\source{
   Xia, J., & Wan, J. (2008). Global response patterns of terrestrial plant species to nitrogen addition. \emph{New Phytologist}, \bold{179}, 428--439.
}
\author{Alistair M Senior, \email{alistair.senior@sydney.edu.au}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.xia2008
dat
}
\keyword{datasets}
\concept{ecology}
\concept{plants}
\concept{standardized mean difference}
\concept{non-independence}
