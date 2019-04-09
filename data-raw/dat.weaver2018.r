# Load
dat.weaver2018 <- read.csv("data-raw/dat.weaver2018.csv", header=TRUE, stringsAsFactors=FALSE)

# Remove whitespace and convert to lowercase
dat.weaver2018$author <- tolower(gsub(" ", "_", dat.weaver2018$author))
dat.weaver2018$history_trait <- tolower(gsub(" ", "_", dat.weaver2018$history_trait))
dat.weaver2018$species <- tolower(gsub(" ", "_", dat.weaver2018$species))
dat.weaver2018$color <- tolower(gsub(" ", "_", dat.weaver2018$color))
dat.weaver2018$category <- tolower(gsub(" ", "_", dat.weaver2018$category))
dat.weaver2018$animal <- tolower(gsub(" ", "_", dat.weaver2018$animal))
dat.weaver2018$col_variable <- tolower(gsub(" ", "_", dat.weaver2018$col_variable))

# Rename effect sizes and variance
names(dat.weaver2018)[names(dat.weaver2018) == "z_trans"] <- "yi"
names(dat.weaver2018)[names(dat.weaver2018) == "var"] <- "vi"

# Drop id column
dat.weaver2018[ , !(names(dat.weaver2018) %in% 'id')]

# Output
save(dat.weaver2018, file="data/dat.weaver2018.rda", ascii=FALSE)
