test_that("plants has expected structure", {
  expect_s3_class(plants, "tbl_df")
  expect_equal(ncol(plants), 9)
  expect_named(
    plants,
    c(
      "symbol",
      "scientific_name",
      "common_name",
      "group_name",
      "rank",
      "family",
      "genus",
      "duration",
      "growth_habit"
    )
  )
  expect_true(nrow(plants) > 30000)
  expect_false(anyDuplicated(plants$symbol) > 0)
})

test_that("plants has no HTML artifacts", {
  expect_false(any(grepl("<i>", plants$scientific_name, fixed = TRUE)))
  expect_false(any(grepl("<i>", plants$family, fixed = TRUE), na.rm = TRUE))
  expect_false(any(grepl("<i>", plants$genus, fixed = TRUE), na.rm = TRUE))
})

test_that("plants columns have correct types", {
  expect_type(plants$symbol, "character")
  expect_type(plants$scientific_name, "character")
  expect_type(plants$duration, "character")
  expect_type(plants$growth_habit, "character")
})

test_that("plant_characteristics has expected structure", {
  expect_s3_class(plant_characteristics, "tbl_df")
  expect_true("symbol" %in% names(plant_characteristics))
  expect_true(nrow(plant_characteristics) > 2000)
  expect_false(anyDuplicated(plant_characteristics$symbol) > 0)
})

test_that("plant_characteristics symbols exist in plants", {
  expect_true(all(plant_characteristics$symbol %in% plants$symbol))
})

test_that("plant_characteristics has correct column types", {
  expect_type(plant_characteristics$fire_resistant, "logical")
  expect_type(plant_characteristics$known_allelopath, "logical")
  expect_type(plant_characteristics$propagated_by_seed, "logical")
  expect_type(plant_characteristics$height_mature_feet, "double")
  expect_type(plant_characteristics$ph_minimum, "double")
  expect_type(plant_characteristics$ph_maximum, "double")
  expect_type(plant_characteristics$temperature_minimum_f, "double")
})

test_that("plant_distribution has expected structure", {
  expect_s3_class(plant_distribution, "tbl_df")
  expect_equal(ncol(plant_distribution), 3)
  expect_named(plant_distribution, c("symbol", "status", "state"))
  expect_true(nrow(plant_distribution) > 200000)
})

test_that("plant_distribution has correct types", {
  expect_type(plant_distribution$symbol, "character")
  expect_s3_class(plant_distribution$status, "factor")
  expect_equal(levels(plant_distribution$status), c("native", "introduced"))
  expect_type(plant_distribution$state, "character")
})

test_that("plant_distribution has no underscores in state names", {
  expect_false(any(grepl("_", plant_distribution$state)))
})

test_that("plant_distribution symbols exist in plants", {
  expect_true(all(plant_distribution$symbol %in% plants$symbol))
})
