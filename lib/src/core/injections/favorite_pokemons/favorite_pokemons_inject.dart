import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:study_time/src/features/data/datasources/favorite_pokemons/favorite_pokemons_datasource.dart';
import 'package:study_time/src/features/data/datasources/favorite_pokemons/favorite_pokemons_datasource_impl.dart';
import 'package:study_time/src/features/data/repositories/favorite_pokemons/favorite_pokemons_repository_impl.dart';
import 'package:study_time/src/features/domain/repositories/favorite_pokemons/favorite_pokemons_repository.dart';
import 'package:study_time/src/features/domain/usecases/favorite_pokemons/add_favorite_pokemon_usecase.dart';
import 'package:study_time/src/features/domain/usecases/favorite_pokemons/add_favorite_pokemon_usecase_impl.dart';
import 'package:study_time/src/features/domain/usecases/favorite_pokemons/remove_favorite_pokemon_usecase.dart';
import 'package:study_time/src/features/domain/usecases/favorite_pokemons/remove_favorite_pokemon_usecase_impl.dart';

sealed class FavoritePokemonsInject {
  static void inject(GetIt getIt) {
    getIt.registerFactory<FavoritePokemonsDatasource>(
      () => FavoritePokemonsDatasourceImpl(
        firebaseFirestore: getIt.get<FirebaseFirestore>(),
      ),
    );

    getIt.registerFactory<FavoritePokemonsRepository>(
      () => FavoritePokemonsRepositoryImpl(
        favoritePokemonsDatasource: getIt.get<FavoritePokemonsDatasource>(),
      ),
    );

    getIt.registerFactory<AddFavoritePokemonUsecase>(
      () => AddFavoritePokemonUsecaseImpl(
        favoritePokemonsRepository: getIt.get<FavoritePokemonsRepository>(),
      ),
    );

    getIt.registerFactory<RemoveFavoritePokemonUsecase>(
      () => RemoveFavoritePokemonUsecaseImpl(
        favoritePokemonsRepository: getIt.get<FavoritePokemonsRepository>(),
      ),
    );
  }
}
