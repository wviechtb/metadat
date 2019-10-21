source("hashTable.R")

context("Checking data: laopaiboon2015")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.laopaiboon2015, algo = "md5"), hashTable$laopaiboon2015)
})