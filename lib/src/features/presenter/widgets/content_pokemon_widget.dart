import 'package:flutter/material.dart';
import 'package:study_time/src/core/arguments/details_pokemon_argument/details_pokemon_argument.dart';
import 'package:study_time/src/core/routes/export_routes.dart';
import 'package:study_time/src/features/domain/entities/get_all_pokemons/pokemon_entity.dart';
import 'package:study_time/src/features/domain/entities/get_saved_favorite_pokemons/saved_favorite_pokemon_entity.dart';
import 'package:study_time/src/features/presenter/widgets/pokemon_item_widget.dart';

class ContentPokemonWidget extends StatefulWidget {
  final List<PokemonEntity> pokemons;

  final String filter;
  const ContentPokemonWidget({
    Key? key,
    this.filter = '',
    required this.pokemons,
  }) : super(key: key);

  @override
  State<ContentPokemonWidget> createState() => _ContentPokemonWidgetState();
}

class _ContentPokemonWidgetState extends State<ContentPokemonWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 30,
      children: widget.pokemons
          .where(
            (pokemon) =>
                pokemon.name.toLowerCase().contains(widget.filter) ||
                pokemon.numPokemon.toLowerCase().contains(
                      widget.filter.replaceAll("#", ''),
                    ),
          )
          .map((pokemon) => PokemonItemWidget(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppNamedRoutes.detailsPokemonPage,
                    arguments: DetailsPokemonArgument(
                      numPokemon: pokemon.numPokemon,
                      image: pokemon.image,
                      color: pokemon.baseColor!,
                      name: pokemon.name,
                      height: pokemon.height,
                      weight: pokemon.weight,
                    ),
                  );
                },
                pokemon: pokemon,
                index: pokemon.id,
                name: pokemon.name,
              ))
          .toList(),
    );
  }
}
