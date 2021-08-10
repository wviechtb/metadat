context("Checking: dat.lim2014")

library(digest)

test_that("md5 hash matches for the data m_o_size", {
   expect_match(digest(metadat::dat.lim2014$m_o_size, algo="md5"), "47c9b90b4d399147238b3d001e8cc09b")
})

test_that("md5 hash matches for the data m_o_fecundity", {
   expect_match(digest(metadat::dat.lim2014$m_o_fecundity, algo="md5"), "5cd73c511ca7a5993d74ea3a0b01e7a4")
})

test_that("md5 hash matches for the data o_o_unadj", {
   expect_match(digest(metadat::dat.lim2014$o_o_unadj, algo="md5"), "281630552862a8351684c375ca2f237c")
})

test_that("md5 hash matches for the data o_o_adj", {
   expect_match(digest(metadat::dat.lim2014$o_o_adj, algo="md5"), "86870c289d85e1d914ae009bf9635529")
})

test_that("md5 hash matches for the tree m_o_size_tree", {
   expect_match(digest(metadat::dat.lim2014$m_o_size_tree, algo="md5"), "a0d9c3c1381669abb23710059752cd18")
})

test_that("md5 hash matches for the tree m_o_fecundity_tree", {
   expect_match(digest(metadat::dat.lim2014$m_o_fecundity_tree, algo="md5"), "553fb55660b195c5f319c147585e816e")
})

test_that("md5 hash matches for the tree o_o_unadj_tree", {
   expect_match(digest(metadat::dat.lim2014$o_o_unadj_tree, algo="md5"), "d4006f261ce75e7cb397b1fdefe7f7c6")
})

test_that("md5 hash matches for the tree o_o_adj_tree", {
   expect_match(digest(metadat::dat.lim2014$o_o_adj_tree, algo="md5"), "ea8b3394bef1ea32001e903b987ded89")
})
