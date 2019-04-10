
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
    full_study_names <- unlist(lapply(primary_study_names[i], function(x) grep(x, all_study_names, value = TRUE)))

    # Open new file connection
    con <- try(file(file.path(paste0(dir, "/man/"), paste0(primary_study_names[i], ".Rd")), "w"))

    # Write the single preamble
    write.table(preamble_table(primary_study_names[i]), con, row.names = FALSE, col.names = FALSE, quote = FALSE)

    for (j in 1:length(full_study_names)) {

      # Load data
      data <- get(load(paste0(dir, "/data/", as.character(full_study_names[[j]]), ".rda")))

      # Check if the data are 'primary' based on whether the file ends in a numeric character, 
      # and generate full metadata if so, otherwise produce minimal metadata (e.g. for .phylo, .corr, etc.)
      dat_type <- ifelse(suppressWarnings(is.na(as.numeric(tools::file_ext(full_study_names[[j]])))), 'other', 'primary')

      # Write the meta-data table header
      write.table(tabular(full_study_names[j], dat_type), con, row.names = FALSE, col.names = FALSE, quote = FALSE)
      
      # Write main metadata, only if data are 'primary'
      if(dat_type == 'primary')
        write.table(meta_dat_table(data), con, row.names = FALSE, col.names = FALSE, quote = FALSE, na = "")
    }

    # Write the postamble
    write.table(postamble_table(primary_study_names[i]), con, row.names = FALSE, col.names = FALSE, quote = FALSE)

    # Close the file connection
    close(con)
    
    # Output message
    message(paste0("Built ", primary_study_names[i], ".Rd"))
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
  title <- "\\title{ADD_TITLE}"
  descrp <- "\\description{ADD_DESCRIPTION}"
  use <- paste0("\\usage{", study.name, "}")
  format <- paste0("\\format{")
  return(data.frame(rbind(name, docType, alias, title, descrp, use, format), stringsAsFactors = FALSE))
}

# Generate table start
tabular <- function(study.name, dat_type) {
  if(dat_type == 'primary'){
    info <- paste0("The data frame ", study.name, " contains the following columns:")
    tabular <- "\\tabular{lll}{"
    return(data.frame(rbind(info, tabular), stringsAsFactors = FALSE))
  }else if(dat_type == 'other'){
    info <- paste0("The data ", study.name, " contains ADD_DETAILS", "\\cr")
    return(data.frame(info, stringsAsFactors = FALSE))
  }
}

# Generate metadata table
meta_dat_table <- function(data) {
  
  variables <- paste0("\\bold{", colnames(data), "}")
  type <- paste0("\\tab", " ", "\\code{", as.vector(sapply(data, class)), "}")
  descrp <- rep(paste0("\\tab", " ADD_DESCRIPTION ", "\\cr"), length = length(variables))
  closer <- c("}", NA, NA)
  meta_dat_table <- cbind(variables, type, descrp, deparse.level = 0)
  meta_dat_table <- rbind(meta_dat_table, closer)
  
  return(data.frame(meta_dat_table, stringsAsFactors = FALSE, row.names = 1:nrow(meta_dat_table)))
}

# Generate postamble
postamble_table <- function(study.name) {
  closer <- "}"
  details <- "\\details{ADD_DETAILS}"
  source <- "\\source{ADD_REFERENCE}"
  author <- "\\author{ADD_CONTRIBUTOR_NAME, \\email{ADD_EMAIL}}"
  examples1 <- "\\examples{"
  examples2 <- "### copy data into 'dat' and examine data"
  examples3 <- paste0("dat <- ", study.name)
  examples4 <- "dat"
  keyword <- "\\keyword{datasets}"
  concept <- "\\concept{ADD_CONCEPT}"

  return(data.frame(rbind(closer, details, source, author, examples1, examples2, examples3, examples4, closer, keyword, concept)))
}
