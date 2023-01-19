
#' get_types
#'
#' @param pokemon_names
#'
#' @return
#' @export
#'
#' @examples
get_types <- function(pokemon_names){
  # Function code (TBD in Milestone 3)
}

#' calc_resistances
#'
#' @param team_list
#'
#' @return
#' @export
#'
#' @examples
calc_resistances <- function(team_list){
  # Function code (TBD)
}

#' Given a list of pokémon types present on a player's team,
#' calculate a measure of how weak the team is to each type in the game.
#'
#' Creates a dictionary in which the keys are each of the 18 types
#' in the game, and the values are integers measuring the level of
#' weakness the input team has to that key (type). Higher values indicate a
#' higher level of weakness to that type.
#'
#' @param team_list : list of list of strings
#'        list of pokémon types associated to the user's team obtained
#'        via `get_types`
#'
#' @return weaknesses : dictionary
#'       a dictionary containing all 18 pokémon types as keys,
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
recommend <- function(current_team){
  # Function code (TBD)
}

