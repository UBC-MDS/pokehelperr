
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
get_types <- function(pokemon_names) {
  # Function code (TBD in Milestone 3)
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
#' @examples
#' calc_resistances(list(list("Electric"), list("Fire", "Flying")))
calc_resistances <- function(team_list) {
  # Function code (TBD in Milestone 3)
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
#' @param team_list : list of list of strings
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
calc_weaknesses <- function(team_types) {
  # Function code (TBD in Milestone 3)
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
#'
#' @param current_team: list of strings
#' list of up to 5 pokémon names
#'
#' @return recommendation: string
#' the name of a pokémon that could be added to the input
#' team to make its weaknesses and resistances more balanced.
#' @export
#'
#' @examples
recommend <- function(current_team) {
  # Function code (TBD in Milestone 3)
}


