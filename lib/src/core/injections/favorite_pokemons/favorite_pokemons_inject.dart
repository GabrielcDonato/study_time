import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:study_time/src/features/data/datasources/favorite_pokemons/favorite_pokemons_datasource.dart';
import 'package:study_time/src/features/data/datasources/favorite_pokemons/favorite_pokemons_datasource_impl.dart';
import 'package:study_time/src/features/data/repositories/favorite_pokemons/favorite_pokemons_repository_impl.dart';
import 'package:study_time/src/features/domain/repositories/favorite_pokemons/favorite_pokemons_repository.dart';
import 'package:study_time/src/features/domain/usecases/favorite_pokemons/add_favorite_pokemon_usecase.dart';
import 'package:study_time/src/features/domain/usecases/favorite_pokemons/add_favorite_pokemon_usecase_impl.dart';
import 'package:study_time/src/features/domain/usecases/favorite_pokemons/remove_favorite_pokemon_usecase.dart';
import 'package:study_time/src/features/domain/usecases/favorite_pokemons/remove_favorite_pokemon_usecase_impl.dart';

sealed class FavoritePokemonsInject {
  static void inject(Injector i) {
    i.add<FavoritePokemonsDatasource>(
      () => FavoritePokemonsDatasourceImpl(
        firebaseFirestore: i.get<FirebaseFirestore>(),
      ),
    );

    i.add<FavoritePokemonsRepository>(
      () => FavoritePokemonsRepositoryImpl(
        favoritePokemonsDatasource: i.get<FavoritePokemonsDatasource>(),
      ),
    );

    i.add<AddFavoritePokemonUsecase>(
      () => AddFavoritePokemonUsecaseImpl(
        favoritePokemonsRepository: i.get<FavoritePokemonsRepository>(),
      ),
    );

    i.add<RemoveFavoritePokemonUsecase>(
      () => RemoveFavoritePokemonUsecaseImpl(
        favoritePokemonsRepository: i.get<FavoritePokemonsRepository>(),
      ),
    );
  }
}
