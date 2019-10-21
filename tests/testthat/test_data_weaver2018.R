source("hashTable.R")

context("Checking data: weaver2018")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.weaver2018, algo = "md5"), hashTable$weaver2018)
})