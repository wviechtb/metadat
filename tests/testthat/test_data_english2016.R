source("hashTable.R")

context("Checking data: english2016")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.english2016.1, algo = "md5"), hashTable$english2016.1)
})

test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.english2016.2, algo = "md5"), hashTable$english2016.2)
})