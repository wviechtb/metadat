data <- data.frame(x = 1:10, y = c(rep("test", 5), rep("low", 5)), z = 1:10)

# check data frame
if(class(data) != "data.frame"){stop(" Data is not a dataframe")}

meta_dat_table <- function(data){
 #step 1 - extract the data’s colnames
 variables <- paste0("\\bold{", colnames(data), "}")

 #step 1 - find class
 type <- paste0("\\tab", " ", "\\code{", as.vector(sapply(data, class)), "}")

 #step 3 - create empty description column
 descrp <- rep(paste0("\\tab", " ", "\\cr"), length = length(variables))

 meta_dat_table <- cbind(variables, type, descrp, deparse.level = 0)

 return(meta_dat_table)
}

get_studies <- function(dir = getwd()){
	# List data files
		files <- list.files(paste0(dir,"/data/"))

	# Get unique studies
		study.names <- unique(sub( "(^[^.]+[.][^.]+)(.+$)", "\\1", files))

	return(study.names)
}

preamble_table <- function(study.name){
	name <- paste0("\\name{", study.name, "}")
	docType <- "\\docType{data}"
	alias <- paste0("\\alias{", study.name, "}")
	title <- "\\title{ }"
	descrp <- "\\description{ }"
	use <- paste0("\\usage{", study.name, "}")
format <- "\\format{The data frame contains the following columns:"
tabular <-"\\tabular{lll}{"

return(rbind(name, docType, alias, title, descrp, use, format, tabular))

}


for(i in study.names){




}

preamble <- preamble_table("dat.valstad2017")
meta_dat_table2 <- meta_dat_table(data)



dir <- getwd()
test.rmd <- paste0("report_", "foobar", ".rmd")
con <- try(file(file.path(dir, test.rmd), "w"))

# if (inherits(con, “try-error”))
#   stop(mstyle$stop(“Could not create .rmd file in document directory.“))

#writeLines(header, con)
write.table(preamble, con, row.names = FALSE, col.names = FALSE, quote = FALSE)
write.table(meta_dat_table2, con, row.names = FALSE, col.names = FALSE, quote = FALSE)

close(con)








