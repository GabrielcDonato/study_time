import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_time/src/features/domain/entities/favorite_pokemons/favorite_pokemon_entity.dart';
import 'package:study_time/src/features/domain/entities/get_all_pokemons/pokemon_entity.dart';
import 'package:study_time/src/features/presenter/cubits/favorite_pokemons/favorite_pokemons_cubit.dart';

class PokemonItemWidget extends StatefulWidget {
  const PokemonItemWidget({
    Key? key,
    required this.pokemon,
    required this.onTap,
    required this.name,
    required this.index,
  }) : super(key: key);

  final PokemonEntity pokemon;
  final void Function() onTap;
  final int index;
  final String name;

  @override
  State<PokemonItemWidget> createState() => _PokemonItemWidgetState();
}

class _PokemonItemWidgetState extends State<PokemonItemWidget> {
  late final FavoritePokemonsCubit _favoritePokemonsCubit;

  @override
  void initState() {
    super.initState();
    _favoritePokemonsCubit = context.read<FavoritePokemonsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        elevation: 5,
        color: const Color(0xFFffffff),
        child: ListTile(
          title: Column(
            children: [
              BlocConsumer<FavoritePokemonsCubit, FavoritePokemonsState>(
                bloc: _favoritePokemonsCubit,
                listener: (context, state) {
                  if (state is FavoritePokemonsSuccess) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Pokemon adicionado a lista de favoritos'),
                      ),
                    );
                  }
                  if (state is FavoritePokemonsError) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async {
                          _favoritePokemonsCubit.addToFavorite(
                            favoritePokemonEntity: FavoritePokemonEntity(
                              idPokemon: widget.pokemon.numPokemon,
                              imagePokemon: widget.pokemon.image,
                              namePokemon: widget.pokemon.name,
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.heart_broken_outlined,
                        ),
                      ),
                      Text("#${widget.pokemon.numPokemon}"),
                    ],
                  );
                },
              ),
              Column(
                children: [
                  Image.network(
                    widget.pokemon.image,
                    height: 65,
                  ),
                  FittedBox(
                    child: Text(
                      widget.pokemon.name,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
