\name{dat.roever2022}
\docType{data}
\alias{dat.roever2022}
\title{Irinotecan / S-1 Toxicity Dataset}
\description{12 studies investigating the occurrence of dose limiting toxicities (DLTs) at different doses of a combination therapy of Irinotecan and S-1.}
\usage{
dat.roever2022
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study}  \tab \code{character} \tab study label \cr
\bold{year}   \tab \code{integer}   \tab publication year \cr
\bold{dose}   \tab \code{numeric}   \tab dose (\eqn{\mathrm{mg} / \mathrm{m}^2}) \cr
\bold{events} \tab \code{integer}   \tab number of DLTs \cr
\bold{total}  \tab \code{integer}   \tab number of patients exposed \cr
}
}
\details{
   A combination therapy of Irinotecan (a topoisomerase 1 inhibitor) and S-1 (a combination of three pharmacological compounds, namely, tegafur, gimeracil, and oteracil potassium) was tested in advanced colorectal and gastric cancer. This dataset contains data from twelve studies investigating this therapy in a Japanese population; it contains the doses investigated, the numbers of patients treated, and the number of dose-limiting toxicities (DLTs) observed. In general, each study investigated several doses according to some dose-escalation scheme.
}
\source{
   Ursino, M., Roever, C., Zohar,  S., & Friede T. (2021). Random-effects meta-analysis of phase I dose-finding studies using stochastic process priors. \emph{The Annals of Applied Statistics}, \bold{15}(1), 174--193. \verb{https://doi.org/10.1214/20-AOAS1390}

   Roever, C., Ursino, M., Friede, T., & Zohar, S. (2022). A straighforward meta-analysis approach for oncology phase I dose-finding studies. \emph{Statistics in Medicine}, \bold{41}(20), 3915--3940. \verb{https://doi.org/10.1002/sim.9484}
}
\references{
   European Medicines Agency (EMA) (2021). Onivyde pegylated liposomal (irinotecan hydrochloride trihydrate) EPAR summary. \verb{https://www.ema.europa.eu/en/medicines/human/EPAR/onivyde-pegylated-liposomal}

   European Medicines Agency (EMA) (2022). Teysuno (tegafur/gimeracil/oteracil) EPAR summary. \verb{https://www.ema.europa.eu/en/medicines/human/EPAR/teysuno}

   Yamada, Y., Yasui, H., Goto, A., \emph{et al.} (2003). Phase I study of irinotecan and S-1 combination therapy in patients with metastatic gastric cancer. \emph{International Journal of Clinical Oncology}, \bold{8}(6), 374--380. \verb{https://doi.org/10.1007/s10147-003-0359-z}

   Takiuchi, H., Narahara, H., Tsujinaka, T., \emph{et al.} (2005). Phase I study of S-1 combined with irinotecan (CPT-11) in patients with advanced gastric cancer (OGSG 0002). \emph{Japanese Journal of Clinical Oncology}, \bold{35}(9), 520--525. \verb{https://doi.org/10.1093/jjco/hyi148}

   Inokuchi, M., Yamashita, T., Yamada, H., \emph{et al.} (2006). Phase I/II study of S-1 combined with irinotecan for metastatic advanced gastric cancer. \emph{British Journal of Cancer}, \bold{94}(8), 11130. \verb{https://doi.org/10.1038/sj.bjc.6603072}

   Nakafusa, Y., Tanaka, M., Ohtsuka, T., \emph{et al.} (2008). Phase I/II study of combination therapy with S-1 and CPT-11 for metastatic colorectal cancer. \emph{Molecular Medicine Reports}, \bold{1}(6), 925--930. \verb{https://doi.org/10.3892/mmr_00000051}

   Ishimoto, O., Ishida, T., Honda, Y., Munakata, M., & Sugawara, S. (2009). Phase I study of daily S-1 combined with weekly irinotecan in patients with advanced non-small cell lung cancer. \emph{International Journal of Clinical Oncology}, \bold{14}(1), 43--47. \verb{https://doi.org/10.1007/s10147-008-0796-9}

   Ogata, Y., Sasatomi, T., Akagi, Y., Ishibashi, N., Mori, S., & Shirouzu, K. (2009). Dosage escalation study of S-1 and irinotecan in metronomic chemotherapy against advanced colorectal cancer. \emph{The Kurume Medical Journal}, \bold{56}(1+2), 1--7. \verb{https://doi.org/10.2739/kurumemedj.56.1}

   Shiozawa, M., Sugano, N., Tsuchida, K., Morinaga, S., Akaike, M., & Sugimasa, Y. (2009). A phase I study of combination therapy with S-1 and irinotecan (CPT-11) in patients with advanced colorectal cancer. \emph{Journal of Cancer Research and Clinical Oncology}, \bold{135}(3), 365--370. \verb{https://doi.org/10.1007/s00432-008-0480-5}

   Yoshioka, T., Kato, S., Gamoh, M., \emph{et al.} (2009). Phase I/II study of sequential therapy with irinotecan and S-1 for metastatic colorectal cancer. \emph{British Journal of Cancer}, \bold{101}, 1972--1977. \verb{https://doi.org/10.1038/sj.bjc.6605432}

   Komatsu, Y., Yuki, S., Fuse, N., \emph{et al.} (2010). Phase 1/2 clinical study of irinotecan and oral S-1 (IRIS) in patients with advanced gastric cancer. \emph{Advances in Therapy}, \bold{27}(7), 483--492. \verb{https://doi.org/10.1007/s12325-010-0037-2}

   Kusaba, H., Esaki, T., Futami, K., \emph{et al.} (2010). Phase I/II study of a 3-week cycle of irinotecan and S-1 in patients with advanced colorectal cancer. \emph{Cancer Science}, \bold{101}(12), 2591--2595. \verb{https://doi.org/10.1111/j.1349-7006.2010.01728.x}

   Yoda, S., Soejima, K., Yasuda, H., \emph{et al.} (2011). A phase I study of S-1 and irinotecan combination therapy in previously treated advanced non-small cell lung cancer patients. \emph{Cancer Chemotherapy and Pharmacology}, \bold{67}(3), 717--722. \verb{https://doi.org/10.1007/s00280-010-1539-y}

   Goya, H., Kuraishi, H., Koyama, S., \emph{et al.} (2012). Phase I/II study of S-1 combined with biweekly irinotecan chemotherapy in previously treated advanced non-small cell lung cancer. \emph{Cancer Chemotherapy and Pharmacology}, \bold{70}(5), 691--697. \verb{https://doi.org/10.1007/s00280-012-1957-0}
}
\seealso{
   \code{\link{dat.ursino2021}}
}
\author{
   Christian Roever, \email{christian.roever@med.uni-goettingen.de}
}
\examples{
# show (some) data
head(dat.roever2022, n=10)

\dontrun{
# illustrate data
plot(NA, xlim=range(dat.roever2022$dose), ylim=0:1,
     xlab="dose (mg / m²)", ylab="proportion",
     main="dat.roever2022 (Irinotecan / S-1 data)")
studylab <- unique(dat.roever2022$study)
colvec <- rainbow(length(studylab))
for (i in 1:length(studylab)) {
  idx <- (dat.roever2022$study == studylab[i])
  lines(dat.roever2022[idx,"dose"],
        dat.roever2022[idx,"events"] / dat.roever2022[idx,"total"],
        col=colvec[i], type="b")
}
legend("topleft", studylab, col=colvec, pch=15)
}
}
\keyword{datasets}
\concept{medicine}
\concept{oncology}
\concept{dose-response models}
\section{Concepts}{
   medicine, oncology, dose-response models
}
