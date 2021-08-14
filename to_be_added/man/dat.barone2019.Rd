\name{dat.barone2019}
\docType{data}
\alias{dat.barone2019}
\title{Studies on Spontaneous-Response False Belief Tasks in Infants}
\description{Results from studies which use spontaneous-response false belief tasks in infants up to 2 years old.}
\usage{dat.barone2019}
\format{The data frame contains the following columns:
\tabular{lll}{
\bold{id}      \tab \code{character}    \tab study identifier \cr
\bold{Author}      \tab \code{character}    \tab author names \cr
\bold{Year}      \tab \code{integer}    \tab year published \cr
\bold{Paradigm}      \tab \code{character}    \tab Experimental paradigm used in the study (VOE = violation of expectation; AL = anticipatory looking; interactive = Interactive design)  \cr
\bold{Measure}      \tab \code{character}    \tab Measure used in the study (VOE = violation of expectation; AL = anticipatory looking; Pointing = Pointing behavior; Help = Correct helping)  \cr
\bold{Age_months}      \tab \code{numeric}    \tab Average age in months \cr
\bold{n}      \tab \code{integer}    \tab Sample size \cr
\bold{Dropped_participants}      \tab \code{integer}    \tab  Number of participants excluded from each condition \cr
\bold{Dropped_participants_corrected}      \tab \code{integer}    \tab Number of participants excluded from each condition corrected \cr
\bold{Familiarization}      \tab \code{integer}    \tab Number of familiarization trials performed in each condition (0 = warm-up trials instead of familiarization trials) \cr
\bold{Belief}        \tab \code{character}  \tab Type of belief attributed to the agent  (L = Object location; NP = Non-obvious property of an object; I = Identity of an object; C = Expected or unexpected contents)\cr
\bold{Agent}        \tab \code{character}  \tab Agent used in study  (real present person; videotaped person; virtual agent)\cr
\bold{Target_object_Presence}        \tab \code{character}  \tab Real presence of the target object: whether, at the test trial, the target object was real and present or absent (real, present = real and present; absent = absent)\cr
\bold{Object_movements}      \tab \code{integer}    \tab  Number of displacements of the object that the agent did not see before the object arrived at its final position \cr
\bold{Motive_transformation}      \tab \code{character}    \tab Capturing whether the key transformation was done to trick the agent or for some other reason (trick = Explicity trick the agent; other reason = Some other reason including no explicit reason at all)\cr
\bold{Salience_of_agents_MS}      \tab \code{character}    \tab Salience of the agent’s mental state (absence = the false belief state had to be tracked from the agent’s absence during the key events; back turned = the false belief state had to be tracked due to the agent’s back turned during the key transformation; first-person experience = the false belief experience was demonstrated initially on the children themselves; blindfold = the agent used a blindfold during the transformation)\cr
\bold{Interaction}      \tab \code{character}    \tab Interaction between the child and the agent during the test or not (yes = yes; no = no)\cr
\bold{Design}      \tab \code{character}    \tab Study design employed in each condition (BS = between-subjects design; WS = within-subjects design)\cr
\bold{Test_trials}      \tab \code{integer}    \tab Number of test trials that were conducted with each child \cr
\bold{logit.p.}      \tab \code{numeric}    \tab  Logit transformed proportion (log odds)  \cr
\bold{vlogit.p.}      \tab \code{numeric}    \tab Sampling variance \cr
\bold{sei}      \tab \code{numeric}    \tab Standard error
}
}
\details{
   The dataset includes fifty-six effect sizes from studies which use spontaneous-response false belief tasks in infants up to 2 years old. Belief conditions using violation-of-expectation, anticipatory looking and interactive paradigms were included in this dataset, including 1469 infants. The data in this dataset were obtained from the authors reposatory on the Open Science Framework https://osf.io/re8uj/?view_only=d2605771dd664831a104318db9ff7aa9
}
\source{
   Barone, P., Corradi, G., & Gomila, A. (2019, July 26). Infants’ performance in spontaneous-response false belief tasks: a review and meta-analysis. Retrieved from \verb{osf.io/re8uj}
}
\references{
   Barone, P., Corradi, G., & Gomila, A. (2019). Infants’ performance in spontaneous-response false belief tasks: A review and meta-analysis. \emph{Infant Behavior and Development}, \bold{57}, 101350. \verb{https://doi.org/10.1016/j.infbeh.2019.101350}
}
\author{
   W. Kyle Hamilton \email{whamilton@ucmerced.edu} \url{https://kylehamilton.com}
}
\examples{
library(metafor)
# This code example is a very slightly modified version of the one provided by the authors
# which can be found here https://osf.io/s5ajt/?view_only=d2605771dd664831a104318db9ff7aa9

## Make copy of dataset
dat <- dat.barone2019


dat$Familiarization <- as.factor(dat$Familiarization)
dat$Test_trials <- as.factor(dat$Test_trials)
dat$Object_movements <- as.factor(dat$Object_movements)
dat$Belief <- as.factor(dat$Belief)

# First model
res <-
  rma(
    yi = logit.p.,
    sei = sei,
    data = dat,
    slab = paste(Author, Year)
  )
res

# Funnel plot
# Note the nonsymmetrical distribution in this funnel plot
# this is an example of publication bias.
funnel(res, main = "Standard Error")

# Forest plot (grouped by paradigm)
par(mar = c(4, 4, 1, 2))
dat$Paradigm[order(dat$Paradigm)]
rows = c(5:19, 23:44, 48:66)
length(rows)
table(dat$Paradigm)
### set up forest plot (with 2x2 table counts added; rows argument is used
### to specify exactly in which rows the outcomes will be plotted)
forest(
  res,
  xlim = c(-11, 10),
  ylim = c(-1, 70),
  order = order(dat$Paradigm),
  rows = rows,
  xlab = "",
  mlab = ""
)

### add text with Q-value, dfs, p-value, and I^2 statistic
text(-11,-1, pos = 4, cex = 0.75, bquote(
  paste(
    "RE Model for All Studies (Q = ",
    .(formatC(
      res$QE, digits = 2, format = "f"
    )),
    ", df = ",
    .(res$k - res$p),
    ", p = ",
    .(formatC(
      res$QEp, digits = 2, format = "f"
    )),
    "; ",
    I ^ 2,
    " = ",
    .(formatC(
      res$I2, digits = 1, format = "f"
    )),
    "\%)"
  )
))

### set font expansion factor (as in forest() above) and use bold italic
### font and save original settings in object 'op'
op <- par(cex = 0.75, font = 4)

### add text for the subgroups
text(-11, c(16, 41, 63) + 4, pos = 4, c("AL",
                                        "Interactive",
                                        "VOE"))

### switch to bold font
par(font = 2)

### set par back to the original settings
par(op)

### fit random-effects model in the three subgroups
res.AL <-
  rma(
    yi = logit.p.,
    sei = sei ,
    data = dat[dat$Paradigm == "AL", ],
    slab = paste(Author, Year),
    method = "REML"
  )
res.AL
res.inter <-
  rma(
    yi = logit.p.,
    sei = sei,
    data = dat[dat$Paradigm == "Interactive", ],
    slab = paste(Author, Year),
    method = "REML"
  )
res.inter
res.VOE <-
  rma(
    yi = logit.p.,
    sei = sei,
    data = dat[dat$Paradigm == "VOE", ],
    slab = paste(Author, Year),
    method = "REML"
  )
res.VOE
### add summary polygons for the three subgroups
addpoly(res.AL,
        row = 2.5,
        cex = 0.75,
        mlab = "")
addpoly(res.inter,
        row = 21.5,
        cex = 0.75,
        mlab = "")
addpoly(res.VOE,
        row = 46.5,
        cex = 0.75,
        mlab = "")

### add text with Q-value, dfs, p-value, and I^2 statistic for subgroups
text(-11, 2.5, pos = 4, cex = 0.75, bquote(
  paste(
    "RE Model for Subgroup (Q = ",
    .(formatC(
      res.AL$QE, digits = 2, format = "f"
    )),
    ", df = ",
    .(res.AL$k - res.AL$p),
    ", p = ",
    .(formatC(
      res.AL$QEp, digits = 2, format = "f"
    )),
    "; ",
    I ^ 2,
    " = ",
    .(formatC(
      res.AL$I2, digits = 1, format = "f"
    )),
    "\%)"
  )
))
text(-11, 21.5, pos = 4, cex = 0.75, bquote(
  paste(
    "RE Model for Subgroup (Q = ",
    .(formatC(
      res.inter$QE, digits = 2, format = "f"
    )),
    ", df = ",
    .(res.inter$k - res.inter$p),
    ", p = ",
    .(formatC(
      res.inter$QEp, digits = 2, format = "f"
    )),
    "; ",
    I ^ 2,
    " = ",
    .(formatC(
      res.inter$I2, digits = 1, format = "f"
    )),
    "\%)"
  )
))
text(-11, 46.5, pos = 4, cex = 0.75, bquote(
  paste(
    "RE Model for Subgroup (Q = ",
    .(formatC(
      res.VOE$QE, digits = 2, format = "f"
    )),
    ", df = ",
    .(res.VOE$k - res.VOE$p),
    ", p = ",
    .(formatC(
      res.VOE$QEp, digits = 2, format = "f"
    )),
    "; ",
    I ^ 2,
    " = ",
    .(formatC(
      res.VOE$I2, digits = 1, format = "f"
    )),
    "\%)"
  )
))



}
\keyword{datasets}
\concept{psychology}
\concept{infants}
