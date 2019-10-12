source("hashTable.R")

context("Checking data: collins1985a")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.collins1985a, algo = "md5"), hashTable$collins1985a)
})