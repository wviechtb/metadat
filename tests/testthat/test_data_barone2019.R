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

test_that(' data labels are correct', {
  expect_equal(names(dat)[1], "id")
  expect_equal(names(dat)[2], "Author")
  expect_equal(names(dat)[3], "Year")
  expect_equal(names(dat)[4], "Paradigm")
  expect_equal(names(dat)[5], "Measure")
  expect_equal(names(dat)[6], "Age_months")
  expect_equal(names(dat)[7], "n")
  expect_equal(names(dat)[8], "Dropped_participants")
  expect_equal(names(dat)[9], "Dropped_participants_corrected")
  expect_equal(names(dat)[10], "Familiarization")
  expect_equal(names(dat)[11], "Belief")
  expect_equal(names(dat)[12], "Agent")
  expect_equal(names(dat)[13], "Target_object_Presence")
  expect_equal(names(dat)[14], "Object_movements")
  expect_equal(names(dat)[15], "Motive_transformation")
  expect_equal(names(dat)[16], "Salience_of_agents_MS")
  expect_equal(names(dat)[17], "Interaction")
  expect_equal(names(dat)[18], "Design")
  expect_equal(names(dat)[19], "Test_trials")
  expect_equal(names(dat)[20], "logit.p.")
  expect_equal(names(dat)[21], "vlogit.p.")
  expect_equal(names(dat)[22], "sei")
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

