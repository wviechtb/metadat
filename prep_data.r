prep_data <- function(rebuild=FALSE, overwrite=NULL) {

   ### load .rfiles.txt (that already exist)
   .rfiles <- read.table("data-raw/.rfiles.txt", header=FALSE, as.is=TRUE)[[1]]

   ### get names of all data preparation scripts (.r/.R files) in the 'data-raw' directory
   rfiles <- list.files(path="data-raw", pattern=".[rR]$")

   ### paste header for output
   cat("File", paste0(rep(" ", max(nchar(rfiles))-4), collapse=""), "new ", "rda ", "build ", "Rd ", "create", "\n")
   cat(paste0(rep("-", max(nchar(rfiles))+29), collapse=""), "\n")

   ### process all data preparation scripts

   for (i in seq_along(rfiles)) {

      ### paste name of the data preparation script (and enough space to align everything)
      cat(rfiles[i], paste0(rep(" ", max(nchar(rfiles))-nchar(rfiles[i])+1), collapse=""))

      ### check if the data preparation file is already in .rfile.txt
      rfile.exists <- rfiles[i] %in% .rfiles

      ### [New]: paste T/F if it is a new script or not
      cat(ifelse(!rfile.exists, "T    ", "F    "))

      ### get 'root' name of the data preparation script (remove .r/.R extension)
      root <- substr(rfiles[i], 1, nchar(rfiles[i])-2)

      ### get names of all .rda files in the 'data' directory (do we need to do this within the loop?)
      rda.files <- list.files(path="data", pattern=".rda$")

      ### grep names of all <root>.<anything>.rda files (could be one or multiple)
      rda.files <- grep(paste0("^", root, ".*.rda"), rda.files, value=TRUE)

      ### check if <root>.<anything>.rda files already exist
      rda.files.exist <- ifelse(length(rda.files) > 0, TRUE, FALSE)

      ### [rda]: paste T/F if the rda files already exist or not
      cat(ifelse(rda.files.exist, "T    ", "F    "))

      ### if rebuild=TRUE or if the rda files do not exist, process the data preparation script
      ### [Build]: paste T/F if the data processing script is run
      if (rebuild || !rda.files.exist) {
         cat("T      ")
         source(rfiles[i])
      } else {
         cat("F      ")
      }

      ### list all files in the 'data' directory (possibly includes non-.rda files)
      data.files <- list.files(path="data")

      ### check if there are now any non-.rda files in 'data'; if so, throw an error
      if (any(tools::file_ext(data.files) != "rda"))
         stop("\n\nThere are non-.rda files in the 'data' directory.\nData preparation scripts must create only .rda files.")

      ### check if <root>.Rd file exists in 'man' directory
      rd.exists <- file.exists(paste0("man/", root, ".Rd"))

      ### [Rd]: paste T/F if <root>.Rd file exists or not
      if (rd.exists) {
         cat("T   ")
      } else {
         cat("F   ")
      }

      ### if it doesn't exist or if it is part of 'overwrite', create template <root>.Rd file
      ### [Create]: paste T/F if template <root>.Rd file is created
      if (!rd.exists || paste0(root, ".Rd") %in% overwrite) {
         cat("T      ")
         #genrd(root, rda.files)
      } else {
         cat("F      ")
      }

      cat("\n")

   }

   ### make sure every .rda file in 'data' is in lower case
   #for (i in seq_along(rfiles)) {
   #
   #}

   write.table(rfiles, file="data-raw/.rfiles.txt", row.names=FALSE, col.names=FALSE)

}

### this is just for testing purposes; ignore

if (T) {

setwd("/home/wviechtb/work/meta_analysis/metadat/repo")
prep_data()

}
