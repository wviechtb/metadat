\name{dat.frank2008}
\docType{data}
\alias{dat.frank2008}
\title{Studies on the Association Between the CASP8 -652 6N del Promoter Polymorphism and Breast Cancer Risk}
\description{Results from 4 case-control studies examining the association between the CASP8 -652 6N del promoter polymorphism and breast cancer risk.}
\usage{
dat.frank2008
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study}      \tab \code{character} \tab study identifier \cr
\bold{bc.ins.ins} \tab \code{numeric}   \tab number of cases who have a homozygous insertion polymorphism \cr
\bold{bc.ins.del} \tab \code{numeric}   \tab number of cases who have a heterozygous insertion/deletion polymorphism \cr
\bold{bc.del.del} \tab \code{numeric}   \tab number of cases who have a homozygous deletion polymorphism \cr
\bold{ct.ins.ins} \tab \code{numeric}   \tab number of controls who have a homozygous insertion polymorphism \cr
\bold{ct.ins.del} \tab \code{numeric}   \tab number of controls who are heterozygous insertion/deletion polymorphism \cr
\bold{ct.del.del} \tab \code{numeric}   \tab number of controls who have a homozygous deletion polymorphism
}
}
\details{
   The 4 studies included in this dataset are case-control studies that have examined the association between the CASP8 -652 6N del promoter polymorphism and breast cancer risk. Breast cancer cases and controls were genotyped and either had a homozygous insertion, a heterozygous insertion/deletion, or a homozygous deletion polymorphism.

   Ziegler et al. (2011) used the same dataset to illustrate the use of meta-analytic methods to examine deviations from Hardy-Weinberg equilibrium across multiple studies. The relative excess heterozygosity (REH) is the proposed measure for such a meta-analysis, which can be computed by setting \code{measure="REH"}.

}
\source{
   Frank, B., Rigas, S. H., Bermejo, J. L., Wiestler, M., Wagner, K., Hemminki, K., Reed, M. W., Sutter, C., Wappenschmidt, B., Balasubramanian, S. P., Meindl, A., Kiechle, M., Bugert, P., Schmutzler, R. K., Bartram, C. R., Justenhoven, C., Ko, Y.-D., Brüning, T., Brauch, H., Hamann, U., Pharoah, P. P. D., Dunning, A. M., Pooley, K. A., Easton, D. F., Cox, A. & Burwinkel, B. (2008). The CASP8 -652 6N del promoter polymorphism and breast cancer risk: A multicenter study. \emph{Breast Cancer Research and Treatment}, \bold{111}(1), 139--144. \verb{https://doi.org/10.1007/s10549-007-9752-z}
}
\references{
   Ziegler, A., Steen, K. V. & Wellek, S. (2011). Investigating Hardy-Weinberg equilibrium in case-control or cohort studies or meta-analysis. \emph{Breast Cancer Research and Treatment}, \bold{128}(1), 197--201. \verb{https://doi.org/10.1007/s10549-010-1295-z}
}
\author{
   Wolfgang Viechtbauer, \email{wvb@metafor-project.org}, \url{https://www.metafor-project.org}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.frank2008
dat

\dontrun{
### load metafor package
library(metafor)

### calculate log odds ratios comparing ins/del versus ins/ins
dat <- escalc(measure="OR", ai=bc.ins.del, bi=bc.ins.ins,
                            ci=ct.ins.del, di=ct.ins.ins, data=dat)

### fit random-effects model and get the pooled odds ratio (with 95\% CI)
res <- rma(yi, vi, data=dat)
res
predict(res, transf=exp, digits=2)

### calculate log odds ratios comparing del/del versus ins/ins
dat <- escalc(measure="OR", ai=bc.del.del, bi=bc.ins.ins,
                            ci=ct.del.del, di=ct.ins.ins, data=dat)

### fit random-effects model and get the pooled odds ratio (with 95\% CI)
res <- rma(yi, vi, data=dat)
res
predict(res, transf=exp, digits=2)

### calculate log odds ratios comparing ins/del+del/del versus ins/ins
dat <- escalc(measure="OR", ai=bc.ins.del+bc.del.del, bi=bc.ins.ins,
                            ci=ct.ins.del+ct.del.del, di=ct.ins.ins, data=dat)

### fit random-effects model and get the pooled odds ratio (with 95\% CI)
res <- rma(yi, vi, data=dat)
res
predict(res, transf=exp, digits=2)

############################################################################

### compute the relative excess heterozygosity in the controls
dat <- escalc(measure="REH", ai=ct.ins.ins, bi=ct.ins.del, ci=ct.del.del,
              slab=study, data=dat)

### fit random-effects model and get the pooled REH value (with 90\% CI)
res <- rma(yi, vi, data=dat, level=90)
res
predict(res, transf=exp, digits=2)

### draw forest plot
forest(res, atransf=exp, xlim=c(-1.4,1.4), at=log(c(0.5,5/7,1,7/5,2)))
segments(log(5/7), -2, log(5/7), res$k+1, lty="dotted")
segments(log(7/5), -2, log(7/5), res$k+1, lty="dotted")
}
}
\keyword{datasets}
\concept{medicine}
\concept{oncology}
\concept{genetics}
\concept{odds ratios}
\section{Concepts}{
   medicine, oncology, genetics, odds ratios
}
