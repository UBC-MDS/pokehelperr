% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pokehelperr.R
\name{get_types}
\alias{get_types}
\title{get_types}
\usage{
get_types(pokemon_names)
}
\arguments{
\item{pokemon_names}{a list of pokemon names that are on the users team}
}
\value{
pokemon_types a list of strings of pokémon types corresponding to
the pokémon names in the input list
}
\description{
Given a list of pokémon names,
determine the types of those pokémon using an existing dataset.

Creates a list with pokemon types by matching the pokemon names
to the names in a dataset and getting the corresponding type(s)
of the pokemon. The pokemon names are cleaned before looking for a match.
}
\examples{
get_types(list('Pikachu', 'Eevee', 'Charizard', ...))

}
