# Main function for generating docs
.rd_generator <- function(study_name, dir, overwrite) {

  # Add any studies whose documentation is to be overwritten
  if (!missing(overwrite)) {
    study_name <- c(study_name, overwrite)
    study_name <- gsub(".Rd", "", study_name)  # remove file ext if need be
  }

  # Loop through datasets and create template documentation
  # Will only be > 1 if overwrite is specified
  for (i in seq_along(study_name)) {

    # Open new file connection
    con <- try(file(file.path(paste0(dir, "/man/"), paste0(study_name[i], ".Rd")), "w"))

    # Write the single preamble
    write.table(.preamble_table(study_name[i]), con, row.names = FALSE, col.names = FALSE, quote = FALSE)

    # Write the meta-data table header
    write.table(.tabular(study_name[i]), con, row.names = FALSE, col.names = FALSE, quote = FALSE)

    # Load dataset
    data <- get(load(paste0(dir, "/data/", as.character(study_name[[i]]), ".rda")))

    # Write main metadata
    write.table(.meta_dat_table(data), con, row.names = FALSE, col.names = FALSE, quote = FALSE, na = "")

    # Write the postamble
    write.table(.postamble_table(study_name[i]), con, row.names = FALSE, col.names = FALSE, quote = FALSE)

    # Close the file connection
    close(con)
  }
}

# Generate preamble
.preamble_table <- function(study.name) {
  name <- paste0("\\name{", study.name, "}")
  docType <- "\\docType{data}"
  alias <- paste0("\\alias{", study.name, "}")
  title <- "\\title{ADD_TITLE}"
  descrp <- "\\description{ADD_DESCRIPTION}"
  use <- paste0("\\usage{\n", study.name, "\n}")
  format <- paste0("\\format{")
  out <- rbind(name, docType, alias, title, descrp, use, format)
  return(data.frame(out, stringsAsFactors = FALSE, row.names = 1:nrow(out)))
}

# Generate table start
.tabular <- function(study.name) {
  info <- paste0("The data frame contains the following columns:")
  tabular <- "\\tabular{lll}{"
  out <- rbind(info, tabular)
}

# Generate metadata table
.meta_dat_table <- function(data) {
  variables <- paste0("\\bold{", colnames(data), "}")
  type <- paste0("\\tab", " ", "\\code{", as.vector(sapply(data, class)), "}")
  descrp <- rep(paste0("\\tab", " ADD_DESCRIPTION ", "\\cr"), length = length(variables))
  closer <- c("}", NA, NA)
  meta_dat_table <- cbind(variables, type, descrp, deparse.level = 0)
  meta_dat_table <- rbind(meta_dat_table, closer)

  return(data.frame(meta_dat_table, stringsAsFactors = FALSE, row.names = 1:nrow(meta_dat_table)))
}

# Generate postamble
.postamble_table <- function(study.name) {
  closer <- "}"
  details <- "\\details{ADD_DETAILS}"
  source <- "\\source{ADD_REFERENCE}"
  author <- "\\author{ADD_CONTRIBUTOR_NAME, \\email{ADD_EMAIL}}"
  eg1 <- "\\examples{"
  eg2 <- "### copy data into 'dat' and examine data"
  eg3 <- paste0("dat <- ", study.name)
  eg4 <- "dat\n"
  eg5 <- "\\dontrun{\n"
  eg6 <- "ADD_DETAILED_EXAMPLE\n"
  keyword <- "\\keyword{datasets}"
  concept <- "\\concept{ADD_CONCEPT}"

  out <- rbind(closer, details, source, author, eg1, eg2, eg3, eg4, eg5, eg6, closer, closer, keyword, concept)

  return(data.frame(out, stringsAsFactors = FALSE, row.names = 1:nrow(out)))
}
