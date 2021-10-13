# McCurdy, M. P., Viechtbauer, W., Sklenar, A. M., Frankenstein, A. N., & Leshikar, E. D. (2020).
# Theories of the generation effect and the impact of generation constraint: A meta-analytic review.
# Psychonomic Bulletin & Review, 27(6), 1139-1165. https://doi.org/10.3758/s13423-020-01762-3

# data from: https://osf.io/hp89e/

# note: need metafor for these data preparation steps
if (!require(metafor))
   stop("Cannot run data preparation steps for 'dat.mccurdy2020' without the 'metafor' package.")

dat <- read.table("data-raw/dat.mccurdy2020.txt", sep="\t", header=TRUE, stringsAsFactors=FALSE)

############################################################################

### replace 99 with NA in variables 15:end

for (i in 15:ncol(dat)) {
   dat[[i]][dat[[i]] == 99] <- NA
}

### rename some variables

# rename 'article_no' variable to 'article'
names(dat)[which(names(dat) == "article_no")] <- "article"

# rename 'exp' variable to 'experiment'
names(dat)[which(names(dat) == "exp")] <- "experiment"

# rename 'sample_id' variable to 'sample'
names(dat)[which(names(dat) == "sample_id")] <- "sample"

# rename 'gen_constraint_cons' variable to 'gen_constraint'
names(dat)[which(names(dat) == "gen_constraint_cons")] <- "gen_constraint"

# rename 'part_per_cond' variable to 'ni'
names(dat)[which(names(dat) == "part_per_cond")] <- "ni"

# rename 'stimuli_per_cond' variable to 'stimuli'
names(dat)[which(names(dat) == "stimuli_per_cond")] <- "stimuli"

# rename 'manip_design' variable to 'manip_type'
names(dat)[which(names(dat) == "manip_design")] <- "manip_type"

# rename 'divided_attn' variable to 'attention'
names(dat)[which(names(dat) == "divided_attn")] <- "attention"

# rename 'cond_type' variable to 'condition'
dat$condition <- NULL
names(dat)[which(names(dat) == "cond_type")] <- "condition"

# rename 'self_pace' variable to 'pacing'
names(dat)[which(names(dat) == "self_pace")] <- "pacing"

# rename 'encode_type' variable to 'gen_mode'
names(dat)[which(names(dat) == "encode_type")] <- "gen_mode"

############################################################################

# keep rows where article is not missing (i.e., delete superfluous row at end)
dat <- dat[!is.na(dat$article),]

# keep rows where 'mean' is not missing
dat <- dat[!is.na(dat$mean),]

# add variable with unique 'id' for each row
dat$id <- 1:nrow(dat)

# variances of the observed proportions within each study (where available)
dat$var <- dat$st_dev^2

# set 'yi' equal to the mean proportions
dat$yi <- dat$mean

# make row number consecutive
rownames(dat) <- NULL

############################################################################

### recode some variables

dat$condition <- 3 - dat$condition
dat$condition <- factor(dat$condition, levels = 1:2, labels = c("read", "generate"))

dat$gen_difficulty <- factor(dat$gen_difficulty, levels = 1:2, labels = c("low", "high"))

dat$manip_type <- factor(dat$manip_type, levels = 1:2, labels = c("within", "between"))

dat$present_style <- factor(dat$present_style, levels = 1:2, labels = c("mixed", "pure"))

dat$word_status <- NA
dat$word_status[dat$stimuli_type %in% c(1,2,4,5,6,7,9)] <- 1
dat$word_status[dat$stimuli_type ==  3] <- 2
dat$word_status[dat$stimuli_type ==  8] <- 3
dat$word_status <- factor(dat$word_status, levels = 1:3, labels = c("words", "non-words", "numbers"))
dat$stimuli_type <- NULL

dat$memory_test[dat$memory_test ==  4] <- NA
dat$memory_test <- factor(dat$memory_test, levels = 1:3, labels = c("recognition", "cued recall", "free recall"))

dat$memory_type[dat$memory_type == 9] <- NA
dat$memory_type <- factor(dat$memory_type,
                          levels = 1:8,
                          labels = c("item", "source", "font color", "font type", "order", "cue word", "background color", "location"))

dat$gen_constraint <- factor(dat$gen_constraint, levels = 1:3, labels = c("low", "medium", "high"))

