prep_dat <- function(rebuild=FALSE, overwrite, pkgdir) {

   cat("\n")

   # if 'pkgdir' argument is unspecified, assume it is the current working directory
   if (missing(pkgdir)) {
      pkgdir <- normalizePath(".")
      cat("Package root directory:", pkgdir, "\n\n")
   }

   # check if package root directory actually exists and that it has
   # a DESCRIPTION file with "Package: metadat" in the first line
   if (dir.exists(pkgdir)) {
      if (!file.exists(paste0(pkgdir, "/DESCRIPTION")))
         stop("No DESCRIPTION file in the package root directory.")
      if (readLines(paste0(pkgdir, "/DESCRIPTION"), n=1) != "Package: metadat")
         stop("DESCRIPTION file in the package root directory is not for the 'metadat' package.")
   } else {
      stop("Specified 'pkgdir' directory does not exist.")
   }

   data_raw.dir <- paste0(pkgdir, "/data-raw/")
   data.dir     <- paste0(pkgdir, "/data/")
   man.dir      <- paste0(pkgdir, "/man/")

   # check that directories actually exist
   if (!dir.exists(data_raw.dir))
      stop("Cannot find 'data-raw' directory.")
   if (!dir.exists(data.dir))
      stop("Cannot find 'data' directory.")
   if (!dir.exists(man.dir))
      stop("Cannot find 'man' directory.")

   # load .rfiles.txt (if it exists)
   if (file.exists(paste0(data_raw.dir, ".rfiles.txt"))) {
      .rfiles <- read.table(paste0(data_raw.dir, ".rfiles.txt"), header=FALSE, as.is=TRUE)[[1]]
   } else {
      .rfiles <- NULL
   }

   # try running Rscript
   tmp <- try(suppressWarnings(system2("Rscript", args="-e 1", stdout=TRUE, stderr=TRUE)), silent=TRUE)
   if (inherits(tmp, "try-error"))
      stop("Cannot run 'Rscript'. Make sure that Rscript/Rscript.exe is on the system path.")

   # get names of all data preparation scripts (.r/.R files) in the 'data-raw' directory
   rfiles <- list.files(path=data_raw.dir, pattern=".[rR]$")

   # paste header for output
   cat("File", paste0(rep(" ", max(nchar(rfiles))-4), collapse=""), "new ", "rda ", "build ", "Rd ", "create", "\n")
   cat(paste0(rep("-", max(nchar(rfiles))+29), collapse=""), "\n")

   # process all data preparation scripts

   for (i in seq_along(rfiles)) {

      # paste name of the data preparation script (and enough space to align everything)
      cat(rfiles[i], paste0(rep(" ", max(nchar(rfiles))-nchar(rfiles[i])+1), collapse=""))

      # check if the data preparation file is already in .rfiles.txt
      rfile.exists <- rfiles[i] %in% .rfiles

      # [new]: paste T/F if it is a new script or not
      cat(ifelse(!rfile.exists, "T    ", "F    "))

      # get 'root' name of the data preparation script (remove .r/.R extension)
      root <- substr(rfiles[i], 1, nchar(rfiles[i])-2)

      # get names of all .rda files in the 'data' directory
      rda.files <- list.files(path=data.dir, pattern=".rda$")

      # grep names of all <root>.<anything>.rda files (could be one or multiple)
      rda.files <- grep(paste0("^", root, ".*.rda"), rda.files, value=TRUE)

      # check if <root>.<anything>.rda files already exist
      rda.files.exist <- ifelse(length(rda.files) > 0, TRUE, FALSE)

      # [rda]: paste T/F if the rda files already exist or not
      cat(ifelse(rda.files.exist, "T    ", "F    "))

      # if rebuild=TRUE or if the rda files do not exist, try running the data preparation script
      # [build]: paste T/F if the data processing script was run (without error)
      if (rebuild || !rda.files.exist) {

         #rfilerun <- try(source(paste0(data_raw.dir, rfiles[i])), silent=TRUE)
         #if (inherits(rfilerun, "try-error")) {

         # run each script in its own independent process
         cmd <- paste0(data_raw.dir, rfiles[i])
         out <- suppressWarnings(system2("Rscript", cmd, stdout=TRUE, stderr=TRUE))

         if (isTRUE(attributes(out)$status == 1)) {
            warning("Error while running ", rfiles[i], ".", call.=FALSE)
            cat("F      ")
         } else {
            cat("T      ")
         }

      } else {
         cat("F      ")
      }

      # list all files in the 'data' directory (possibly includes non-.rda files)
      data.files <- list.files(path=data.dir)

      # check if there are now any non-.rda files in 'data'; if so, throw an error
      if (any(tools::file_ext(data.files) != "rda"))
         stop("\n\nThere are non-.rda files in the 'data' directory.\nData preparation scripts must create only .rda files.")

      # check if <root>.Rd file exists in 'man' directory
      rd.exists <- file.exists(paste0(man.dir, root, ".Rd"))

      # [Rd]: paste T/F if <root>.Rd file exists or not
      if (rd.exists) {
         cat("T   ")
      } else {
         cat("F   ")
      }

      # if it doesn't exist or if it is in 'overwrite' vector, create template <root>.Rd file
      # [create]: paste T/F if template <root>.Rd file is created
      if (!rd.exists || !missing(overwrite) && paste0(root, ".Rd") %in% overwrite) {
         cat("T      ")
         .rd_generator(root, pkgdir, overwrite)
      } else {
         cat("F      ")
      }

      cat("\n")

   }

   # make sure every .rda file in 'data' is lower case
   for (data.file in data.files) {
      file.rename(paste0(data.dir, data.file), paste0(data.dir, tolower(data.file)))
   }

   # write updated .rfiles.txt file to 'data-raw' directory
   write.table(rfiles, file=paste0(data_raw.dir, ".rfiles.txt"), row.names=FALSE, col.names=FALSE)

   cat("\n")

}
