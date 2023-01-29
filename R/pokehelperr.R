
#' get_types
#'
#' @description
#' Given a list of pokémon names,
#' determine the types of those pokémon using an existing dataset.
#'
#' Creates a list with pokemon types by matching the pokemon names
#' to the names in a dataset and getting the corresponding type(s)
#' of the pokemon. The pokemon names are cleaned before looking for a match.
#'
#' @param pokemon_names a list of pokemon names that are on the users team
#'
#' @return pokemon_types a list of strings of pokémon types corresponding to
#'         the pokémon names in the input list
#'
#' @export
#'
#' @examples
#' get_types(list('Pikachu', 'Eevee', 'Charizard', ...))
#'
get_types <- function(pokemon_names) {
  # Function code (TBD in Milestone 3)
  if (is.character(pokemon_names)){
      pokemon_names = list(c(pokemon_names))
    }

    assert("Input is a list of pokemon names.", {
       is.list(pokemon_names)
    })
    assert("Input should be a non-empty list of pokemon names.", {
      length(list) > 0
    })
    assert("Input should be a list of pokemon names.", {
      is.character(pokemon_names[[1]])
    })

    names_types_df  <- read.csv('data/pokemon.csv')

    names_types_df <- names_types_df |>
        dplyr::mutate(Name = glue::trim(Name), Name = tolower(Name))

    name_with_symbol <- stringr::str_extract(names_types_df$Name, ".*[^\\w\\s].*")
    name_with_symbol <- name_with_symbol[!is.na(name_with_symbol)]

    poke_types <- list()
    for (name in pokemon_names){
        name <- glue::trim(name)
        name <- tolower(name)

        if (!(name %in% name_with_symbol)){
            name <- stringr::str_remove_all(name, "[^a-zA-Z0-9 ]")
        }

        type <- names_types_df |>
          dplyr::filter(Name == name)

        assert("Pokemon not in the list", {
          (nrow(type) > 0)
        })

        if (type$`Type.2` != ""){
          poke_types[[length(poke_types)+1]] <- list(type$`Type.1`, type$`Type.2`)
        }
        else {
          poke_types[[length(poke_types)+1]] <- list(type$`Type.1`)
        }
    }

    return (poke_types)
}


#' calc_resistances
#'
#' @description
#' Given a list of pokémon types present on a player's team,
#' calculate a measure of how resistant the team is to each type in the game.
#'
#' Creates a list in which the names are each of the 18 types
#' in the game, and the values are integers measuring the level of
#' resistance the input team has to that type. Higher values indicate a
#' higher level of resistance to that type (name).

#' @param team_list a list of Pokemon types.
#'
#' @return resistance_list a list of all Pokemon names and integers
# '                        measuring the level of resistance the input
#'                         team has to that type as values.
#'
#' @export
#'
#' @examples
#' calc_resistances(list(list("Electric"), list("Fire", "Flying")))
#'
calc_resistances <- function(team_list) {
  # Function code (TBD in Milestone 3)
  c('Normal' = 1 , 'Fire' = 3, 'Water' = 1 ) # Temporary placeholder
}


#' calc_weaknesses
#'
#' @description
#' Given a list of pokémon types present on a player's team,
#' calculate a measure of how weak the team is to each type in the game.
#'
#' Creates a list in which the keys are each of the 18 types
#' in the game, and the values are integers measuring the level of
#' weakness the input team has to that key (type). Higher values indicate a
#' higher level of weakness to that type.
#'
#' @param team_list : list of character vectors
#'        list of pokémon types associated to the user's team obtained
#'        via `get_types`
#'
#' @return weaknesses : list
#'       a list containing all 18 pokémon types
#'       and integers measuring the level of weakness the input team
#'       has to that type as values.
#'
#' @export
#'
#' @examples
#' calc_weaknesses(list(list("Electric"), list("Fire", "Flying")))
#'
calc_weaknesses <- function(team_types) {

  if (length(team_types) == 0) {
    stop("Input should be a non-empty list of pokemon types.")
  }

  if (!is.list(team_types) || !all(sapply(team_types, is.character))) {
    stop("Input should be a list of character vectors of pokemon types.")
  }

  data_location <- paste0(here::here(), '/data/type_chart.csv')
  weakness_df <- readr::read_csv(data_location, show_col_types = FALSE)

  all_types <- weakness_df$Attacking
  weaknesses <- stats::setNames(rep(0, length(all_types)), all_types)

  for (i in seq_along(all_types)){
    for (type_combo in team_types) {
      row <- weakness_df |> dplyr::slice(i)

      val1 <- row |> dplyr::pull(type_combo[1])

      if (length(type_combo) == 1) {
        val2 <- 1
      } else {
        val2 <- row |> dplyr::pull(type_combo[2])
      }

      if (val1 == 0) {
        next
      } else if ((val1 == 0.5 && val2 == 2) || (val1 == 2 && val2 == 0.5)) {
        next
      } else if (val1 == 2 && val2 == 2) {
        weaknesses[i] <- weaknesses[i] + 2
      } else if ((val1 == 1 && val2 == 2) || (val1 == 2 && val2 == 1)) {
        weaknesses[i] <- weaknesses[i] + 1
      }
    }
  }
  return(weaknesses)
}

