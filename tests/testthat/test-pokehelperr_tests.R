test_that("calc_weaknesses returns valid results", {
  input_list <- list(list("Fire"), list("Steel", "Flying"), list("Grass", "Ice"))
  actual <- calc_weaknesses(input_list)
  expected<- c(Normal = 0, Fire = 3, Water = 1, Electric = 1, Grass = 0, Ice = 0, Fighting = 1,
                        Poison = 1, Ground = 1, Flying = 1, Psychic = 0, Bug = 1, Rock = 2, Ghost = 0, 
                        Dragon = 0, Dark = 0, Steel = 1, Fairy = 0)
  expect_equal(actual, expected)
  expect_true(is.vector(actual))
})

test_that("Expects error when the input is invalid", {
  expect_error(calc_weaknesses(list()), "Input should be a non-empty list of pokemon types.")
  expect_error(calc_weaknesses(list("Fire")), "Input should be a list of lists of pokemon types.")
  expect_error(calc_weaknesses(list(list(2))), "Input should be a list of lists of strings")
  expect_error(calc_weaknesses(list(list())), "Input should be a non-empty list of non-empty lists of pokemon types.")
})