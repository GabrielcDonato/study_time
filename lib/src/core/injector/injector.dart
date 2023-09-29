import 'package:flutter_modular/flutter_modular.dart';
import 'package:study_time/src/core/injections/favorite_pokemons/favorite_pokemons_inject.dart';
import 'package:study_time/src/core/injections/firebase/firebase_inject.dart';
import 'package:study_time/src/core/injections/get_all_pokemons/get_all_pokemons_inject.dart';
import 'package:study_time/src/core/injections/get_details_pokemon/get_details_pokemon_inject.dart';
import 'package:study_time/src/core/injections/get_saved_favorite_pokemons/get_saved_favorite_pokemons_inject.dart';
import 'package:study_time/src/core/injections/pokedex_dio/pokedex_dio_inject.dart';
import 'package:study_time/src/core/injections/user/user_inject.dart';

sealed class InjectorApp {
  static Future<void> init(Injector i) async {
    PokedexDioInject.inject(i);
    FirebaseInject.inject(i);
    UserInject.inject(i);
    GetAllPokemonsInject.inject(i);
    GetDetailsPokemonInject.inject(i);
    FavoritePokemonsInject.inject(i);
    GetSavedGetSavedFavoritePokemonsInject.inject(i);
  }
}
