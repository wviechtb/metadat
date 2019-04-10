dat.ishak2007 <- read.table("data-raw/dat.ishak2007.txt", header=TRUE, stringsAsFactors=FALSE)
attr(dat.ishak2007, "digits") <- 1
attr(dat.ishak2007, "yi.names") <- c("y1i", "y2i", "y3i", "y4i")
attr(dat.ishak2007, "vi.names") <- c("v1i", "v2i", "v3i", "v4i")
attr(dat.ishak2007$y1i, "measure") <- "MD"
attr(dat.ishak2007$y2i, "measure") <- "MD"
attr(dat.ishak2007$y3i, "measure") <- "MD"
attr(dat.ishak2007$y4i, "measure") <- "MD"
class(dat.ishak2007) <- c("escalc", "data.frame")
save(dat.ishak2007, file="data/dat.ishak2007.rda")
