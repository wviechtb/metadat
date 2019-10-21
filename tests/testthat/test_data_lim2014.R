source("hashTable.R")

context("Checking data: lim2014")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.lim2014.1, algo = "md5"), hashTable$lim2014.1)
})

test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.lim2014.2, algo = "md5"), hashTable$lim2014.2)
})

test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.lim2014.3, algo = "md5"), hashTable$lim2014.3)
})

test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.lim2014.4, algo = "md5"), hashTable$lim2014.4)
})
