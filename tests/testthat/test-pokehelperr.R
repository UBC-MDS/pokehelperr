
test_that("`recommend` returns the correct type of output.", {
  output <- recommend(
    c('Pikachu', 'Charizard'),
    n_recommendations = 1,
    early_stop = False # Do a full run for one test. Early stop for the rest.
  )
  expect_type(output, "character")

  n <- 3
  output <- recommend(
    c('Pikachu', 'Charizard'),
    n_recommendations = n,
    early_stop = True
  )
  expect_type(output, "character")
  expect_equal(length(output), n)
})

test_that("`recommend` deals with errorneous user input in the case of a team with only one pokémon.", {
  actual <- recommend('Pikachu', early_stop = True)
  expected <- recommend(c('Pikachu'), early_stop = True)
  expect_equal(actual, expected)
})
