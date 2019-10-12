source("hashTable.R") # read in hashes

context("Checking data: barone2019")

library(digest)

test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.barone2019, algo = "md5"), hashTable$barone2019)
})