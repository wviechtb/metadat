
rfiles <- list.files(pattern="[.r]$")
rfiles <- rfiles[rfiles != "prep_data.r"]
rfiles

for (i in 1:length(rfiles)) {
   source(rfiles[i])
}

