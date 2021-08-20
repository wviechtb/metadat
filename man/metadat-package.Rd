\name{metadat-package}
\alias{metadat-package}
\alias{metadat}
\docType{package}
\title{Meta-Analysis Datasets for R}
\description{
   The \pkg{metadat} package contains a large collection of meta-analysis datasets. These datasets are useful for teaching purposes, illustrating/testing meta-analytic methods, and validating published analyses.
}
\section{Browsing and Searching for Datasets}{
   A listing of all datasets in the package can be obtained with \code{help(package=metadat)}. Each datasets is also tagged with one or multiple concept terms. These concept terms refer to various aspects of a dataset, such as the field/topic of research, the outcome measure used for the analysis, the model(s) used for analyzing the data, and the methods/concepts that can be illustrated with the dataset. The \code{\link{datsearch}} function can be used to search among the existing datasets in the package based on their concept terms or based on a full-text search of their corresponding help files.

   You can also read the documentation online at \url{https://wviechtb.github.io/metadat/index.html} (where the output from the example analyses corresponding to each dataset is provided).
}
\section{Contributing New Datasets}{
   We welcome contributions of new datasets to the package. For each dataset, there must be a citable reference, ideally in a peer-reviewed journal or publication. The general workflow for contributing a new dataset is as follows:

   \itemize{
   \item Install the \code{metadat} package in R in the usual manner (i.e., \code{install.packages("metadat")}).
   \item If you are familiar with Git/GitHub and making pull requests, fork the \href{https://github.com/wviechtb/metadat}{package repository}. Otherwise, \href{https://github.com/wviechtb/metadat/archive/master.zip}{download} the source version of the package from GitHub and unzip the file to some directory on your computer.
   \item Place the raw data (in a non-binary format) in the \code{data-raw} directory. The file should be named \code{dat.<author><year>.<ext>}, where \code{<author>} is the last name of the first author of the publication from which the data come, \code{<year>} is the publication year, and \code{<ext>} is the file extension (e.g., \code{.txt}, \code{.csv}).
   \item Place a corresponding R script in the \code{data-raw} directory named \code{dat.<author><year>.r} that reads in the data, possibly does some data cleaning/processing, and then saves the dataset to the \code{data} directory (using \code{\link{save}}), with name \code{dat.<author><year>.rda}.
   \item Start R, load the \code{metadat} package (i.e., \code{library(metadat)}), and then run the \code{\link{prep_dat}} function (either set the working directory to the location of the source package beforehand or use the \code{pkgdir} argument of the \code{\link{prep_dat}} function to specify the source package location).
   \item For a new dataset, this should create a boilerplate template for a corresponding help file in the \code{man} directory, named \code{dat.<author><year>.Rd}. Edit the help file, adding the title and a short description of the dataset in general, a description of each variable in the dataset, further details on the dataset (e.g., the field of research, how the data was collected, the purpose of the dataset / what it was used for, the effect size or outcome measure used in the analysis, the types of analyses/models that can be illustrated with the dataset), a reference for the source of the dataset, one or multiple concept terms, the name and email address of the contributor of the dataset, and (optionally) example code to illustrate the analysis of the dataset.
   \item Either make a pull request (if you are familiar with this workflow) or zip up the \code{dat.<author><year>.<ext>}, \code{dat.<author><year>.r}, \code{dat.<author><year>.rda}, and \code{dat.<author><year>.Rd} files and open up a new \href{https://github.com/wviechtb/metadat/issues}{issue at GitHub}, attaching the zip file.
   \item If the above makes no sense to you, you can also email one of the package authors with a cleaned, raw data file in \code{.txt} or \code{.csv} format, along with a meta-data file (format doesn't matter) that includes the information described above.
   }
}
\section{Citing the Package}{
   If you use these data, please cite both the \pkg{metadat} package (see \code{citation("metadat")} for the reference) and the original source of the data as given under the help file of a dataset.
}
\section{Bug/Error Reports}{
   If you think you have found an error in an existing dataset or a bug in the package in general, please go to \url{https://github.com/wviechtb/metadat/issues} and open up a new issue.
}
\author{
   Thomas White \email{thomas.white@sydney.edu.au} \cr
   Daniel Noble \email{daniel.noble@anu.edu.au} \cr
   Alistair Senior \email{alistair.senior@sydney.edu.au} \cr
   W. Kyle Hamilton, \email{whamilton@ucmerced.edu} \cr
   Wolfgang Viechtbauer \email{wvb@metafor-project.org}
}
\keyword{package}
