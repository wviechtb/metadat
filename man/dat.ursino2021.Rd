\name{dat.ursino2021}
\docType{data}
\alias{dat.ursino2021}
\title{Sorafenib Toxicity Dataset}
\description{13 studies investigating the occurrence of dose limiting toxicities (DLTs) at different doses of Sorafenib.}
\usage{
dat.ursino2021
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study}  \tab \code{character} \tab study label \cr
\bold{year}   \tab \code{integer}   \tab publication year \cr
\bold{dose}   \tab \code{numeric}   \tab dose (\eqn{\mathrm{mg}}) \cr
\bold{events} \tab \code{integer}   \tab number of DLTs \cr
\bold{total}  \tab \code{integer}   \tab number of patients exposed \cr
}
}
\details{
   Sorafenib (BAY 43-9006, Nexavar) is a kinase inhibitor that is used in the treatment of advanced renal cell carcinoma, hepatocellular carcinoma, and radioactive iodine resistant advanced thyroid carcinoma. Thirteen trials with published results, described in eleven manuscripts, were identified in a literature search. This dataset contains the doses investigated, the numbers of patients treated, and the number of dose-limiting toxicities (DLTs) observed. In general, each study investigated several doses according to some dose-escalation scheme.
}
\source{
   Ursino, M., Roever, C., Zohar,  S., & Friede T. (2021). Random-effects meta-analysis of phase I dose-finding studies using stochastic process priors. \emph{The Annals of Applied Statistics}, \bold{15}(1), 174--193. \verb{https://doi.org/10.1214/20-AOAS1390}

   Roever, C., Ursino, M., Friede, T., & Zohar, S. (2022). A straighforward meta-analysis approach for oncology phase I dose-finding studies. \emph{Statistics in Medicine}, \bold{41}(20), 3915--3940. \verb{https://doi.org/10.1002/sim.9484}
}
\references{
   European Medicines Agency (EMA) (2022). Nexavar (sorafenib) EPAR summary. \verb{https://www.ema.europa.eu/en/medicines/human/EPAR/nexavar}

   Awada, A., Hendlisz, A., Gil, T., \emph{et al.} (2005). Phase I safety and pharmacokinetics of BAY 43-9006 administered for 21 days on / 7 days off in patients with advanced, refractory solid tumours. \emph{British Journal of Cancer}, \bold{92}(10), 1855. \verb{https://doi.org/10.1038/sj.bjc.6602584}

   Clark, J. W., Eder, J. P., Ryan, D., Lathia, C., & Lenz, H.-J. (2005). Safety and pharmacokinetics of the dual action Raf kinase and vascular endothelial growth factor receptor inhibitor, BAY 43-9006, in patients with advanced, refractory solid tumors. \emph{Clinical Cancer Research}, \bold{11}(15), 5472--5480. \verb{https://doi.org/10.1158/1078-0432.CCR-04-2658}

   Moore, M., Hirte, H. W., Siu, L., \emph{et al.} (2005). Phase I study to determine the safety and pharmacokinetics of the novel Raf kinase and VEGFR inhibitor BAY 43-9006, administered for 28 days on / 7 days off in patients with advanced, refractory solid tumors. \emph{Annals of Oncology}, \bold{16}(10), 1688--1694. \verb{https://doi.org/10.1093/annonc/mdi310}

   Strumberg, D., Richly, H., Hilger, R. A., \emph{et al.} (2005). Phase I clinical and pharmacokinetic study of the novel Raf kinase and vascular endothelial growth factor receptor inhibitor BAY 43-9006 in patients with advanced refractory solid tumors. \emph{Journal of Clinical Oncology}, \bold{23}(5), 965--972. \verb{https://doi.org/10.1200/JCO.2005.06.124}

   Furuse, J., Ishii, H., Nakachi, K., Suzuki, E., Shimizu, S., & Nakajima, K. (2008). Phase I study of sorafenib in Japanese patients with hepatocellular carcinoma. \emph{Cancer Science}, \bold{99}(1), 159--165. \verb{https://doi.org/10.1111/j.1349-7006.2007.00648.x}

   Minami, H., Kawada, K., Ebi, H., \emph{et al.} (2008). Phase I and pharmacokinetic study of sorafenib, an oral multikinase inhibitor, in Japanese patients with advanced refractory solid tumors. \emph{Cancer Science}, \bold{99}(7), 1492--1498. \verb{https://doi.org/10.1111/j.1349-7006.2008.00837.x}

   Miller, A. A., Murry, D. J., Owzar, K., \emph{et al.} (2009). Phase I and pharmacokinetic study of sorafenib in patients with hepatic or renal dysfunction: CALGB 60301. \emph{Journal of Clinical Oncology}, \bold{27}(11), 1800. \verb{https://doi.org/10.1200/JCO.2008.20.0931}

   Crump, M., Hedley, D., Kamel-Reid, S., \emph{et al.} (2010). A randomized phase I clinical and biologic study of two schedules of sorafenib in patients with myelodysplastic syndrome or acute myeloid leukemia: A NCIC (National Cancer Institute of Canada) Clinical Trials Group Study. \emph{Leukemia and Lymphoma}, \bold{51}(2), 252--260. \verb{https://doi.org/10.3109/10428190903585286}

   Borthakur, G., Kantarjian, H., Ravandi, F., \emph{et al.} (2011). Phase I study of sorafenib in patients with refractory or relapsed acute Leukemias. \emph{Haematologica}, \bold{96}(1), 62--68. \verb{https://doi.org/10.3324/haematol.2010.030452}

   Nabors, L. B., Supko, J. G., Rosenfeld, M., \emph{et al.} (2011). Phase I trial of sorafenib in patients with recurrent or progressive malignant glioma. \emph{Neuro-Oncology}, \bold{13}(12), 1324--1330. \verb{https://doi.org/10.1093/neuonc/nor145}

   Chen, Y.-B., Li, S., Lane, A. A., \emph{et al.} (2014). Phase I trial of maintenance sorafenib after allogeneic hematopoietic stem cell transplantation for FMS-like tyrosine kinase 3 internal tandem duplication acute myeloid leukemia. \emph{Biology of Blood and Marrow Transplantation}, \bold{20}(12), 2042--2048. \verb{https://doi.org/10.1016/j.bbmt.2014.09.007}
}
\seealso{
   \code{\link{dat.roever2022}}
}
\author{
   Christian Roever, \email{christian.roever@med.uni-goettingen.de}
}
\examples{
# show (some) data
head(dat.ursino2021, n=15)

\dontrun{
# illustrate data
plot(NA, xlim=range(dat.ursino2021$dose), ylim=0:1,
     xlab="dose (mg)", ylab="proportion",
     main="dat.ursino2021 (Sorafenib data)")
studylab <- unique(dat.ursino2021$study)
colvec <- rainbow(length(studylab))
for (i in 1:length(studylab)) {
  idx <- (dat.ursino2021$study == studylab[i])
  lines(dat.ursino2021[idx,"dose"],
        dat.ursino2021[idx,"events"] / dat.ursino2021[idx,"total"],
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
