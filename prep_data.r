rfiles <- list.files(path="data-raw", pattern="[.r]$")
rfiles <- rfiles[rfiles != "prep_data.r"]
#rfiles

setwd("data-raw")

for (i in 1:length(rfiles)) {
   source(rfiles[i])
}

setwd("..")
