\name{dat.sorokowski2019}
\docType{data}
\alias{dat.sorokowski2019}
\alias{dat.sorokowski2019.1}
\alias{dat.sorokowski2019.2}
\title{Sex differences in human olfaction: A meta-analysis.}
\description{Sex Differences in human olfaction including discrimination, threshold, and identification.}
\usage{dat.sorokowski2019}
\format{
The data frame dat.sorokowski2019.1 contains data for olfactory discrimination and the data frame dat.sorokowski2019.2 contains data for olfactory identification. Both consists of the following columns:
\tabular{lll}{
\bold{ID}        \tab \code{numeric}   \tab Study ID number \cr
\bold{Author}     \tab \code{character} \tab Author or authors of the paper \cr
\bold{Year}        \tab \code{numeric}   \tab Year of publication \cr
\bold{Paper Title}        \tab \code{character}   \tab Title of paper \cr
\bold{Country}        \tab \code{character}   \tab Country where study was conducted \cr
\bold{Nwomen}        \tab \code{numeric}   \tab Number of women \cr
\bold{Nmen}        \tab \code{numeric}   \tab Number of men \cr
\bold{meanWomen}        \tab \code{numeric}   \tab Mean score for women \cr
\bold{sdWomen}        \tab \code{numeric}   \tab Standard deviation for women \cr
\bold{ageMeanWomen}        \tab \code{numeric}   \tab Mean age for women \cr
\bold{ageSDWomen}        \tab \code{numeric}   \tab Standard deviation of age for women \cr
\bold{meanMen}        \tab \code{numeric}   \tab Mean score for men \cr
\bold{sdMen}        \tab \code{numeric}   \tab Standard deviation for men \cr
\bold{ageMeanMen}        \tab \code{numeric}   \tab Mean age for men \cr
\bold{ageSDMen}        \tab \code{numeric}   \tab Standard deviation of age for men \cr
}
}
\details{
   The three datasets included in this entry are used to determine differences in human olfaction based on sex including identification, discrimination, and threshold. 
   
   Data and Jamovi analysis files can be found here https://osf.io/6tfuy.
}
\source{
Sorokowska, A. (2019, January 8). Sex differences in human olfaction: a meta-analysis. Retrieved from \url{osf.io/6tfuy}
}
\references{
  Sorokowski, P., Karwowski, M., Misiak, M., Marczak, M. K., Dziekan, M., Hummel, T., & Sorokowska, A. (2019). Sex differences in human olfaction: A meta-analysis. \emph{Frontiers in Psychology}, 10, 242. \url{https://doi.org/10.3389/fpsyg.2019.00242}
}
\author{
   W. Kyle Hamilton \email{whamilton@ucmerced.edu} \url{https://www.kylehamilton.com}
}
\examples{
  if (require(metafor)) {
    ### Recreating Sorokowski et al. (2019). Sex differences in human olfaction: A meta-analysis. 
    ### Frontiers in Psychology, 10, 242.
    
    ### copy olfactory discrimination data into 'dat' and examine data
    dat1 <- dat.sorokowski2019.1
    dat1
    
    ### calculate standardized mean differences and corresponding sampling variances
    dat1 <-
      escalc(
        measure = "SMD",
        m1i = meanWomen ,
        sd1i = sdWoman,
        n1i = Nwomen,
        m2i = meanMen,
        sd2i = sdMen,
        n2i = Nmen,
        data = dat1
      )
    
    ### meta-analysis of mean differences using the 
    ### restricted maximum-likelihood estimator and a random-effects model
    res1 <- rma(yi, vi, method = "REML", data = dat1)
    res1
    
    ### copy olfactory identification  data into 'dat' and examine data
    dat2 <- dat.sorokowski2019.2
    dat2
    
    ### calculate standardized mean differences and corresponding sampling variances
    dat2 <-
      escalc(
        measure = "SMD",
        m1i = meanWomen ,
        sd1i = sdWoman,
        n1i = Nwomen,
        m2i = meanMen,
        sd2i = sdMen,
        n2i = Nmen,
        data = dat2
      )
    
    ### meta-analysis of mean differences using the 
    ### restricted maximum-likelihood estimator and a random-effects model
    res2 <- rma(yi, vi, method = "REML", data = dat2)
    res2
  }
  }
\keyword{datasets}
\concept{psychology}
\concept{standardized mean difference}