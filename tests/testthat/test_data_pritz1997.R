source("hashTable.R")

context("Checking data: pritz1997")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.pritz1997, algo = "md5"), hashTable$pritz1997)
})