#' recommend
#'
#' @description Given a team of up to 5 pokémon, recommend a
#' pokémon that could be added to the
#' current team to make its weaknesses and
#' resistances more balanced.
#'
#' This function first determines which types the
#' team is most weak to and which types the team is
#' most resistant to via `calc_resistances` and
#' `calc_weaknesses`, and then makes its recommendation
#' based on this information.
#' In particular, it uses `calc_balance` together a brute-force search of
#' all ~700 pokémon to determine its recommendation based on the objective of
#' maximizing balance.
#'
#' @param current_team : character vector
#' character vector of up to 5 pokémon names
#' @param n_recommendations : integer
#' number of pokemon to recommend (default = 1).
#' @param include_legendaries : boolean
#' whether or not to include legendary pokémon in
#' the recommendations (default = False).
#' @param inlude_megas : boolean
#' whether or not to include Mega pokémon in
#' the recommendations (default = False).
#' @param verbose : boolean
#' whether or not to print progress updates during the brute-force search.
#' @param early_stop : boolean
#' whether or not to stop the brute force search early
#' (for speeding up unit testing) (default = False).
#'
#' @return recommendation : character vector
#' the name of a pokémon that could be added to the input
#' team to make its weaknesses and resistances more balanced.
#' @export
#'
#' @examples
#' recommend(c('Pikachu', 'Eevee', 'Charizard'))
#'
recommend <- function(current_team, n_recommendations=1,
    include_legendaries=FALSE, include_megas=FALSE,
    verbose=TRUE, early_stop=FALSE) {

  data_location <- paste0(here::here(), '/data/pokemon.csv')
  pokemon_df <- readr::read_csv(data_location, show_col_types = FALSE)
  if (!include_legendaries){
    pokemon_df <- pokemon_df |> dplyr::filter(Legendary == FALSE)
  }
  if (!include_megas){
    pokemon_df <- pokemon_df |> dplyr::filter(!stringr::str_detect(Name, "Mega"))
  }

  team_types <- get_types(current_team)
  current_resistances <- calc_resistances(team_types)
  current_weaknesses <- calc_weaknesses(team_types)

  results_df <- pokemon_df |>
    dplyr::mutate(Balance = rlang::rep_along(Name, -Inf)) |>
    dplyr::rename(Type_1 = `Type 1`, Type_2 = `Type 2`)

  # Loop through all possible pokemon that could be added to the team
  for (i in seq_along(results_df$Name)){
    pkmn_types <- c(results_df$Type_1[i], results_df$Type_2[i])
    if (is.na(pkmn_types[2])){
      pkmn_types <- head(pkmn_types, -1)
    }

    pkmn_resistances <- calc_resistances(list(pkmn_types))
    pkmn_weaknesses <- calc_weaknesses(list(pkmn_types))

    # add the pokemon's resistances to the current team's resistances
    new_resistances <- current_resistances
    for (j in seq_along(new_resistances)){
      new_resistances[j] = current_resistances[j] + pkmn_resistances[j]
    }

    # add the pokemon's weaknesses to the current team's weaknesses
    new_weaknesses <- current_weaknesses
    for (j in seq_along(new_weaknesses)){
      new_weaknesses[j] = current_weaknesses[j] + pkmn_weaknesses[j]
    }

    results_df$Balance[i] <- calc_balance(new_resistances, new_weaknesses)

    if (verbose && (i %% 100 == 0 || i == 1)){
      print(paste0('Iteration number ', i, ' of ', nrow(results_df), '.'))
    }
    if (early_stop && i > 30){
      print('Stopping early because `early_stop = TRUE`.')
      print('Normally this is only used for testing.')
      break
    }
  }

  results_df <- results_df |> dplyr::arrange(
    dplyr::desc(Balance),
    dplyr::desc(Total)
  )

  if (n_recommendations == 1){
    return(results_df$Name[1])
  }

  temp_df <- results_df
  recommendations <- c()
  for (i in seq(n_recommendations)){
    recommendations <- append(recommendations, temp_df$Name[1])
    current_best_balance <- temp_df$Balance[1]
    temp_df <- temp_df |> dplyr::filter(Balance != current_best_balance) |>
      dplyr::arrange(
        dplyr::desc(Balance),
        dplyr::desc(Total)
      )
  }

  return(recommendations)
}


#' calc_balance
#'
#' @description Calculate a measure of how balanced a team is using its
#' weaknesses and resistances.
#' Higher values indicate a more balanced team.
#'
#' @param resistances: named vector of resistances obtained from calc_resistances
#' @param weaknesses: named vector of weaknesses obtained from calc_weaknesses
#'
#' @return  balance : float
#' measure of how balanced the team is.
#' @export
#'
#' @examples
#' calc_balance(c('Normal' = 0, 'Fire' = 3), c('Normal' = 1, 'Fire' = 2))
#'
calc_balance <- function(resistances, weaknesses) {

  type_advantages <- resistances
  for (j in seq_along(type_advantages)){
    delta = resistances[j] - weaknesses[j]

    # Peicewise function to penalize negative values more
    # (i.e. to favor penalizing weaknesses over rewaring resistances)
    if (delta >= 0){
      type_advantages[j] = delta ** (3 / 4)
    }
    else{
      type_advantages[j] = -(-delta) ** (3 / 2)
    }
  }

  balance <- sum(type_advantages)
  return(balance)
}
