import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:study_time/src/core/arguments/favorites_pokemons_argument/favorites_pokemons_argument.dart';
import 'package:study_time/src/core/arguments/pokemon_argument/pokemon_argument.dart';
import 'package:study_time/src/core/colors/app_colors.dart';
import 'package:study_time/src/core/routes/app_named_routes.dart';
import 'package:study_time/src/core/widgets/hide_keyboard_widget.dart';

import 'package:study_time/src/features/presenter/cubits/get_all_pokemons/get_all_pokemons_cubit.dart';
import 'package:study_time/src/features/presenter/cubits/user/user_cubit.dart';
import 'package:study_time/src/features/presenter/widgets/content_pokemon_widget.dart';

import '../../../core/widgets/general_loading_widget.dart';

class PokemonsPage extends StatefulWidget {
  final PokemonArgument argument;
  const PokemonsPage({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  late final GetAllPokemonsCubit _getAllPokemonsCubit;
  late final UserCubit _userCubit;
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _getAllPokemonsCubit = context.read<GetAllPokemonsCubit>();

    _getAllPokemonsCubit.getAllPokemons();
    _userCubit = context.read<UserCubit>();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllPokemonsCubit, GetAllPokemonsState>(
      bloc: _getAllPokemonsCubit,
      builder: (context, state) {
        if (state is GetAllPokemonsLoading) {
          return const Material(
            child: GeneralLoadingWidget(),
          );
        }
        if (state is GetAllPokemonsError) {
          return const Material(
            child: Center(
              child: Text(
                "Ocorreu um erro no carregamento da página, por favor tente novamente.",
              ),
            ),
          );
        }

        if (state is GetAllPokemonsSuccess) {
          return HideKeyboardWidget(
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.sizeOf(context).height * 0.15),
                child: WillPopScope(
                  //Todo gostaria de sair do app?
                  onWillPop: () async => false,
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    actions: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Modular.to.pushNamed(
                              AppNamedRoutes.favoritePokemonsPage,
                              arguments: FavoritesPokemonsArgument(
                                uId: widget.argument.uId,
                              ),
                            ),
                            icon: const Icon(
                              Icons.heart_broken,
                            ),
                          ),
                          IconButton(
                            onPressed: () => _userCubit.logout(),
                            icon: const Icon(
                              Icons.logout,
                            ),
                          ),
                        ],
                      )
                    ],
                    toolbarHeight: MediaQuery.sizeOf(context).height,
                    backgroundColor: AppColors.primaryColor,
                    title: SizedBox(
                      child: TextField(
                        controller: _searchController,
                        style: const TextStyle(color: Colors.black),
                        cursorColor: AppColors.primaryColor,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.secondaryColor),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.secondaryColor),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          filled: true,
                          fillColor: AppColors.secondaryColor,
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: AppColors.primaryColor,
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          _getAllPokemonsCubit.filterPokemon(
                              namePokemon: value);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.secondaryColor),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ContentPokemonWidget(
                              userId: widget.argument.uId,
                              pokemons: state.pokemons,
                              filter: state.filter ?? '',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
