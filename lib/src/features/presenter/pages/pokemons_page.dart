import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_time/src/core/arguments/favorites_pokemons_argument/favorites_pokemons_argument.dart';
import 'package:study_time/src/core/arguments/pokemon_argument/pokemon_argument.dart';
import 'package:study_time/src/core/routes/app_named_routes.dart';

import 'package:study_time/src/features/presenter/cubits/get_all_pokemons/get_all_pokemons_cubit.dart';
import 'package:study_time/src/features/presenter/cubits/user/user_cubit.dart';
import 'package:study_time/src/features/presenter/widgets/content_pokemon_widget.dart';

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
      builder: (context, state) {
        if (state is GetAllPokemonsLoading) {
          return const Material(
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          );
        }
        if (state is GetAllPokemonsError) {
          return const Material(
            child: Text(
              "Deu erro",
            ),
          );
        }

        if (state is GetAllPokemonsSuccess) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100.0),
              child: AppBar(
                actions: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
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
                toolbarHeight: 200,
                backgroundColor: const Color(
                  0xffDC0A2D,
                ),
                title: SizedBox(
                  height: 50,
                  width: 280,
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: Colors.red,
                      hintStyle: const TextStyle(
                        color: Color(
                          0xff666666,
                        ),
                        fontSize: 10,
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      _getAllPokemonsCubit.filterPokemon(namePokemon: value);
                    },
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
                    color: const Color(
                      0xffDC0A2D,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
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
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
