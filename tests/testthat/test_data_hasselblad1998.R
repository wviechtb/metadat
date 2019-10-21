source("hashTable.R")

context("Checking data: hasselblad1998")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.hasselblad1998, algo = "md5"), hashTable$hasselblad1998)
})