source("hashTable.R")

context("Checking data: gibson2002")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.gibson2002, algo = "md5"), hashTable$gibson2002)
})