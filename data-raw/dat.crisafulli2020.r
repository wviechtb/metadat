dat.crisafulli2020 <- read.csv("data-raw/dat.crisafulli2020.csv",
                               colClasses=c("character","integer","factor",
                                            "integer","integer","integer","integer"))
save(dat.crisafulli2020, file="data/dat.crisafulli2020.rda")
