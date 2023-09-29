// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_time/src/core/arguments/pokemon_argument/pokemon_argument.dart';
import 'package:study_time/src/features/presenter/cubits/favorite_pokemons/favorite_pokemons_cubit.dart';

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
  late final FavoritePokemonsCubit _favoritePokemonsCubit;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _getAllPokemonsCubit = context.read<GetAllPokemonsCubit>();
    _getAllPokemonsCubit.getAllPokemons();
    _userCubit = context.read<UserCubit>();
    _favoritePokemonsCubit = context.read<FavoritePokemonsCubit>();
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
          return const Material(child: Text("Deu erro"));
        }

        if (state is GetAllPokemonsSuccess) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100.0),
              child: AppBar(
                toolbarHeight: 200,
                backgroundColor: const Color(
                  0xffDC0A2D,
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: IconButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      color: Colors.white,
                      onPressed: () {
                        _userCubit.logout();
                      },
                      icon: const Icon(
                        Icons.logout,
                      ),
                    ),
                  ),
                ],
                title: SizedBox(
                  height: 32,
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
                      // hintText: 'Search',
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
