prep_data <- function(rebuild=FALSE, overwrite=NULL) {

   ### list all .r/.R files in the 'data-raw' directory
   rfiles <- list.files(path="data-raw", pattern="[.][rR]$")
   #rfiles <- rfiles[rfiles != "prep_data.r"]
   #rfiles

   cat("File", paste0(rep(" ", max(nchar(rfiles))-4), collapse=""), "New", "Build", "\n")
   cat(paste0(rep("-", max(nchar(rfiles))), collapse=""), "-----------", "\n", sep="")

   ### source data preparation scripts
   for (i in seq_along(rfiles)) {

      ### get 'root' name of the data preparation script
      root <- substr(rfiles[i], 1, nchar(rfiles[i])-2)

      ### list all .rda files in the 'data' directory
      ### TODO: do we need to do this within the loop?
      rda.files <- list.files(path="data")

      ### grep for all root.<anything>.rda files
      rda.files <- grep(paste0("^", root, ".*.rda"), rda.files, value=TRUE)

      ### check if .rda file(s) exists
      rda.exists <- ifelse(length(rda.files) > 0, TRUE, FALSE)

      cat(rfiles[i], paste0(rep(" ", max(nchar(rfiles))-nchar(rfiles[i])), collapse=""), ifelse(!rda.exists, "T   ", "F   "))

      ### if rebuild=TRUE or if file does not exist, process data preparation script
      if (rebuild || !rda.exists) {
         cat("T")
         source(rfiles[i])
      } else {
         cat("F")
      }

      #genrd(root, rda.files)

      cat("\n")

   }

   ### make sure every .rda file in 'data' is in lower case
   #for (i in seq_along(rfiles)) {
   #
   #}

}

### this is just for testing purposes; ignore

if (F) {

setwd("/home/wviechtb/work/meta_analysis/metadat/repo")
prep_data()

}
