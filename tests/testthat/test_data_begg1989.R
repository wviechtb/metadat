source("hashTable.R") # read in hashes

context("Checking data: begg1989")

library(digest)

test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.begg1989, algo = "md5"), hashTable$begg1989)
})
