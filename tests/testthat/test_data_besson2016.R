source("hashTable.R")

context("Checking data: besson2016")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.besson2016, algo = "md5"), hashTable$besson2016)
})