
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
