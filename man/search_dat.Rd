\name{search_dat}
\alias{search_dat}
\title{Search function for the datasets}
\description{Function to search among the existing datasets.}
\usage{
search_dat(pattern, fields = "concept")
}
\arguments{
   \item{pattern}{Character string specifying the search pattern to search for within the datasets using fuzzy matching.}
   \item{fields}{Character string or vector specifying the field(s) to search (i.e., \code{"title"}, \code{"alias"}, \code{"concept"}, \code{"name"}, and/or \code{"keyword"}). The default is to search the \code{"concept"} field.}
}
\details{
   The function can be used to search all existing datasets based on data descriptor fields of interest (e.g., name, title, concept). If one or multiple datasets are found, it prompts the user to choose one of the matching datasets of interest and the corresponding help file is then shown.

   Each dataset is tagged with one or multiple concept terms that refer to various aspects of a dataset, such as the field of research, the outcome measure used for the analysis, the model(s)/package(s) used for analyzing the data, and the methods/concepts that can be illustrated with the dataset.

   \itemize{
      \item In terms of \sQuote{fields}, the following tags have been used one or multiple times: cardiology, climate change, criminology, dentistry, ecology, education, epidemiology, evolution, medicine, oncology, primary care, psychiatry, psychology, sociology.
      \item In terms of \sQuote{outcome measures}, the following tags have been used one or multiple times: correlation coefficients, Cronbach's alpha, hazard ratios, incidence rates, mean differences, means, odds ratios, proportions, ratios of means, risk differences, risk ratios, standardized mean change, standardized mean differences.
      \item In terms of \sQuote{methods/concepts}, the following tags have been used one or multiple times: cumulative meta-analysis, dianostic accuracy studies, dose response models, generalized linear models, longitudinal models, Mantel-Haenszel method, multilevel models, multivariate models, network meta-analysis, Peto's method, phylogeny, publication bias, reliability generalization, single-arm studies, spatial correlation.
   }
}
\author{
   Daniel Noble \email{daniel.noble@anu.edu.au}
}
\keyword{file}
