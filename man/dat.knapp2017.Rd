\name{dat.knapp2017}
\docType{data}
\alias{dat.knapp2017}
\title{Studies on Differences in Planning Performance in Schizophrenia Patients versus Healthy Controls}
\description{Results from 31 studies examining differences in planning performance in schizophrenia patients versus healthy controls.}
\usage{
dat.knapp2017
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{author}     \tab \code{character} \tab study author(s) \cr
\bold{year}       \tab \code{numeric}   \tab publication year \cr
\bold{study}      \tab \code{numeric}   \tab study id number \cr
\bold{task}       \tab \code{character} \tab type of task \cr
\bold{difficulty} \tab \code{numeric}   \tab task difficulty \cr
\bold{group1}     \tab \code{character} \tab identifier for patient group within studies \cr
\bold{group2}     \tab \code{character} \tab identifier for control group within studies \cr
\bold{comp}       \tab \code{numeric}   \tab identifier for comparisons within studies \cr
\bold{yi}         \tab \code{numeric}   \tab standardized mean difference for planning performance \cr
\bold{vi}         \tab \code{numeric}   \tab corresponding sampling variance \cr
\bold{n_sz}       \tab \code{numeric}   \tab number of schizophrenic patients \cr
\bold{n_hc}       \tab \code{numeric}   \tab number of healthy controls \cr
\bold{yi}         \tab \code{numeric}   \tab standardized mean difference for IQ \cr
\bold{vi}         \tab \code{numeric}   \tab corresponding sampling variance
}
}
\details{
   The studies included in this dataset examined differences between schizophrenia patients and healthy controls with respect to their performance on the tower of London test (\url{https://en.wikipedia.org/wiki/Tower_of_London_test}) or a similar cognitive tasks measuring planning ability. The outcome measure for this meta-analysis was the standardized mean difference (with positive values indicating better performance in the healthy controls compared to the schizophrenia patients).

   The dataset has a more complex structure for several reasons:
   \enumerate{
   \item Studies 2, 3, 9, and 20 included more than one schizophrenia patient group and the standardized mean differences were computed by comparing these groups against a single healthy control group.
   \item Studies 6, 12, 14, 15, 18, 19, 22, and 26 had the patients and controls complete different tasks of varying complexity (essentially the average number of moves required to complete a task). Study 6 also included two different task types.
   \item Study 24 provides two standardized mean differences, one for men and the other for women.
   \item Study 29 provides three standardized mean differences, corresponding to the three different COMT Val158Met genotypes (val/val, val/met, and met/met).
   }
   All 4 issues described above lead to a multilevel structure in the dataset, with multiple standardized mean differences nested within some of the studies. Issues 1. and 2. also lead to correlated sampling errors.
}
\source{
   Knapp, F., Viechtbauer, W., Leonhart, R., Nitschke, K., & Kaller, C. P. (2017). Planning performance in schizophrenia patients: A meta-analysis of the influence of task difficulty and clinical and sociodemographic variables. \emph{Psychological Medicine}, \bold{47}(11), 2002--2016. \verb{https://doi.org/10.1017/S0033291717000459}
}
\author{
   Wolfgang Viechtbauer, \email{wvb@metafor-project.org}, \url{https://www.metafor-project.org}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.knapp2017
dat[-c(1:2)]

\dontrun{
### load metafor package
library(metafor)

### fit a standard random-effects model ignoring the issues described above
res <- rma(yi, vi, data=dat)
res

### fit a multilevel model with random effects for studies and comparisons within studies
### (but this ignored the correlation in the sampling errors)
res <- rma.mv(yi, vi, random = ~ 1 | study/comp, data=dat)
res

### create variable that indicates the task and difficulty combination as increasing integers
dat$task.diff <- unlist(lapply(split(dat, dat$study), function(x) {
   task.int <- as.integer(factor(x$task))
   diff.int <- as.integer(factor(x$difficulty))
   diff.int[is.na(diff.int)] <- 1
   paste0(task.int, ".", diff.int)}))

### construct correlation matrix for two tasks with four different difficulties where the
### correlation is 0.4 for different difficulties of the same task, 0.7 for the same
### difficulty of different tasks, and 0.28 for different difficulties of different tasks
R <- matrix(0.4, nrow=8, ncol=8)
R[5:8,1:4] <- R[1:4,5:8] <- 0.28
diag(R[1:4,5:8]) <- 0.7
diag(R[5:8,1:4]) <- 0.7
diag(R) <- 1
rownames(R) <- colnames(R) <- paste0(rep(1:2, each=4), ".", 1:4)
R

### construct an approximate V matrix accounting for the use of shared groups and
### for correlations among tasks/difficulties as specified in the R matrix above
V <- vcalc(vi, cluster=study, grp1=group1, grp2=group2, w1=n_sz, w2=n_hc,
           obs=task.diff, rho=R, data=dat)

### correlation matrix for study 3 with four patient groups and a single control group
round(cov2cor(V[dat$study == 3, dat$study == 3]), 2)

### correlation matrix for study 6 with two tasks with four difficulties
cov2cor(V[dat$study == 6, dat$study == 6])

### correlation matrix for study 24 with two independent groups
cov2cor(V[dat$study == 24, dat$study == 24])

### correlation matrix for study 29 with three independent groups
cov2cor(V[dat$study == 29, dat$study == 29])

### fit multilevel model as above, but now use this V matrix in the model
res <- rma.mv(yi, V, random = ~ 1 | study/comp, data=dat)
res
predict(res, digits=2)

### use cluster-robust inference methods based on this model
robust(res, cluster=study)

### use methods from the clubSandwich package
robust(res, cluster=study, clubSandwich=TRUE)

### examine if task difficulty is a potential moderator of the effect
res <- rma.mv(yi, V, mods = ~ difficulty, random = ~ 1 | study/comp, data=dat)
res
sav <- robust(res, cluster=study)
sav
sav <- robust(res, cluster=study, clubSandwich=TRUE)
sav

### draw bubble plot
regplot(sav, xlab="Task Difficulty", ylab="Standardized Mean Difference", las=1, digits=1, bty="l")
}
}
\keyword{datasets}
\concept{psychology}
\concept{standardized mean differences}
\concept{multilevel models}
\concept{multivariate models}
\concept{cluster-robust inference}
\concept{meta-regression}
\section{Concepts}{
   psychology, standardized mean differences, multilevel models, multivariate models, cluster-robust inference, meta-regression
}
