context("test-dat.bangertdrowns2004.R")
library(metadat)
library(metafor)

### copy data into 'dat' and examine data
dat <- dat.bangertdrowns2004
dat

### random-effects model
res <- rma(yi, vi, data=dat)
res

test_that("Returns rma object", {
  expect_is(res, "rma.uni")
})

test_that("Checks rma results", {
  expect_identical(round(res$k, digits = 2), 48)
  expect_identical(round(as.numeric(res$beta[,1]), digits = 7), 0.2219296)
  expect_identical(round(as.numeric(res$tau2), digits = 7), 0.0499411)
  expect_match(res$method, "REML") 
})
