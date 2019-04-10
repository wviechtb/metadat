\name{dat.nakagawa2015}
\docType{data}
\alias{dat.nakagawa2015}
\title{Meta-analysis of variance: ecological and evolutionary applications and beyond.}
\description{Data from Nakagawa et al. 2015, which is a methdological paper decribing effect sizes for studying the effects of a treatment/factor on variance. The study contains three different meta-analytic datasets and two phylogenys.}
\usage{dat.nakagawa2015}
\format{
The data frame dat.nakagawa2015.1 contains the following columns:
\tabular{lll}{
\bold{effect.id} \tab \code{integer} \tab a unique effect size identifier \cr
\bold{species} \tab \code{character} \tab species \cr
\bold{animal} \tab \code{character} \tab species in animal-friendly format to match the phylogeny \cr
\bold{reference} \tab \code{character} \tab reference or primary study \cr
\bold{unit} \tab \code{character} \tab unit the outcome is quantified in \cr
\bold{Trait} \tab \code{character} \tab broad categoristation type of trait quantified \cr
\bold{trait_details} \tab \code{character} \tab details of trait being quantified \cr
\bold{male_mean} \tab \code{numeric} \tab mean trait value for males \cr
\bold{male_SD} \tab \code{numeric} \tab sd of trait value for males \cr
\bold{male_n} \tab \code{integer} \tab sample size for males \cr
\bold{female_mean} \tab \code{numeric} \tab mean trait value for females \cr
\bold{female_SD} \tab \code{numeric} \tab sd of trait value for females \cr
\bold{female_n} \tab \code{integer} \tab sample size for females \cr
}  
The data frame dat.nakagawa2015.2 contains the following columns:
\tabular{lll}{
\bold{effect.id} \tab \code{integer} \tab a unique effect size identifier \cr
\bold{species} \tab \code{character} \tab species \cr
\bold{animal} \tab \code{character} \tab species in animal-friendly format to match the phylogeny \cr
\bold{reference} \tab \code{character} \tab reference or primary study \cr
\bold{unit} \tab \code{character} \tab unit the outcome is quantified in \cr
\bold{Trait} \tab \code{character} \tab broad categoristation type of trait quantified \cr
\bold{trait_details} \tab \code{character} \tab details of trait being quantified \cr
\bold{male_mean} \tab \code{numeric} \tab mean trait value for males \cr
\bold{male_SD} \tab \code{numeric} \tab sd of trait value for males \cr
\bold{male_n} \tab \code{integer} \tab sample size for males \cr
\bold{female_mean} \tab \code{numeric} \tab mean trait value for females \cr
\bold{female_SD} \tab \code{numeric} \tab sd of trait value for females \cr
\bold{female_n} \tab \code{integer} \tab sample size for females \cr
}  
The data frame dat.nakagawa2015.3 contains the following columns:
\tabular{lll}{
\bold{effect.id} \tab \code{character} \tab a unique effect size identifier \cr
\bold{Phylum} \tab \code{character} \tab phylum of parasite \cr
\bold{Class} \tab \code{character} \tab class of parasite \cr
\bold{Family} \tab \code{character} \tab family of parasite \cr
\bold{Host.species} \tab \code{character} \tab host species \cr
\bold{Host.taxon} \tab \code{character} \tab host taxa \cr
\bold{CMean} \tab \code{numeric} \tab mean trait value for control group \cr
\bold{CSD} \tab \code{numeric} \tab sd trait value for control group \cr
\bold{CN} \tab \code{integer} \tab sample size for control group \cr
\bold{EMean} \tab \code{numeric} \tab mean trait value for parasitised group \cr
\bold{ESD} \tab \code{numeric} \tab sd trait value for parasitised group \cr
\bold{EN} \tab \code{integer} \tab sample size for parasitised group \cr
\bold{Transmission.by.predation.vector.or.not} \tab \code{character} \tab is the parasite dependent upon predation for transmission \cr
\bold{spontaneous.or.stimulus.response} \tab \code{character} \tab was the response behaviour stimulated or spontaeous \cr
\bold{Behaviour.details} \tab \code{character} \tab detailed description of behaviour \cr
\bold{Year.of.publication} \tab \code{integer} \tab year published \cr
\bold{Reference} \tab \code{character} \tab reference \cr
\bold{Expected.direction.of.change} \tab \code{character} \tab whether parasitisation is expected to increase/decrease the trait mean \cr
}  
The data dat.nakagawa2015.phy1 contains the topology for a phylogeny of the bird species in dat.nakagawa2015.1\cr
The data dat.nakagawa2015.phy2 contains the topology for a phylogeny of the bird species in dat.nakagawa2015.1\cr
}
\details{
	Nakagawa et al. ()2015) is a methdological paper, which decribes effect sizes and models designed to study the effects of a treatment/factor on variance. The study contains three different meta-analytic datasets and two phylogenys. 
	
	dat.nakagawa2015.1 and dat.nakagawa2015.2 contain data on the mean and standard deviation (sd) in morphological traits of males and females in birds (dat.nakagawa2015.1) and mammals (dat.nakagawa2015.2). dat.nakagawa2015.phy1 and dat.nakagawa2015.phy2 are corresponding phylogenetic topologies. The sex-chromosome hypothesis predicts that the heterogametic sex (females in birds and males in mammals) will have greater variability.
	
	dat.nakagawa2015.3 is a data set on the effects of parasitism on behavioural traits, and contains data on the mean and sd of animal behaviours of groups of animals that are and are not parasitised. The working hypothesis in the paper was that parasitism will increase variation in behaviour.
	}
\source{Nakagawa, S., Poulin, R., Mengersen, K., Reinhold, K., Engqvist, L., Lagisz, M. & Senior, A.M. (2015). Meta-analysis of variance: ecological and evolutionary applications and beyond.  \emph{Methods in Ecology and Evolution}, \bold{6}, 143-152}
\author{Alistair Senior, \email{alistair.senior@sydney.edu.au}}
\examples{
### copy data into 'dat' and examine data
dat <- dat.nakagawa2015.1
dat
phy <- dat.nakagawa2015.phy1

# Check a standard random effects vs a phylogenetic meta-analysis (REMA vs PMA) for the bird data
if((require(metafor) && require(ape))){
	
	# Calculate the effect sizes - log coefficient of variance ratio
	dat<-escalc(measure = "CVR", n1i = male_n, m1i = male_mean, sd1i = male_SD, n2i = female_n, m2i = female_mean, sd2i = female_SD, data=dat)
	
	# Convert phy to ultrametric format (Grafen's method)
	phy<-compute.brlen(phy)
	
	# Convert to correlation matrix
	CorMatrix<-vcv.phylo(phy, cor=TRUE)
	Cov<-CorMatrix[match(dat$animal, rownames(CorMatrix)),match(dat$animal, colnames(CorMatrix))]
	
	# Ensure the random effects are factors
	dat$effect.id<-as.factor(dat$effect.id)
	dat$species<-as.factor(dat$species)
	dat$animal<-as.factor(dat$animal)
	
	# Fit the models
	REMA<-rma.mv(yi = yi , V = vi, random=list(~1|effect.id), data=dat)
	summary(REMA)
	PMA<-rma.mv(yi = yi , V = vi, random=list(~1|animal, ~1|effect.id), R=list(animal = Cov), data=dat)
	summary(PMA)
}
}
\keyword{datasets}
\concept{ecology}
\concept{evolution}
\concept{standardized mean difference}
\concept{response ratio}
\concept{variance ratio}
