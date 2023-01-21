
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
calc_resistances <- function(team_list){
  # Function code (TBD)
}

#' calc_weaknesses
#'
#' @param team_list
#'
#' @return
#' @export
#'
#' @examples
calc_weaknesses <- function(team_list){
  # Function code (TBD)
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

