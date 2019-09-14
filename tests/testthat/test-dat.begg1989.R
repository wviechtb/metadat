context("test-dat.begg1989.R")
library(metadat)
library(metafor)

### copy data into 'dat' and examine data
dat <- dat.begg1989
dat

dat2 <- data.frame(yi = dat$yi[c(1,3,5,7)] - dat$yi[c(2,4,6,8)],
                   vi = dat$vi[c(1,3,5,7)] + dat$vi[c(2,4,6,8)])

### random-effects model
res <- rma(yi, vi, data=dat2, method="DL", digits=2)
res

### Begg & Pilote (1991) model incorporating the uncontrolled studies
res1 <- rma.mv(yi, vi, mods = ~ trt, random = ~ 1 | study,
              data=dat, method="ML", digits=2)
res1

### model involving bias terms for the uncontrolled studies
res2 <- rma.mv(yi, vi, mods = ~ trt + trt:arms, random = ~ 1 | study,
              data=dat, method="ML", digits=2)
res2

### model with random treatment effect
res3 <- rma.mv(yi, vi, mods = ~ trt, random = list(~ 1 | study, ~ trt | study),
              struct="UN", tau2=c(0,NA), rho=0, data=dat, method="ML", digits=2)
res3

### model with random treatment effect, but with equal variances in both arms
res4 <- rma.mv(yi, vi, mods = ~ trt, random = list(~ 1 | study, ~ trt | study),
              struct="CS", rho=0, data=dat, method="ML", digits=2)
res4


test_that("Returns rma.uni object", {
  expect_is(res, "rma.uni")
})

test_that("Returns rma.mv object", {
  expect_is(res1, "rma.mv")
  expect_is(res2, "rma.mv")
  expect_is(res3, "rma.mv")
  expect_is(res4, "rma.mv")
})

test_that("Checks rma results", {
  expect_identical(round(res$k, digits = 2), 4)
  expect_identical(round(as.numeric(res$beta[,1]), digits = 7), 0.1962983)
  expect_identical(round(as.numeric(res$tau2), digits = 7), 0)
  expect_match(res$method, "DL")
  expect_match(res$measure, "GEN")
})

test_that("Checks rma1 results", {
  expect_identical(round(res1$k, digits = 2), 20)
  expect_identical(round(as.numeric(res1$beta[1,1]), digits = 7), 0.4706555)
  expect_identical(round(as.numeric(res1$beta[2,1]), digits = 7), -0.148591)
  expect_identical(round(as.numeric(res1$tau2), digits = 7), 0)
  expect_match(res1$method, "ML")
  expect_match(res1$measure, "PR")
})

test_that("Checks rma2 results", {
  expect_identical(round(res2$k, digits = 2), 20)
  expect_identical(round(as.numeric(res2$beta[1,1]), digits = 7), 0.4181988)
  expect_identical(round(as.numeric(res2$beta[2,1]), digits = 7), -0.0649902)
  expect_identical(round(as.numeric(res2$tau2), digits = 7), 0)
  expect_match(res2$method, "ML")
  expect_match(res2$measure, "PR")
})

test_that("Checks rma3 results", {
  expect_identical(round(res3$k, digits = 2), 20)
  expect_identical(round(as.numeric(res3$beta[1,1]), digits = 7), 0.4588934)
  expect_identical(round(as.numeric(res3$beta[2,1]), digits = 7), -0.1349637)
  expect_identical(round(as.numeric(res3$tau2[1]), digits = 7), 0)
  expect_identical(round(as.numeric(res3$tau2[2]), digits = 7), 0.0030286)
  expect_match(res3$method, "ML")
  expect_match(res3$measure, "PR")
})

test_that("Checks rma4 results", {
  expect_identical(round(res4$k, digits = 2), 20)
  expect_identical(round(as.numeric(res4$beta[1,1]), digits = 7), 0.4687478)
  expect_identical(round(as.numeric(res4$beta[2,1]), digits = 7), -0.1462635)
  expect_identical(round(as.numeric(res4$tau2[1]), digits = 7), 0.0012779)
  expect_match(res4$method, "ML")
  expect_match(res4$measure, "PR")
})
