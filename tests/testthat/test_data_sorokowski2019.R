source("hashTable.R")

context("Checking data: sorokowski2019")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.sorokowski2019.1, algo = "md5"), hashTable$sorokowski2019.1)
})

# test_that("checks data md5 hash", {
#   expect_match(digest(metadat::dat.nakagawa2015.2, algo = "md5"), hashTable$nakagawa2015.2)
# })
# 
# test_that("checks data md5 hash", {
#   expect_match(digest(metadat::dat.nakagawa2015.3, algo = "md5"), hashTable$nakagawa2015.3)
# })
# 
# test_that("checks data md5 hash", {
#   expect_match(digest(metadat::dat.nakagawa2015.phy1, algo = "md5"), hashTable$nakagawa2015.phy1)
# })
# 
# test_that("checks data md5 hash", {
#   expect_match(digest(metadat::dat.nakagawa2015.phy2, algo = "md5"), hashTable$nakagawa2015.phy2)
# })