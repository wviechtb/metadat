\name{prep_dat}
\alias{prep_dat}
\title{Data preparation function}
\description{Function to run data processing scripts.}
\usage{
prep_dat(rebuild=FALSE, overwrite, pkgdir)
}
\arguments{
   \item{rebuild}{logical indicating whether the entire database should be rebuild (default is \code{FALSE}).}
   \item{overwrite}{character vector with one or more \code{.Rd} filenames to overwrite (if they already exist). The default is to never overwrite any existing \code{.Rd} files.}
   \item{pkgdir}{character string specifying the root directory of the source package (if unspecified, the current working directory is assumed to be the package root directory).}
}
\details{
   The function is only for used for processing new datasets for inclusion in the package. It should be used as described on the \pkg{\link{metadat-package}} help page.
}
\author{
   Wolfgang Viechtbauer \email{wvb@metafor-project.org}
}
\keyword{file}
\keyword{internal}
