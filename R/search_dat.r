search_dat <- function(pattern, fields = "concept") {

   #fields <- c("title", "alias", "concept", "name", "keyword")

   # get names of matching datasets
   names <- unique(utils::help.search(pattern, package = "metadat", fields = fields)$matches$Name)

   # if nothing is found
   if (length(names) == 0)
      return(message('No results found.'))

   # get titles of matching datasets
   title <- utils::help.search(pattern, package = "metadat", fields = fields)$matches$Name

   cat("\nChoose the dataset you would like to see:\n")
   Q <- utils::menu(names)

   # show the help file
   help(names[Q])

}

# examples
#search_dat("education")
#search_dat("ecology")
#search_dat("besson", fields = "name")
