source("hashTable.R")

context("Checking data: bourassa1996")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.bourassa1996, algo = "md5"), hashTable$bourassa1996)
})