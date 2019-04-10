
dat_search <- function(pattern, fields = NULL){
  
  if(is.null(fields))
    fields <- c("title", "alias", "concept", "name", "keyword")
	
	# Get names of matching datasets
	names <- unique(utils::help.search(pattern, package = "metadat", fields = fields)$matches$Name)
	
	if(length(names) == 0)
	  return(message('No results found'))
	
	# Get titles of matching datasets
	title <- utils::help.search(pattern, package = "metadat", fields = fields)$matches$Name

	cat("\nChoose the data file you would like to see:\n")
	Q <- utils::menu(names)

	# First explore the help file
	help(names[Q])

}

#Examples
#dat_search("education")
#dat_search("ecology")
#dat_search("besson", fields = "name")