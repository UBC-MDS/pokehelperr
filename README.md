# pokehelperr

`pokehelperr` is a R package designed to assist Pokémon players in building teams of pokémon. Users can provide a list of pokémon currently on their team, and `pokehelperr` will recommend a suitable pokémon to add to the team based on the current team's overall weaknesses and resistances.

In the Pokémon game, players battle using teams of up to six pokémon. Each pokémon has a type, such as grass, water, or fire. Each type in the game is either weak to, resistant to, or neutrally effected by each other type in the game. If a player does not consider these weaknesses and resistances when creating their team of pokémon, they may find themselves in a scenario in which they are consistently struggling to win battles against certain types of pokémon. For a simple example, if a player were to use a team of six fire type pokémon, then they would likely struggle to win battles against water type pokémon. The preceding is obviously an extreme example, but in a competitive setting even a small imbalance in a team's weaknesses and resistances can cause major issues for a player.

The `pokehelperr` package aims to assist players in avoiding imbalances in weaknesses/resistances when building a pokémon team. Given a list of up to five pokémon currently on a team, `pokehelperr` will determine which types the team is most weak to which types the team is most resistant to. Based on this information, `pokehelperr` will then reccomend a pokémon that could be added to the current team to make its weaknesses and resistances more balanced.

(If you are reading this and aren't familiar with Pokémon, it might be helpful to note that "pokémon" is both the singular and plural form of the word, and also that lowercase "pokémon" refers to an individual character in the game, such as Pikachu, whereas capitalized "Pokémon" refers to the franchise/game.)


## Functions Included
- `add_team_members`: Given a list of pokémon names, determine the types of the pokémon using an existing tibble. 

- `calc_weaknesses`: Given a list of pokémon types, determine how many types in the list are weak to each type in the game. Creates a list in which the names are each of the 18 types in the game, and the values are integers ranging from 0 to the length of the input list of types.

- `calc_resistances`: Given a list of pokémon types, determine how many types in the list are resistant to each type in the game. Creates a list in which the names are each of the 18 types in the game, and the values are integers ranging from 0 to the length of the input list of types.

- `recommend`: Given a team of up to 5 pokémon, recommend a pokémon that could be added to the current team to make its weaknesses and resistances more balanced. This function first determines which types the team is most weak to which types the team is most resistant to via `calc_resistances` and `calc_weaknesses`, and then makes its recommendation based on this information.

## Datasets Included

- [pokémon.csv](https://gist.github.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6): Dataset containing details about each pokémon including its type.
- [chart.csv](https://github.com/zonination/pokemon-chart/blob/master/chart.csv): Dataset containing details abouts the weaknesses and strengths of each type of pokémon.

## Place in the R Ecosystem
There are websites and applications that help build pokémon teams, such as the [Mariland Team Builder](https://marriland.com/tools/team-builder/en/). However these tools simply present the player with a visual representation of their current team's weaknesses and resistances. They don't make recommendations. In other words, the existing tools simply given visual representations of the dictionaries created by `calc_weaknesses` and `calc_resistances`. There doesn't seem to be any existing R packages which will use the weaknesses/resistances data to make reccomendations for additional team members.

## Installation

```bash
# install.packages("devtools")
devtools::install_github("../pokehelperr")
```

## Usage

- TODO

## Contributors
- Raul Aguilar
- Jakob Thoms
- Ritisha Sharma
- Sneha Sunil

## Contributing

Interested in contributing? Check out the [contributing guidelines](https://github.com/UBC-MDS/pokehelperr/blob/main/.github/CONTRIBUTING.md). Please note that this project is released with a [Code of Conduct](https://github.com/UBC-MDS/pokehelperr/blob/main/CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.

## License

`pokehelperr` was created by Sneha Sunil, Jakob Thoms, Ritisha Sharma, Raul Aguilar. It is licensed under the terms of the MIT license.

