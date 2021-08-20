\name{dat.besson2016}
\docType{data}
\alias{dat.besson2016}
\title{Dataset on How Maternal Diet Impacts Copying Styles in Rodents}
\description{Results from 46 studies synthesising maternal nutritional effects on coping styles in rodents.}
\usage{
dat.besson2016
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{comp_ID} \tab \code{character} \tab effect-size unique identifier \cr
\bold{study_ID} \tab \code{character} \tab study unique identifier \cr
\bold{dam_ID} \tab \code{character} \tab dam unique identifier (group of dams subjected to the same treatment) \cr
\bold{animal_ID} \tab \code{character} \tab offspring unique identifier (group of offspring from the same dam group subjected to the same treatment) \cr
\bold{Reference} \tab \code{character} \tab author’s names and date \cr
\bold{species} \tab \code{character} \tab species [rats or mice] \cr
\bold{strain} \tab \code{character} \tab strain  \cr
\bold{manip_type} \tab \code{character} \tab maternal nutritional manipulation type [protein or calorie] \cr
\bold{manip_direction} \tab \code{character} \tab direction of maternal nutritional manipulation [- = restriction, + = overfeeding]  \cr
\bold{nom_manip_val} \tab \code{character} \tab degree of maternal nutritional manipulation as described in the original publications [\% = percentage of caloric or protein restriction, # = increase in caloric intake]   \cr
\bold{exp} \tab \code{character} \tab percentage of caloric or protein maternal restriction or increase in caloric intake of the experimental group  \cr
\bold{control} \tab \code{character} \tab percentage of caloric or protein maternal restriction or increase in caloric intake for the control group \cr
\bold{manip_parameter} \tab \code{character} \tab protein content, percentage fat or intake  \cr
\bold{vitmin_eql} \tab \code{character} \tab were vitamins equalized across maternal diets? [yes or no] \cr
\bold{adlib_con} \tab \code{character} \tab were maternal control groups fed ad libitum? [yes or no] \cr
\bold{adlib_exp} \tab \code{character} \tab were maternal experimental groups fed ad libitum? [yes or no] \cr
\bold{diet_con} \tab \code{character} \tab name of maternal control diet?  \cr
\bold{diet_exp} \tab \code{character} \tab name of maternal experimental diet?  \cr
\bold{dam_diet_start_dPC} \tab \code{numeric} \tab start of the dam diet [in days post-conception] \cr
\bold{dam_diet_end_dPC} \tab \code{numeric} \tab end of the dam diet [in days post-conception] \cr
\bold{diet_label} \tab \code{character} \tab period of maternal diet manipulation [pregestation = pre-gestation, pre = pregnancy, lact = lactation, or pre+lact = pregnancy and lactation] \cr
\bold{age_mating} \tab \code{numeric} \tab dam age at mating if known \cr
\bold{n_con_dam} \tab \code{integer} \tab sample size of the control dam groups \cr
\bold{n_exp_dam} \tab \code{integer} \tab sample size of the experimental dam groups \cr
\bold{multi_use_con} \tab \code{character} \tab were control groups used multiple time? [yes or no] \cr
\bold{dam_housing} \tab \code{character} \tab how were dams housed? [pair, group, or single] \cr
\bold{temperature} \tab \code{numeric} \tab temperature during the experiment [°C] \cr
\bold{photoperiod} \tab \code{integer} \tab photoperiod during the experiment [number of hours of light] \cr
\bold{litter_size} \tab \code{integer} \tab size of the litter [number of pups per dam] \cr
\bold{litter_size_equalized} \tab \code{character} \tab has litter size been equalized? [yes or no] \cr
\bold{crossfostered} \tab \code{character} \tab have pups been cross-fostered? [yes or no] \cr
\bold{sex} \tab \code{character} \tab sex of the offspring that were tested [m = male, f = female, both = mixed sex] \cr
\bold{housing} \tab \code{character} \tab offspring housing during the test period [dam, pair, single, or group] \cr
\bold{bodymass_mean_contr} \tab \code{numeric} \tab mean body mass of control offspring close to or during the testing period [g] \cr
\bold{bodymass_SE_contr} \tab \code{numeric} \tab S.E. for body mass of control offspring close to or during the testing period \cr
\bold{bodymass_mean_exp} \tab \code{numeric} \tab mean body mass of experimental offspring close to or during the testing period [g] \cr
\bold{bodymass_SE_exp} \tab \code{numeric} \tab S.E. for body mass of experimental offspring close to or during the testing period \cr
\bold{bm_N_contr} \tab \code{integer} \tab sample size for body mass of control offspring close to or during the testing period \cr
\bold{bm_N_exp} \tab \code{integer} \tab sample size for body mass of experimental offspring close to or during the testing period \cr
\bold{bm_dPP} \tab \code{integer} \tab age of offspring when body mass was measured [in days post-parturition] \cr
\bold{offspring_diet} \tab \code{character} \tab offspring diet after weaning [type of control diet] \cr
\bold{offspring_con_adlib} \tab \code{character} \tab were control offspring fed ad libitum after weaning? [yes or no] \cr
\bold{offspring_diet_level} \tab \code{character} \tab name of offspring diet after weaning  \cr
\bold{offspring_diet_end_dPP} \tab \code{integer} \tab end of the offspring diet [in days post-parturition]  \cr
\bold{post_diet_adlib} \tab \code{character} \tab were experimental offspring fed ad libitum after weaning? [yes or no] \cr
\bold{response_age_dPP} \tab \code{numeric} \tab offspring age when behavioural testing started [in days post-parturition] \cr
\bold{authors_behaviour_classification} \tab \code{character} \tab author's classification of offspring behaviour [anxiety, exploration, or activity] \cr
\bold{our_behaviour_classification} \tab \code{character} \tab our classification of offspring behaviour [anxiety, exploration, or activity] \cr
\bold{response_test} \tab \code{character} \tab type of test used [elevated T-maze (ETM), open field, etc.] to measure offspring behaviour \cr
\bold{time_trial} \tab \code{integer} \tab duration of the testing [min] \cr
\bold{measure} \tab \code{character} \tab measures taken during testing [total distance moved, time spent in open arm, etc.] \cr
\bold{unit} \tab \code{character} \tab unit of the behavioural measure taken [min, s, m, number (#), etc.] \cr
\bold{high_better} \tab \code{character} \tab for activity and exploration, a higher number is assumed to be better (i.e., animals were more active), but the opposite was assumed for anxiety (i.e., they were more anxious) [yes or no] \cr
\bold{night.day} \tab \code{character} \tab time of day when behaviours were measured [night or day]  \cr
\bold{comparison} \tab \code{character} \tab for a given control-treatment group comparison, animal group codes as used in the original article [e.g., LP, HP]. This field allows identification of exactly which data (i.e., comparison of which pairs of groups) were extracted from the original paper, and is not used in our analyses. For our analyses the groups were re-coded as control/experimental. \cr
\bold{exp_mean} \tab \code{numeric} \tab mean of the offspring behaviour measured for the experimental group \cr
\bold{exp_se} \tab \code{numeric} \tab S.E. of the offspring behaviour measured for the experimental group \cr
\bold{exp_n} \tab \code{integer} \tab sample size for the offspring experimental group \cr
\bold{con_mean} \tab \code{numeric} \tab mean of offspring behaviour measured for the control group \cr
\bold{con_se} \tab \code{numeric} \tab S.E. of the offspring behaviour measured for the control group \cr
\bold{con_n} \tab \code{integer} \tab sample size for the offspring control group \cr
\bold{con_ID} \tab \code{character} \tab identifier for shared control groups within experiment \cr
\bold{percentage} \tab \code{character} \tab is the offspring behaviour measure a percentage? [yes or no] \cr
\bold{Data_source} \tab \code{character} \tab figure or table number in the original paper from which the data were extracted \cr
\bold{measure_comments} \tab \code{character} \tab any comments on the offspring behaviour measures \cr
\bold{SE_imputed} \tab \code{character} \tab was S.E. imputed for the offspring behaviour measure? [yes or no] \cr
\bold{Comments} \tab \code{character} \tab any comments on the data \cr
}  
}
\details{
   Data from experiments where dams were subject to caloric or protein restriction or were overfed around gestation were included. Offspring activity, exploration, or anxiety were measured outcomes variables from maternal experimental treatments. Multilevel meta-analysis and meta-regression models were used to analyze the meta-analytic data.
}
\source{
   Besson, A. A., Lagisz, M., Senior, A. M., Hector, K. L., & Nakagawa, S. (2016). Effect of maternal diet on offspring coping styles in rodents: A systematic review and meta-analysis. \emph{Biological Reviews}, \bold{91}(4), 1065--1080. \verb{https://doi.org/10.1111/brv.12210}
}
\author{
   Daniel Noble, \email{daniel.noble@anu.edu.au}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.besson2016
head(dat)

\dontrun{

### load metafor
library(metafor)

### compute SD from SE
dat$sd_c <- with(dat, con_se * sqrt(con_n))
dat$sd_e <- with(dat, exp_se * sqrt(exp_n))

### compute standardized mean differences and corresponding sampling variances
dat <- escalc(measure="SMD", m1i=exp_mean, m2i=con_mean, sd1i=sd_e, sd2i=sd_c,
              n1i=exp_n, n2i=con_n, data=dat, add.measure=TRUE)

### fit model
mod1 <- rma.mv(yi ~ 1, V = vi, random = list(~ 1 | study_ID, ~ 1 | comp_ID), data = dat)
mod1

}
}
\keyword{datasets}
\concept{ecology}
\concept{evolution}
\concept{standardized mean differences}
