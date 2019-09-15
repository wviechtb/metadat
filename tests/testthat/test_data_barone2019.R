context("Checking data: barone2019")

library(metadat)
library(metafor)
library(digest)

## Make copy of dataset
dat <- metadat::dat.barone2019

test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.barone2019, algo = "md5"), "44d1bfc0b736fc8c3846af9e0d81694b")
})

test_that('data dimensions are correct', {
  expect_equal(ncol(dat), 22)
  expect_equal(nrow(dat), 56)
})

test_that('data types are correct', {
  expect_is(dat, 'data.frame')
  expect_is(dat$id, 'character')
  expect_is(dat$Author, 'character')
  expect_is(dat$Year, 'integer')
  expect_is(dat$Paradigm, 'character')
  expect_is(dat$Measure, 'character')
  expect_is(dat$Age_months, 'numeric')
  expect_is(dat$n, 'integer')
  expect_is(dat$Dropped_participants, 'integer')
  expect_is(dat$Dropped_participants_corrected, 'integer')
  expect_is(dat$Familiarization, 'integer')
  expect_is(dat$Belief, 'character')
  expect_is(dat$Agent, 'character')
  expect_is(dat$Target_object_Presence, 'character')
  expect_is(dat$Object_movements, 'integer')
  expect_is(dat$Motive_transformation, 'character')
  expect_is(dat$Salience_of_agents_MS, 'character')
  expect_is(dat$Interaction, 'character')
  expect_is(dat$Design, 'character')
  expect_is(dat$Test_trials, 'integer')
  expect_is(dat$logit.p., 'numeric')
  expect_is(dat$vlogit.p., 'numeric')
  expect_is(dat$sei, 'numeric')
})