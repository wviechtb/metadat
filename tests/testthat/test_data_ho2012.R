source("hashTable.R")

context("Checking data: ho2012")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.ho2012, algo = "md5"), hashTable$ho2012)
})