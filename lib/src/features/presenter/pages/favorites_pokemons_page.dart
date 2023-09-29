import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_time/src/core/arguments/favorites_pokemons_argument/favorites_pokemons_argument.dart';
import 'package:study_time/src/core/colors/app_colors.dart';
import 'package:study_time/src/core/widgets/custom_snack_bar_widget.dart';
import 'package:study_time/src/core/widgets/general_loading_widget.dart';
import 'package:study_time/src/features/presenter/cubits/export_cubits.dart';
import 'package:study_time/src/features/presenter/cubits/get_saved_favorite_pokemons/get_saved_favorite_pokemons_cubit.dart';

class FavoritesPokemonsPage extends StatefulWidget {
  final FavoritesPokemonsArgument argument;
  const FavoritesPokemonsPage({super.key, required this.argument});

  @override
  State<FavoritesPokemonsPage> createState() => _FavoritesPokemonsPageState();
}

class _FavoritesPokemonsPageState extends State<FavoritesPokemonsPage> {
  late final GetSavedFavoritePokemonsCubit _getSavedFavoritePokemonsCubit;
  late final FavoritePokemonsCubit _favoritePokemonsCubit;

  @override
  void initState() {
    super.initState();

    _getSavedFavoritePokemonsCubit =
        context.read<GetSavedFavoritePokemonsCubit>()
          ..getFavorites(
            userId: widget.argument.uId,
          );

    _favoritePokemonsCubit = context.read<FavoritePokemonsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: const Text('Favoritos'),
      ),
      body: BlocBuilder<GetSavedFavoritePokemonsCubit,
          GetSavedFavoritePokemonsState>(
        bloc: _getSavedFavoritePokemonsCubit,
        builder: (context, state) {
          if (state is GetSavedFavoritePokemonsLoading) {
            return const GeneralLoadingWidget();
          }
          if (state is GetSavedFavoritePokemonsSuccessEmpty) {
            return const Center(
              child: Text(
                'Você não possui nenhum pokemon nos favoritos',
              ),
            );
          }
          if (state is GetSavedFavoritePokemonsSuccess) {
            return ListView.builder(
              itemCount:
                  state.getSavedFavoritePokemonsEntity.savedPokemons.length,
              itemBuilder: (context, index) {
                return BlocConsumer<FavoritePokemonsCubit,
                    FavoritePokemonsState>(
                  listener: (context, state) {
                    if (state is RemoveFavoritePokemonsSuccess) {
                      CustomSnackBarWidget.show(
                        context: context,
                        backgroundColor: AppColors.primaryColor,
                        title: 'Pokemon removido da lista de favoritos',
                      );
                    }
                    if (state is FavoritePokemonsError) {
                      CustomSnackBarWidget.show(
                        context: context,
                        title: state.message,
                      );
                    }
                  },
                  builder: (context, _) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      state.getSavedFavoritePokemonsEntity
                                          .savedPokemons[index].imagePokemon,
                                      height: 80,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        state.getSavedFavoritePokemonsEntity
                                            .savedPokemons[index].namePokemon,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () async {
                                _favoritePokemonsCubit
                                    .removeFromFavorite(
                                      pokemonId: state
                                          .getSavedFavoritePokemonsEntity
                                          .savedPokemons[index]
                                          .idPokemon,
                                      userId: widget.argument.uId,
                                    )
                                    .then(
                                      (_) => {
                                        _getSavedFavoritePokemonsCubit
                                            .getFavorites(
                                          userId: widget.argument.uId,
                                        ),
                                      },
                                    );
                              },
                              icon: const Icon(
                                Icons.remove_circle_outline_rounded,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }

          if (state is GetSavedFavoritePokemonsError) {
            return const Text('deu erro');
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
