# `metadat`

[![cran version](https://www.r-pkg.org/badges/version-ago/metadat)](https://cran.r-project.org/package=metadat/)

## Meta-analytic datasets for R

### Installation

To download the development version of `metadat`, you can:

* use the [`remotes`](https://github.com/r-lib/remotes) package:

```r
# install.packages("remotes")
remotes::install_github("wviechtb/metadat")
```

* download files from GitHub and install using `$R CMD INSTALL` or, from within R:

```r
install.packages(path, type = "source", repos = NULL)
```

### Contributing data
There are currently 3 ways to contribute data. 

1) **Make a pull request**:  Fork the package. Add your data to the `data-raw/` folder and run the `prep_data.r` and `rd_generator` functions of `metadat`. The files generated in `man` for the relevant dataset need to be correctly filled in with the data descriptors. We have provided prompts for the relevant information that is required to submit (e.g., `ADD DESCRPTION`). Fill all these out and make a pull request via Github [here](https://github.com/wviechtb/metadat/pulls)

2) **Load a ZIP as an Issue**: All data sets require two files. The first is the raw data file in raw format (e.g., .csv, .txt) and an associated .Rd file that describes the data set. You can find an example [here](https://github.com/wviechtb/metadat/blob/master/man/dat.bangertdrowns2004.Rd). These files can be compressed (ZIP) and loaded in issues [here](https://github.com/wviechtb/metadat/issues).

3) **Email Data and Metadata**: You can also email one of the contributors with a cleaned, raw data file in .txt or .csv along with a meta-data file (format doesn't matter) with a description of the data, title and source of publication (if available), each column and an associated descriptor of that column. Details on how the data was collected, what is was used for, packages used to analyse data, type of effect size, models run, question tested, and the field of research.

### todo

- [X] create todo
- [X] naming scheme
  - dat.authoryear
  - dat.authoryearb.1
  - dat.authoryear.corr
  - dat.authoryear.phylo
- [X] boilerplate function for doc generation
- [ ] port over existing datasets
- [ ] document/describe the workflow (raw -> clean data) and add contributor guidelines
- [ ] tests for contributions via PR