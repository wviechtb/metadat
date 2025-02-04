datsearch <- function(pattern, concept=TRUE, matchall=TRUE, fixed=TRUE, pkgdown=FALSE) {

   # immediately show warnings when they arise

   opwarn <- options(warn=1)
   on.exit(options(warn=opwarn$warn))

   # load rdtxt object (list with the plain-text help files)

   tmpenv <- new.env(parent=emptyenv())
   load(paste0(find.package("metadat"), "/help.rdata"), envir=tmpenv)

   if (missing(pattern)) {
      interactive <- TRUE
      cat("\n")
   } else {
      interactive <- FALSE
   }

   while (TRUE) {

      if (interactive || is.null(pattern))
         pattern <- readline(prompt = "Enter your search term(s) (? for help; <enter> to exit): ")

      if (!is.character(pattern)) {
         warning("Argument 'pattern' must be a string (vector).")
         pattern <- NULL
         next
      }

      if (interactive && identical(pattern, "q")) {
         cat("\n")
         break
      }

      if (interactive && identical(pattern, "?")) {

         cat("\n")
         cat("Enter one or multiple search terms at the prompt. Multiple search terms can be\n")
         cat("separated using a comma, semi-colon, or 'and'. The search either pertains to the\n")
         cat("concept terms or the full text of the help files. Datasets matching all or any of\n")
         cat("search terms are returned. For a full-text search, one can specify fixed strings\n")
         cat("or use regular expressions. Either the standard help file for a chosen dataset will\n")
         cat("be shown or the corresponding pkgdown docs at https://wviechtb.github.io/metadat/.\n")
         cat("\n")
         cat("  key  description                                                         setting\n")
         cat("  --------------------------------------------------------------------------------\n")
         cat("  a    list all datasets contained in the metadat package\n")
         cat("  l    list the concept terms that have been used at least once\n")
         cat("  c    toggle between a concept term search or a full-text search         ", ifelse(concept, "concept", "full-text"), "\n")
         cat("  m    toggle between matching of all search terms or any of them         ", ifelse(matchall, "all", "any"), "\n")
         cat("  f    toggle between fixed string matching or use of regular expressions ", ifelse(fixed, "fixed", "regexp"), "\n")
         cat("  p    toggle between showing the standard help files or the pkgdown docs ", ifelse(pkgdown, "pkgdown", "standard"), "\n")
         cat("\n")
         pattern <- NULL
         next

      }

      if (interactive && identical(pattern, "")) {
         cat("\n")
         return(invisible())
      }

      if (interactive && identical(pattern, "a"))
         pattern <- ""

      if (interactive && identical(pattern, "l")) {
         cat("
In terms of fields/topics, the following terms have been used at least once:

alternative medicine, attraction, cardiology, climate change, covid-19,
criminology, dentistry, ecology, education, engineering, epidemiology,
evolution, genetics, human factors, medicine, memory, obstetrics, oncology,
persuasion, primary care, psychiatry, psychology, smoking, social work,
sociology.

In terms of outcome measures, the following terms have been used at least once:

correlation coefficients, Cronbach's alpha, hazard ratios, incidence rates,
raw mean differences, odds ratios, proportions, ratios of means, raw means,
risk differences, risk ratios, (semi-)partial correlations, standardized mean
changes, standardized mean differences.

In terms of models/methods/concepts, the following terms have been used at least once:

cluster-robust inference, component network meta-analysis, cumulative
meta-analysis, diagnostic accuracy studies, dose response models, generalized
linear models, longitudinal models, Mantel-Haenszel method, meta-regression,
model checks, multilevel models, multivariate models, network meta-analysis,
outliers, Peto's method, phylogeny, publication bias, reliability
generalization, single-arm studies, spatial correlation, subgroup analysis.")
         cat("\n\n")
         pattern <- NULL
         next
      }

      if (interactive && identical(pattern, "c")) {
         concept <- !concept
         message("Switching to a ", ifelse(concept, "concept term search.", "full-text search."))
         pattern <- NULL
         next
      }

      if (interactive && identical(pattern, "m")) {
         matchall <- !matchall
         message("Switching to matching of ", ifelse(matchall, "all search terms.", "any search term."))
         pattern <- NULL
         next
      }

      if (interactive && identical(pattern, "f")) {
         fixed <- !fixed
         message("Switching to ", ifelse(fixed, "fixed string matching.", "use of regular expressions."))
         pattern <- NULL
         next
      }

      if (interactive && identical(pattern, "p")) {
         pkgdown <- !pkgdown
         message("Switching to showing the ", ifelse(pkgdown, "pkgdown docs.", "standard help files."))
         pattern <- NULL
         next
      }

      ########################################################################

      # for a concept term search or fixed-term full-text search, can specify a
      # single pattern separated by "," or ";" or "and" or "AND" which will
      # automatically be split into separate patterns

      if (pattern != "" && (concept || fixed)) {
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

      # search for relevant datasets

      matches <- list()

      if (concept) {

         for (i in 1:n) {
            matches[[i]] <- utils::help.search(pattern[i], package="metadat", fields="concept")$matches
         }

         if (pattern == "")
            matches[[1]] <- matches[[1]][!is.element(matches[[1]]$Name, c("datsearch", "metadat-package", "prep_dat")),]

      } else {

         for (i in 1:n) {
            hits <- try(grep(ifelse(fixed, tolower(pattern[i]), pattern[i]), tmpenv$rdtxt, fixed=fixed), silent=TRUE) # grep for pattern in rdtxt
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

      if (is.null(matches) || nrow(matches) == 0) {
         cat('No results found.\n')
         if (!interactive) {
            cat("\n")
            return(invisible())
         }
         pattern <- NULL
         next
      }

      # keep unique matches
      matches$Entry <- NULL
      matches <- unique(matches)

      # get names and titles of matching datasets
      names  <- matches$Name
      titles <- matches$Title

      if (length(names) == 1L) {

         message("Single match found - showing the help file for this dataset.")

         # if there is only one match, automatically select this match
         if (pkgdown) {
            url <- paste0("https://wviechtb.github.io/metadat/reference/", names[1], ".html")
            browseURL(url)
         } else {
            print(help(names[1], package="metadat"))
         }

      } else {

         # otherwise prompt the user to select one of the matches

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

         while (TRUE) {

            if (interactive) {
               sel <- readline(prompt = "Choose the number of the dataset you would like to see (or <enter> to do a new search): ")
            } else {
               sel <- readline(prompt = "Choose the number of the dataset you would like to see (or <enter> to exit): ")
            }

            if (identical(sel, "p")) {
               pkgdown <- !pkgdown
               message("Switching to showing the ", ifelse(pkgdown, "pkgdown docs.", "standard help files."))
               next
            }

            if (identical(sel, "") || identical(sel, "0")) {
               cat("\n")
               if (!interactive)
                  return(invisible())
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

            # show the help file
            if (pkgdown) {
               url <- paste0("https://wviechtb.github.io/metadat/reference/", names[sel], ".html")
               browseURL(url)
            } else {
               print(help(names[sel], package="metadat"))
            }

         }

      }

      pattern <- NULL

   }

}
