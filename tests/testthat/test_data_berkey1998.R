source("hashTable.R") # read in hashes

context("Checking data: berkey1998")

library(digest)

test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.berkey1998, algo = "md5"), hashTable$berkey1998)
})
