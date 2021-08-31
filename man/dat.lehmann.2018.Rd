\name{dat.lehmann.2018}
\docType{data}
\alias{dat.lehmann.2018}
\title{The Effect of Red on Perceived Attractiveness}
\description{Results from studies in which participants rated the attractiveness of photos that featured red or a control color.  See OSF project at https://osf.io/xy47p/}
\usage{
dat.lehmann.2018
}
\format{
The data frame contains the following columns:
\tabular{lll}{
{Short_Title}                 \tab    \code{character}    \tab  Shortened citation formatted Author name(s), year of publication - Experiment number. All cells in column are unique for use as labels in meta-analysis. \cr
{Full_Citation}               \tab    \code{character}    \tab  Lists full citation in APA format \cr
{Short_Citation}              \tab    \code{character}    \tab  Shortened citation of different format, exactly as it would appear in an in-text citation. \cr
{Year}                        \tab    \code{numeric}      \tab  Year study published (whether in journal or published online) \cr
{Study}                       \tab    \code{character}    \tab  Lists which experiment--if only one experiment presented in a paper, then 'Exp 1', otherwise numbered according to numbering within paper. \cr
{Peer_Reviewed}               \tab    \code{character}    \tab  Whether experiment was published in a peer-reviewed journal or not. 'Yes' = peer-reviewed journal, 'No' can mean in press, online publication, or other. Column for moderator analysis. \cr
{Source_Type}                 \tab    \code{character}    \tab  Lists location where experiment is available, including journal articles, conference proceedings, online-only, and other options--more specific than whether peer-reviewed or not. \cr
{Preregistered}               \tab    \code{character}    \tab  Whether experiment was pre-registered or not.  \cr
{Corresponding_Author_Email}  \tab    \code{character}    \tab  Lists email of corresponding author for each study. \cr
{Moderator_Group}             \tab    \code{character}    \tab  In some studies, a moderator was intentionally investigated that was meant to reduce the red-romance effect. Data for studies where the red-romance effect is expected to be moderated are marked 'Yes' in this column. All others are blank. \cr
{Gender}                      \tab    \code{character}    \tab  Gender of rater, male or female. In all cases, gender of stimuli will be opposite. \cr
{Color_Contrast}              \tab    \code{character}    \tab  This column lists the color used as the contrast against red. In some cases, not every contrast color was listed--we chose to examine only contrasts that were present in the original studies, when possible. This column contains only the contrasts we examined in this meta-analysis.  \cr
{Color_Form}                  \tab    \code{character}    \tab  Location of color in photo. Background = background or border color manipulated; Face = facial redness manipulated; Shirt, Dress, Item = color of specified object manipulated; Dot = a dot of color on shirt manipulated \cr
{Photo_Type}                  \tab    \code{character}    \tab  Amount of body visible in photo. Head Shot = head only; Bust = head, shoulders, sometimes torso; Full Body = entire body visible \cr
{DV_Type}                     \tab    \code{character}    \tab  Scale used for DV. 'Perceived attractiveness' = the perceived attractiveness scale used in the original studies; alternate scales are differentiated \cr
{DV_Items}                    \tab    \code{numeric}      \tab  Number of items in DV scale  \cr
{DV_Scale}                    \tab    \code{character}    \tab  Full length of DV scale, if clear. \cr
{DV_ScaleBottom}              \tab    \code{numeric}    \tab  Lower anchor of DV scale \cr
{DV_ScaleTop}                 \tab    \code{numeric}    \tab  Upper anchor of DV scale \cr
{Location}                    \tab    \code{character}    \tab  Country where study took place, if clear. 'Worldwide' in some cases of online participation without IP filtering of participants. \cr
{Continent}                   \tab    \code{character}    \tab  Lists continent where study took place, for the sake of creating larger categories for analysis. \cr
{Participants}                \tab    \code{character}    \tab  Basic notes about participants. Students = high school, undergraduate, or graduate students; online = participants were gathered online; adult = no other common identifying factor given. Put into fewer categories for ease of analysis. \cr
{Participant_Notes}           \tab    \code{character}    \tab  A finer grained description of participant characteristics. \cr
{Design}                      \tab    \code{character}    \tab  Whether study was between or within subjects design, also lists for studies which used forced choice as DV. \cr
{Eth_Majority}                \tab    \code{character}    \tab  Basic notes about participant ethnicity for ease of analysis. This represents the ethnic majority within the sample. \cr
{Eth_Majority_Detail}         \tab    \code{character}    \tab  A finer grained description of participant characteristics, including in some cases participant counts when the ethnic majority was close to another category. \cr
{Eth_Stim}                    \tab    \code{character}    \tab  Ethnicity of the people pictured in the stimulus materials. \cr
{Eth_Match}                   \tab    \code{character}    \tab  Notes whether the ethnic majority of the participant pool matched the ethnicity of stimulus photos.  \cr
{Red_Age}                     \tab    \code{numeric}      \tab  Mean age of participants in red group. If not given for specific group, then mean age overall. \cr
{Control_Age}                 \tab    \code{numeric}      \tab  Mean age of participants in control group. If not given for specific group, then mean age overall. \cr
{Color_Red}                   \tab    \code{character}    \tab  Specific values of red color, if given. 'No data' if not given or unclear. \cr
{Color_Control}               \tab    \code{character}    \tab  Specific values of control color, if given. 'No data' if not given or unclear. \cr
{Red_Original}                \tab    \code{character}    \tab  Notes whether the red color used in the study is within 5 units of the LCh values for red used in the original study. \cr
{Color_Match}                 \tab    \code{character}    \tab  Notes whether the control color used in the study is within 5 units of the red color on the L and C parameters. In cases where the control color used was white, it was not possible for the L and C parameters to match. \cr
{Presentation_Control}        \tab    \code{character}    \tab  Notes whether the color of the stimulus viewed by each participant was consistent, as in participants viewing everything on paper or the same computer, versus uncontrolled presentation of the stimulus, as in viewing stimulus on different computers. \cr
{Stimuli_Presentation}        \tab    \code{character}    \tab  Method that stimuli were presented. 'Paper' = stimuli printed on paper, shown in-person; 'Screen' = stimuli shown on-screen, not carefully controlled; 'Screen Control' = stimuli shown on-screen, but screen carefully color-matched \cr
{Red_N}                       \tab    \code{numeric}      \tab  Number of participants in red group. \cr
{Red_M}                       \tab    \code{numeric}      \tab  Mean rating of DV in red group. \cr
{Red_SD}                      \tab    \code{numeric}      \tab  Standard deviation of DV in red group. \cr
{Control_N}                   \tab    \code{numeric}      \tab  Number of participants in control group. \cr
{Control_M}                   \tab    \code{numeric}      \tab  Mean rating of DV in control group. \cr
{Control_SD}                  \tab    \code{numeric}      \tab  Standard deviation of DV in control group. \cr
{SD_diff}                     \tab    \code{numeric}      \tab  Calculated for within subject studies, standard deviation of difference scores \cr
{RM_r}                        \tab    \code{numeric}      \tab  Calculated for within subject studies, correlation between participant ratings of red and control attractiveness \cr
{Control_Attractiveness}      \tab    \code{numeric}      \tab  Attractiveness of stimuli in control condition, calculated as (Control_M - DV_ScaleBottom)/DV_ScaleTop, in order to compare attractiveness ratings across different scales \cr
{Notes}                       \tab    \code{character}    \tab  Any additional notes on study. \cr
{Total.SampleSize}            \tab    \code{numeric}      \tab  Total unique participants in the study. \cr
{pooled}                      \tab    \code{numeric}      \tab  Pooled standard deviation for within-subjects studies. \cr
{yi}                          \tab    \code{numeric}      \tab  Standardized mean difference. \cr
{vi}                          \tab    \code{numeric}      \tab  Corresponding sampling variance. \cr
}
}
\details{
This is data from a meta-analyses of studies that test the red-romance hypothesis, which is that the color red enhances heterosexual attraction in romantic contexts. Analyzing male participants only, the meta-analysis should show a small, statistically significant effect (d = 0.26 [0.12, 0.40], p = .0004, N = 2,961).  Analyzing female participants only should show a very small effect (d = 0.13 [0.01, 0.25], p = .03, N = 2,739).  The analyses in the published meta-analysis found clear evidence of upward bias in the estimate for female participants and equivocal evidence for male participants.  Moderator analyses suggest effect sizes may have declined over time (both genders), may be largest when an original shade of red is used (men only) and may be smaller in pre-registered studies (women only).
}
\source{
  Lehmann, G. K., Elliot, A. J., & Calin-jageman, R. J. (2018). Meta-Analysis of the Effect of Red on Perceived Attractiveness.  \emph{Evolutionary Psychology}, December, 1–27. \url{https://doi.org/10.1177/1474704918802412}. \url{https://osf.io/xy47p/}.
}
\author{
   Robert Calin-Jageman, \email{rcalinjageman@dom.edu}, \url{https://calin-jageman.net}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.lehmann2018
dat

\dontrun{

### load metafor package
require(metafor)

### meta-analyses for male and female participants
red_romance_malep <- dat[dat$Gender == "Males", ]
red_romance_femalep <- dat[dat$Gender == "Females", ]

res_malep <- rma(yi, vi, data=red_romance_malep, knha =TRUE)
res_malep
res_femalep <- rma(yi, vi, data=red_romance_femalep, knha=TRUE)
res_femalep

}
}
\keyword{datasets}
\concept{psychology}
\concept{attraction}
\concept{standardized mean differences}
