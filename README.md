# pokehelperr

`pokehelperr` is an R package designed to assist Pokémon players in building teams of pokémon. Users can provide a list of pokémon currently on their team, and `pokehelperr` will recommend a suitable pokémon to add to the team based on the current team's overall weaknesses and resistances.

In the Pokémon game, players battle using teams of up to six pokémon. Each pokémon has a type, such as grass, water, or fire. Each type in the game is either weak to, resistant to, or neutrally effected by each other type in the game. If a player does not consider these weaknesses and resistances when creating their team of pokémon, they may find themselves in a scenario in which they are consistently struggling to win battles against certain types of pokémon. For a simple example, if a player were to use a team of six fire type pokémon, then they would likely struggle to win battles against water type pokémon. The preceding is obviously an extreme example, but in a competitive setting even a small imbalance in a team's weaknesses and resistances can cause major issues for a player.

The `pokehelperr` package aims to assist players in avoiding imbalances in weaknesses/resistances when building a pokémon team. Given a list of up to five pokémon currently on a team, `pokehelperr` will determine which types the team is most weak to which types the team is most resistant to. Based on this information, `pokehelperr` will then reccomend a pokémon that could be added to the current team to make its weaknesses and resistances more balanced.

(If you are reading this and aren't familiar with Pokémon, it might be helpful to note that "pokémon" is both the singular and plural form of the word, and also that lowercase "pokémon" refers to an individual character in the game, such as Pikachu, whereas capitalized "Pokémon" refers to the franchise/game.)


## Functions Included

- `get_types`: Given a list of pokémon names, determine the types of those pokémon using an existing dataset.
<br>

- `calc_resistances`:  Given a list of pokémon types present on a player's team,
    calculate a measure of how resistant the team is to each type in the game.

    - Creates a list in which the names are each of the 18 types
    in the game, and the values are integers measuring the level of
    resistance the input team has to that type. Higher values indicate a
    higher level of resistance to that type.
<br><br>

- `calc_weaknesses`: Given a list of pokémon types present on a player's team,
    calculate a measure of how weak the team is to each type in the game.

    - Creates a list in which the names are each of the 18 types
    in the game, and the values are integers measuring the level of
    weakness the input team has to that type. Higher values indicate a
    higher level of weakness to that type.
<br><br>

- `recommend`: Given a team of up to 5 pokémon, recommend a
    pokémon that could be added to the
    current team to make its weaknesses and
    resistances more balanced.
    - Determines which types the
    team is most resistant to and weak to via `calc_resistances` and
    `calc_weaknesses`, and then makes its recommendation
    based on this information.
    - In particular, it uses `calc_balance` together a brute-force search of
    all ~700 pokémon to determine its recommendation based on the objective of
    maximizing balance.
<br><br>

- `calc_balance`: Calculate a measure of how balanced a pokémon team is using its
    weaknesses and resistances. Higher values indicate a more balanced team.

## Datasets Included

- [pokémon.csv](https://github.com/UBC-MDS/pokehelperr/blob/main/data/pokemon.csv): Dataset containing details about each pokémon including its name, type(s), and base stats.
- [type_chart.csv](https://github.com/UBC-MDS/pokehelperr/blob/main/data/type_chart.csv): Dataset containing details abouts the weaknesses and strengths of each type of pokémon.

## Place Within the R Ecosystem
There are websites and applications that help build pokémon teams, such as the [Mariland Team Builder](https://marriland.com/tools/team-builder/en/). However these tools simply present the player with a visual representation of their current team's weaknesses and resistances. They don't make recommendations. In other words, the existing tools simply given visual representations of the dictionaries created by `calc_weaknesses` and `calc_resistances`. There doesn't seem to be any existing R packages which will use the weaknesses/resistances data to make reccomendations for additional team members.

## Installation

```bash
# install.packages("devtools")
devtools::install_github("../pokehelperr")
```

## Usage

- TO-DO

## Contributors
- Raul Aguilar
- Jakob Thoms
- Ritisha Sharma
- Sneha Sunil

## Contributing

Interested in contributing? Check out the [contributing guidelines](https://github.com/UBC-MDS/pokehelperr/blob/main/CONTRIBUTING.md). Please note that this project is released with a [Code of Conduct](https://github.com/UBC-MDS/pokehelperr/blob/main/CONDUCT.md). By contributing to this project, you agree to abide by its terms.

## License

`pokehelperr` was created by Jakob Thoms, Ritisha Sharma, Raul Aguilar, and Sneha Sunil. It is licensed under the terms of the MIT license.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)  