dat$learning_type <- factor(dat$learning_type, levels = 1:2, labels = c("incidental", "intentional"))

dat$stimuli_relation <- factor(dat$stimuli_relation,
                               levels = c(1,2,3,4,5,7,8,6),
                               labels = c("semantic", "category", "antonym", "synonym", "rhyme", "compound words", "definitions", "unrelated"))

dat$gen_mode[dat$gen_mode ==  2] <- NA
dat$gen_mode[dat$gen_mode ==  3] <- 2
dat$gen_mode[dat$gen_mode ==  4] <- 3
dat$gen_mode <- factor(dat$gen_mode, levels = 1:3, labels = c("verbal/speaking", "covert/thinking", "writing/typing"))

dat$gen_task[dat$gen_task ==  7] <- NA
dat$gen_task[dat$gen_task ==  8] <- 7

dat$gen_task <- factor(dat$gen_task,
                       levels = 1:7,
                       labels = c("anagram", "letter transposition", "word fragment", "sentence completion", "word stem", "calculation", "cue only"))

dat$attention <- factor(dat$attention, levels = 1:2, labels = c("divided", "full"))

dat$pacing <- factor(dat$pacing, levels = 1:2, labels = c("self-paced", "timed"))

dat$filler_task <- factor(dat$filler_task, levels = 1:2, labels = c("yes", "no"))

dat$age_grp <- factor(dat$age_grp, levels = 1:2, labels = c("younger", "older"))

dat$retention_delay <- factor(dat$retention_delay, levels = 1:3, labels = c("immediate", "short", "long"))

############################################################################

### impute missing sampling variances

# compute ln(SD) and corresponding sampling variances
dat <- escalc(measure="SDLN", sdi=st_dev, ni=ni, data=dat, var.names=c("lnsd", "vi.lnsd"))

# imputation model
res <- rma(lnsd, vi.lnsd, mods = ~ mean + I(mean^2) + I(1/stimuli) + I(1/ni), data=dat)

# var.i is the observed variance where available and imputed otherwise
options(na.action="na.pass")
dat$var.i <- replmiss(dat$var, exp(fitted(res))^2)
options(na.action="na.omit")

# compute sampling variances (also using imputed variances)
dat$vi <- dat$var.i / dat$ni

dat$var   <- round(dat$var, 6)
dat$var.i <- round(dat$var.i, 6)

############################################################################

dat <- dat[c("article", "experiment", "sample", "id", "pairing",
"yi", "vi", "ni", "stimuli",
"condition", "gen_difficulty", "manip_type", "present_style", "word_status", "memory_test", "memory_type", "gen_constraint",
"learning_type", "stimuli_relation", "gen_mode", "gen_task", "attention", "pacing", "filler_task", "age_grp", "retention_delay")]

dat <- escalc(measure="GEN", yi=yi, vi=vi, data=dat)
attributes(dat)$digits[6] <- 5
#head(dat)

if (FALSE) {

# checks

lapply(dat, function(x) if (is.factor(x)) table(x, useNA="ifany"))

itemdat <- dat[dat$memory_type == "item",]

table(itemdat$condition, itemdat$gen_difficulty)
table(itemdat$condition, itemdat$manip_type)
table(itemdat$condition, itemdat$present_style)
table(itemdat$condition, itemdat$word_status)
table(itemdat$condition, itemdat$memory_test)

contextdat <- dat[dat$memory_type != "item" & dat$memory_type != "other",]
table(contextdat$condition)

table(dat$condition, dat$memory_type != "item")

table(dat$gen_constraint)

table(dat$gen_constraint, dat$memory_test)

table(dat$condition, dat$learning_type)
table(dat$condition, dat$stimuli_relation)
table(dat$condition, dat$gen_mode)
table(dat$condition, dat$gen_task)
table(dat$condition, dat$attention)
table(dat$condition, dat$pacing)
table(dat$condition, dat$filler_task)
table(dat$condition, dat$age_grp)
table(dat$condition, dat$retention_delay)
table(dat$condition, dat$stimuli <= 19)
table(dat$condition, dat$stimuli >= 20 & dat$stimuli <= 39)
table(dat$condition, dat$stimuli >= 40)

}

############################################################################

dat.mccurdy2020 <- dat

save(dat.mccurdy2020, file="data/dat.mccurdy2020.rda")
