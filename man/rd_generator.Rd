\name{rd_generator}
\alias{rd_generator}
\title{Documentation generation function}
\description{Function to generate Rd document template.}
\usage{
rd_generator(dir = getwd(), overwrite = FALSE)
}
\arguments{
   \item{dir}{character string specifying the root directory of the source package (if unspecified, the current working directory is assumed to be the package root directory).}
   \item{overwrite}{boolean, specifying whether existing \code{.Rd} file(s) should be overwritten (if they already exist). The default is to never overwrite any existing \code{.Rd} files.}
}
\details{
   The function ...
}
\author{
Thomas E. White \email{thomas.white026@gmail.com}
}
\keyword{file}
\keyword{internal}