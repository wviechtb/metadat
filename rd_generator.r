
rd_generator <- function(dir = getwd(), overwrite = FALSE) { 
  
  # List the study data
  study_names <- get_studies(dir)
  
  # Check what documentation currently exists
  doc_names <- get_existing_rd(dir)
  
  # Keep names of data files that do not have documentation
  names <- setdiff(study_names, doc_names)
  
  # Loop through undocumented data an created templace documentation
  for(i in names){
    
  # Load data
  data <- get(load(paste0(dir, '/data/', names[i], '.rda')))
  
  # check data frame
  if (class(data) != "data.frame") {
    stop(" Data is not a dataframe")
  }
  
  preamble <- preamble_table("dat.valstad2017")
  meta_dat_table2 <- meta_dat_table(data)
  postamble <- postamble_table("dat.valstad2017")
  
  # Output
  names <- get_studies()
  con <- try(file(file.path(dir, paste0(names[1], ".Rd")), "w"))
  
  write.table(preamble, con, row.names = FALSE, col.names = FALSE, quote = FALSE)
  write.table(meta_dat_table2, con, row.names = FALSE, col.names = FALSE, quote = FALSE)
  write.table(postamble, con, row.names = FALSE, col.names = FALSE, quote = FALSE)
  
  close(con)
  
  }
  
  
}

get_studies <- function(dir = getwd()) {
  # List data files
  files <- list.files(paste0(dir, "/data/"))

  # Get unique studies
  study.names <- unique(sub("(^[^.]+[.][^.]+)(.+$)", "\\1", files))

  return(study.names)
}

get_existing_rd <- function(dir = getwd()) {
  # List data files
  files <- list.files(paste0(dir, "/man/"))
  
  # Get unique studies
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
  format <- "\\format{The data frame contains the following columns:"
  tabular <- "\\tabular{lll}{"
  
  return(rbind(name, docType, alias, title, descrp, use, format, tabular))
}

## Generate metadata table
meta_dat_table <- function(data) {
  variables <- paste0("\\bold{", colnames(data), "}")
  type <- paste0("\\tab", " ", "\\code{", as.vector(sapply(data, class)), "}")
  descrp <- rep(paste0("\\tab", " ", "\\cr"), length = length(variables))
  meta_dat_table <- cbind(variables, type, descrp, deparse.level = 0)

  return(meta_dat_table)
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

  return(rbind(closer, closer, details, source, examples1, examples2, examples3, examples4, closer, keywords))
}

