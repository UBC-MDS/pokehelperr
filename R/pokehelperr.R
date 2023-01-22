
#' get_types
#'
#' @param pokemon_names
#'
#' @return
#' @export
#'
#' @examples
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
#' @examples calc_resistances(list(list('Electric'), list('normal')))
calc_resistances <- function(team_list) {
  # Function code (TBD in Milestone 3)
}

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
#' @param current_team
#'
#' @return
#' @export
#'
#' @examples
recommend <- function(current_team) {
  # Function code (TBD in Milestone 3)
}

