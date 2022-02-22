datsearch <- function(pattern, concept=TRUE, matchall=TRUE, fixed=TRUE, pkgdown=FALSE) {

   if (!is.character(pattern))
      stop("Argument 'pattern' must be a string (vector).")

   # for a concept term search or fixed-term full-text search, can specify a
   # single pattern separated by "," or ";" or "and" or "AND" which will
   # automatically be split into separate patterns
   if (concept || fixed) {
      pattern <- strsplit(pattern, ",", fixed=TRUE)
      pattern <- unlist(pattern)
      pattern <- strsplit(pattern, ";", fixed=TRUE)
      pattern <- unlist(pattern)
      pattern <- strsplit(pattern, " and ", fixed=TRUE)
      pattern <- unlist(pattern)
      pattern <- strsplit(pattern, " AND ", fixed=TRUE)
      pattern <- unlist(pattern)
      pattern <- trimws(pattern)
   }

   # number of patterns specified
   n <- length(pattern)

   # immediately show warnings, so that the warning() above
   opwarn <- options(warn=1)
   on.exit(options(warn=opwarn$warn))

   matches <- list()

   if (concept) {

      for (i in 1:n) {
         matches[[i]] <- utils::help.search(pattern[i], package="metadat", fields="concept")$matches
      }

   } else {

      # load rdtxt object (list with the plain-text help files)
      tmpenv <- new.env(parent=emptyenv())
      load(paste0(find.package("metadat"), "/help.rdata"), envir=tmpenv)

      for (i in 1:n) {
         hits <- try(grep(pattern[i], tmpenv$rdtxt, fixed=fixed), silent=TRUE) # grep for pattern in rdtxt
         if (inherits(hits, "try-error")) {
            warning(paste0("Search pattern '", pattern[i], "' is not a valid regular expression that can be searched for."), call.=FALSE)
            hits <- "none"
         } else {
            hits <- names(tmpenv$rdtxt)[hits] # get names of datasets that match
            if (length(hits) == 0)
               hits <- "none"
         }
         matches[[i]] <- do.call(rbind, lapply(hits, function(x) utils::help.search(x, package="metadat", fields="name")$matches))
      }

   }

   all.matches <- do.call(rbind, matches)

   if (matchall) {
      matches <- all.matches[all.matches$Name %in% Reduce(intersect, lapply(matches, function(x) x$Name)),]
   } else {
      matches <- all.matches
   }

   # if nothing is found
   if (is.null(matches) || nrow(matches) == 0)
      return(message('No results found.'))

   # keep unique matches
   matches$Entry <- NULL
   matches <- unique(matches)

   # get names and titles of matching datasets
   names  <- matches$Name
   titles <- matches$Title

   if (length(names) == 1L) {

      # if there is only one match, automatically select this match
      sel <- 1

   } else {

      # otherwise prompt user to select one of the matches

      # shorten titles to avoid line wrapping
      width <- options("width")$width
      width.names  <- nchar(names)
      width.titles <- nchar(titles)
      max.width.titles <- width - max(width.names) - 10
      titles <- ifelse(width.titles > max.width.titles, paste0(substr(titles, 1, max.width.titles), "..."), titles)

      # print names and titles of matches
      cat("\n")
      print(data.frame(Name = names, Title = titles), right=FALSE)
      cat("\n")

      exit <- FALSE

      while (TRUE) {

         sel <- readline(prompt = "Choose the number of the dataset you would like to see (or <enter> to exit): ")

         if (sel == "" || sel == "0") {
            exit <- TRUE
            break
         }

         sel <- suppressWarnings(round(as.numeric(sel)))

         if (is.na(sel)) {
            message("Must enter a dataset number.")
            next
         }

         if (sel < 1 || sel > length(titles)) {
            message(paste0("Dataset number must be between 1 and ", length(titles), "."))
            next
         }

         #break

         # show the help file
         if (pkgdown) {
            url <- paste0("https://wviechtb.github.io/metadat/reference/", names[sel], ".html")
            browseURL(url)
         } else {
            print(help(names[sel], package="metadat"))
         }

      }

      if (exit)
         return(invisible())

   }

}

#datsearch(c("standardized", "multilevel"), concept=T)
#datsearch(c("standardized", "multilevel"), concept=F)
