import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_time/src/core/colors/app_colors.dart';
import 'package:study_time/src/core/widgets/custom_snack_bar_widget.dart';
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
    required this.userId,
  }) : super(key: key);
  final String userId;
  final PokemonEntity pokemon;
  final VoidCallback onTap;
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
        elevation: 10,
        color: AppColors.secondaryColor,
        child: ListTile(
          title: Column(
            children: [
              BlocConsumer<FavoritePokemonsCubit, FavoritePokemonsState>(
                bloc: _favoritePokemonsCubit,
                listener: (context, state) {
                  if (state is FavoritePokemonsSuccess) {
                    CustomSnackBarWidget.show(
                      context: context,
                      backgroundColor: Colors.lightGreen,
                      title: 'Pokemon adicionado a lista de favoritos',
                    );
                  }
                  if (state is FavoritePokemonsError) {
                    CustomSnackBarWidget.show(
                      context: context,
                      title: state.message,
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
                            userId: widget.userId,
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
                    height: MediaQuery.sizeOf(context).height * 0.08,
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
