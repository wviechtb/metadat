\name{dat.mccurdy2020}
\docType{data}
\alias{dat.mccurdy2020}
\title{Studies on the Generation Effect}
\description{Results from 126 articles that examined the so-called \sQuote{generation effect}.}
\usage{
dat.mccurdy2020
}
\format{The data frame contains the following columns:
\tabular{lll}{
\bold{article}          \tab \code{numeric}   \tab article identifier \cr
\bold{experiment}       \tab \code{character} \tab experiment (within article) identifier \cr
\bold{sample}           \tab \code{numeric}   \tab sample (within experiment) identifier \cr
\bold{id}               \tab \code{numeric}   \tab row identifier \cr
\bold{pairing}          \tab \code{numeric}   \tab identifier to indicate paired conditions within experiments \cr
\bold{yi}               \tab \code{numeric}   \tab mean recall rate for the condition \cr
\bold{vi}               \tab \code{numeric}   \tab corresponding sampling variance \cr
\bold{ni}               \tab \code{numeric}   \tab number of participants for the condition \cr
\bold{stimuli}          \tab \code{numeric}   \tab number of stimuli for the condition \cr
\bold{condition}        \tab \code{factor}    \tab condition (\sQuote{read} or \sQuote{generate}) \cr
\bold{gen_difficulty}   \tab \code{factor}    \tab generation difficulty (\sQuote{low} or \sQuote{high}) \cr
\bold{manip_type}       \tab \code{factor}    \tab manipulation type of the generate versus read condition (using a \sQuote{within} or \sQuote{between} subjects design) \cr
\bold{present_style}    \tab \code{factor}    \tab presentation style (\sQuote{mixed} or \sQuote{pure} list presentation) \cr
\bold{word_status}      \tab \code{factor}    \tab word status (\sQuote{words}, \sQuote{non-words}, or \sQuote{numbers}) \cr
\bold{memory_test}      \tab \code{factor}    \tab memory test (\sQuote{recognition}, \sQuote{cued recall}, or \sQuote{free recall}) \cr
\bold{memory_type}      \tab \code{factor}    \tab memory type (\sQuote{item}, \sQuote{source}, \sQuote{font color}, \sQuote{font type}, \sQuote{order}, \sQuote{cue word}, \sQuote{background color}, or \sQuote{location}) \cr
\bold{gen_constraint}   \tab \code{factor}    \tab generation constraint (\sQuote{low}, \sQuote{medium}, or \sQuote{high}) \cr
\bold{learning_type}    \tab \code{factor}    \tab learning type (\sQuote{incidental} or \sQuote{intentional}) \cr
\bold{stimuli_relation} \tab \code{factor}    \tab stimuli relation (\sQuote{semantic}, \sQuote{category}, \sQuote{antonym}, \sQuote{synonym}, \sQuote{rhyme}, \sQuote{compound words}, \sQuote{definitions}, or \sQuote{unrelated}) \cr
\bold{gen_mode}         \tab \code{factor}    \tab generation mode (\sQuote{verbal/speaking}, \sQuote{covert/thinking}, or \sQuote{writing/typing}) \cr
\bold{gen_task}         \tab \code{factor}    \tab generation task (\sQuote{anagram}, \sQuote{letter transposition}, \sQuote{word fragment}, \sQuote{sentence completion}, \sQuote{word stem}, \sQuote{calculation}, or \sQuote{cue only}) \cr
\bold{attention}        \tab \code{factor}    \tab attention (\sQuote{divided} or \sQuote{full}) \cr
\bold{pacing}           \tab \code{factor}    \tab pacing (\sQuote{self-paced} or \sQuote{timed}) \cr
\bold{filler_task}      \tab \code{factor}    \tab filler task (\sQuote{yes} or \sQuote{no}) \cr
\bold{age_grp}          \tab \code{factor}    \tab age group (\sQuote{younger} or \sQuote{older} adults) \cr
\bold{retention_delay}  \tab \code{factor}    \tab retention delay (\sQuote{immediate}, \sQuote{short}, or \sQuote{long}) \cr
}
}
\details{
   The generation effect is the memory benefit for self-generated compared with read or experimenter-provided information (Jacoby, 1978; Slamecka & Graf, 1978). In a typical study, participants are presented with a list of stimuli (usually words or word pairs). For half of the stimuli, participants self-generate a target word (e.g., open–cl____), while for the other half, participants simply read an intact target word (e.g., above–below). On a later memory test for the target words, the common finding is that self-generated words are better remembered than read words (i.e., the generation effect).

   Although several theories have been proposed to explain the generation effect, there is still some debate on the underlying memory mechanism(s) contributing to this phenomenon. The meta-analysis by McCurdy et al. (2020) translated various theories on the generation effect into hypotheses that could then be tested in moderator analyses based on a dataset containing 126 articles, 310 experiments, and 1653 mean recall estimates collected under various conditions.

   Detailed explanations of the various variables coded (and how these can be used to test various hypotheses regarding the generation effect) can be found in the article. The most important variable is \code{condition}, which denotes whether a particular row of the dataset corresponds to the results of a \sQuote{read} or a \sQuote{generate} condition.

   The data structure is quite complex. Articles may have reported the findings from multiple experiments involving one or multiple samples that were examined under various conditions. The \code{pairing} variable indicates which rows of the dataset represent a pairing of a read condition with one or multiple corresponding generate conditions within an experiment. A pairing may involve the same sample of subjects (when using a within-subjects design for comparing the conditions) or different samples (when using a between-subjects design).
}
\source{
   McCurdy, M. P., Viechtbauer, W., Sklenar, A. M., Frankenstein, A. N., & Leshikar, E. D. (2020). Theories of the generation effect and the impact of generation constraint: A meta-analytic review. \emph{Psychonomic Bulletin & Review}, \bold{27}(6), 1139--1165. \verb{https://doi.org/10.3758/s13423-020-01762-3}
}
\references{
   Slamecka, N. J., & Graf, P. (1978). The generation effect: Delineation of a phenomenon. \emph{Journal of Experimental Psychology: Human Learning and Memory}, \bold{4}(6), 592--604. \verb{https://doi.org/10.1037/0278-7393.4.6.592}

   Jacoby, L. L. (1978). On interpreting the effects of repetition: Solving a problem versus remembering a solution. \emph{Journal of Verbal Learning and Verbal Behavior}, \bold{17}(6), 649--668. \verb{https://doi.org/10.1016/S0022-5371(78)90393-6}
}
\author{
   Wolfgang Viechtbauer, \email{wvb@metafor-project.org}, \url{https://www.metafor-project.org}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.mccurdy2020
head(dat)

\dontrun{

### load metafor package
library(metafor)

### fit multilevel mixed-effects meta-regression model
res <- rma.mv(yi, vi, mods = ~ condition,
              random = list(~ 1 | article/experiment/sample/id, ~ 1 | pairing),
              data=dat, sparse=TRUE, digits=3)
res

### proportion of total amount of heterogeneity due to each component
data.frame(source=res$s.names, sigma2=round(res$sigma2, 3),
   prop=round(res$sigma2 / sum(res$sigma2), 2))

### apply cluster-robust inference
sav <- robust(res, cluster=article)
sav

### estimated average recall rate in read and generate conditions
predict(sav, newmods = c(0,1), digits=3)

### use methods from clubSandwich package
sav <- robust(res, cluster=article, clubSandwich=TRUE)
sav

}
}
\keyword{datasets}
\concept{psychology}
\concept{memory}
\concept{proportions}
\concept{raw means}
\concept{multilevel models}
\concept{cluster-robust inference}
\section{Concepts}{
   psychology, memory, proportions, raw means, multilevel models, cluster-robust inference
}
