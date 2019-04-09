
# Main function for generating docs
rd_generator <- function(dir = getwd(), overwrite = FALSE) {

  # List the study data
  all_study_names <- get_studies(dir, full = TRUE)
  primary_study_names <- get_studies(dir, full = FALSE)

  if (!overwrite) {
    # Check what documentation currently exists
    doc_names <- get_existing_rd(dir)

    # Keep names of data files that do not have documentation
    primary_study_names <- setdiff(primary_study_names, doc_names)
    all_study_names <- unlist(apply(as.data.frame(primary_study_names), 1, function(x) grep(x, all_study_names, value = TRUE)))
  }

  # Loop through undocumented data and create template documentation
  for (i in 1:length(primary_study_names)) {
    full_study_names <- unlist(lapply(primary_study_names, function(x) grep(x, all_study_names, value = TRUE)))

    # Open new file connection
    con <- try(file(file.path(paste0(dir, "/man/"), paste0(primary_study_names[i], ".Rd")), "w"))

    # Write the single preamble
    write.table(preamble_table(primary_study_names[i]), con, row.names = FALSE, col.names = FALSE, quote = FALSE)

    for (j in 1:length(full_study_names)) {

      # Load data
      data <- get(load(paste0(dir, "/data/", as.character(full_study_names[[j]]), ".rda")))

      # Check it's a data frame
      if (class(data) != "data.frame") {
        stop(" Data is not a dataframe")
      }

      # Write the meta-data table
      write.table(tabular(full_study_names[j]), con, row.names = FALSE, col.names = FALSE, quote = FALSE)
      write.table(meta_dat_table(data), con, row.names = FALSE, col.names = FALSE, quote = FALSE)
    }

    # Write the postamble
    write.table(postamble_table(primary_study_names[i]), con, row.names = FALSE, col.names = FALSE, quote = FALSE)

    # Close the file connection
    close(con)
  }
}

# List available .rda files
get_studies <- function(dir, full = TRUE) {

  # List data files
  files <- list.files(paste0(dir, "/data/"))

  # Get unique studies
  if (full) {
    study.names <- unique(tools::file_path_sans_ext(files))
  } else {
    study.names <- unique(sub("(^[^.]+[.][^.]+)(.+$)", "\\1", files))
  }

  return(study.names)
}

# List existing documentation files
get_existing_rd <- function(dir) {

  # List data files
  files <- list.files(paste0(dir, "/man/"))

  # Get unique documentation
  doc.names <- unique(sub("(^[^.]+[.][^.]+)(.+$)", "\\1", files))

  return(doc.names)
}

# Generate preamble
preamble_table <- function(study.name) {
  name <- paste0("\\name{", study.name, "}")
  docType <- "\\docType{data}"
  alias <- paste0("\\alias{", study.name, "}")
  title <- "\\title{ }"
  descrp <- "\\description{ }"
  use <- paste0("\\usage{", study.name, "}")
  return(data.frame(rbind(name, docType, alias, title, descrp, use), stringsAsFactors = FALSE))
}

# Generate table start
tabular <- function(study.name) {
  format <- paste0("\\format{The data frame ", study.name, " contains the following columns:")
  tabular <- "\\tabular{lll}{"
  return(data.frame(rbind(format, tabular), stringsAsFactors = FALSE))
}

# Generate metadata table
meta_dat_table <- function(data) {
  variables <- paste0("\\bold{", colnames(data), "}")
  type <- paste0("\\tab", " ", "\\code{", as.vector(sapply(data, class)), "}")
  descrp <- rep(paste0("\\tab", " ", "\\cr"), length = length(variables))
  meta_dat_table <- cbind(variables, type, descrp, deparse.level = 0)

  return(data.frame(meta_dat_table, stringsAsFactors = FALSE))
}

# Generate postamble
postamble_table <- function(study.name) {
  closer <- "}"
  details <- "\\details{ }"
  source <- "\\source{ }"
  examples1 <- "\\examples{"
  examples2 <- "### copy data into 'dat' and examine data"
  examples3 <- paste0("dat <- ", study.name)
  examples4 <- "dat"
  keywords <- "\\keywords{datasets}"

  return(data.frame(rbind(closer, closer, details, source, examples1, examples2, examples3, examples4, closer, keywords)))
}
