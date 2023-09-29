import 'package:study_time/src/core/get_it/get_it_instance.dart';
import 'package:study_time/src/core/injections/favorite_pokemons/favorite_pokemons_inject.dart';
import 'package:study_time/src/core/injections/firebase/firebase_inject.dart';
import 'package:study_time/src/core/injections/get_all_pokemons/get_all_pokemons_inject.dart';
import 'package:study_time/src/core/injections/get_details_pokemon/get_details_pokemon_inject.dart';
import 'package:study_time/src/core/injections/get_saved_favorite_pokemons/get_saved_favorite_pokemons_inject.dart';
import 'package:study_time/src/core/injections/pokedex_dio/pokedex_dio_inject.dart';
import 'package:study_time/src/core/injections/user/user_inject.dart';

sealed class Injector {
  static Future<void> init() async {
    PokedexDioInject.inject(getIt);
    FirebaseInject.inject(getIt);
    UserInject.inject(getIt);
    GetAllPokemonsInject.inject(getIt);
    GetDetailsPokemonInject.inject(getIt);
    FavoritePokemonsInject.inject(getIt);
    GetSavedGetSavedFavoritePokemonsInject.inject(getIt);
  }
}
