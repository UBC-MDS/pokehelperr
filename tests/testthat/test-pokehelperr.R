
test_that("`recommend` returns the correct type of output.", {
  output <- recommend(
    c('Pikachu', 'Charizard'),
    n_recommendations = 1,
    early_stop = FALSE # Do a full run for one test. Early stop for the rest.
  )
  expect_type(output, "character")

  n <- 3
  output <- recommend(
    c('Pikachu', 'Charizard'),
    n_recommendations = n,
    early_stop = TRUE
  )
  expect_type(output, "character")
  expect_equal(length(output), n)

  n <- 5
  output <- recommend(
    'Lucario',
    n_recommendations = n,
    early_stop = TRUE
  )
  expect_type(output, "character")
  expect_equal(length(output), n)
})

test_that("`calc_balance` returns the correct type of output.", {
  # Fixtures
  zero_resistances <- c('Normal'=0, 'Fire'=0, 'Water'=0, 'Electric'=0,
                        'Grass'=0, 'Ice'=0, 'Fighting'=0, 'Poison'=0,
                        'Ground'=0, 'Flying'=0, 'Psychic'=0, 'Bug'=0,
                        'Rock'=0, 'Ghost'=0, 'Dragon'=0, 'Dark'=0,
                        'Steel'=0, 'Fairy'=0)
  zero_weaknesses <- zero_resistances

  fire_water_resistances <- c('Normal'=0, 'Fire'=1, 'Water'=1, 'Electric'=0,
                              'Grass'=0, 'Ice'=0, 'Fighting'=0, 'Poison'=0,
                              'Ground'=0, 'Flying'=0, 'Psychic'=0, 'Bug'=0,
                              'Rock'=0, 'Ghost'=0, 'Dragon'=0, 'Dark'=0,
                              'Steel'=0, 'Fairy'=0)
  fire_water_weaknesses <- fire_water_resistances

  all_resistances <- c('Normal'=1, 'Fire'=1, 'Water'=1, 'Electric'=1,
                       'Grass'=1, 'Ice'=1, 'Fighting'=1, 'Poison'=1,
                       'Ground'=1, 'Flying'=1, 'Psychic'=1, 'Bug'=1,
                       'Rock'=1, 'Ghost'=1, 'Dragon'=1, 'Dark'=1,
                       'Steel'=1, 'Fairy'=1)
  all_weaknesses <- all_resistances


  output <- calc_balance(zero_resistances, zero_weaknesses)
  expect_type(output, "double")

  output <- calc_balance(fire_water_resistances, fire_water_weaknesses)
  expect_type(output, "double")

  output <- calc_balance(all_resistances, zero_weaknesses)
  expect_type(output, "double")

  output <- calc_balance(zero_resistances, all_weaknesses)
  expect_type(output, "double")
})

test_that("`calc_balance` returns reasonable values", {
  # Fixtures
  zero_resistances <- c('Normal'=0, 'Fire'=0, 'Water'=0, 'Electric'=0,
                        'Grass'=0, 'Ice'=0, 'Fighting'=0, 'Poison'=0,
                        'Ground'=0, 'Flying'=0, 'Psychic'=0, 'Bug'=0,
                        'Rock'=0, 'Ghost'=0, 'Dragon'=0, 'Dark'=0,
                        'Steel'=0, 'Fairy'=0)
  zero_weaknesses <- zero_resistances

  fire_water_resistances <- c('Normal'=0, 'Fire'=1, 'Water'=1, 'Electric'=0,
                              'Grass'=0, 'Ice'=0, 'Fighting'=0, 'Poison'=0,
                              'Ground'=0, 'Flying'=0, 'Psychic'=0, 'Bug'=0,
                              'Rock'=0, 'Ghost'=0, 'Dragon'=0, 'Dark'=0,
                              'Steel'=0, 'Fairy'=0)
  fire_water_weaknesses <- fire_water_resistances

  all_resistances <- c('Normal'=1, 'Fire'=1, 'Water'=1, 'Electric'=1,
                       'Grass'=1, 'Ice'=1, 'Fighting'=1, 'Poison'=1,
                       'Ground'=1, 'Flying'=1, 'Psychic'=1, 'Bug'=1,
                       'Rock'=1, 'Ghost'=1, 'Dragon'=1, 'Dark'=1,
                       'Steel'=1, 'Fairy'=1)
  all_weaknesses <- all_resistances

  # calc_balance should return zero for a team with no resistances nor weaknesses.
  actual <- calc_balance(zero_resistances, zero_weaknesses)
  expect_equal(actual, 0)

  # calc_balance should return zero for a team with equal and opposite resistances and weaknesses.
  actual <- calc_balance(fire_water_resistances, fire_water_weaknesses)
  expect_equal(actual, 0)

  # calc_balance should return a positive number for a team with resistances and no weaknesses.
  actual <- calc_balance(fire_water_resistances, zero_weaknesses)
  expect_gt(actual, 0)

  # calc_balance should return a negative number for a team with weaknesses and no resistances.
  actual <- calc_balance(zero_resistances, fire_water_weaknesses)
  expect_lt(actual, 0)

  # calc_balance should return higher numbers for teams with more resistances.
  actual_1 <- calc_balance(all_resistances, zero_weaknesses)
  actual_2 <- calc_balance(fire_water_resistances, zero_weaknesses)
  expect_gt(actual_1, actual_2)

  # calc_balance should return lower numbers for teams with more weaknesses.
  actual_1 <- calc_balance(zero_resistances, all_weaknesses)
  actual_2 <- calc_balance(zero_resistances, fire_water_weaknesses)
  expect_lt(actual_1, actual_2)
})
