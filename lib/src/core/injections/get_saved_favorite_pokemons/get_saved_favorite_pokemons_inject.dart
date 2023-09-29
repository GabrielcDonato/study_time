import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:study_time/src/features/data/datasources/get_saved_favorite_pokemons/get_saved_favorite_pokemons_datasource.dart';
import 'package:study_time/src/features/data/datasources/get_saved_favorite_pokemons/get_saved_favorite_pokemons_datasource_impl.dart';
import 'package:study_time/src/features/data/repositories/get_saved_favorite_pokemons/get_saved_favorite_pokemons_repository_impl.dart';
import 'package:study_time/src/features/domain/repositories/get_saved_favorite_pokemons/get_saved_favorite_pokemons_repository.dart';
import 'package:study_time/src/features/domain/usecases/get_saved_favorite_pokemons/get_saved_favorite_pokemons_usecase.dart';
import 'package:study_time/src/features/domain/usecases/get_saved_favorite_pokemons/get_saved_favorite_pokemons_usecase_impl.dart';

sealed class GetSavedGetSavedFavoritePokemonsInject {
  static void inject(GetIt getIt) {
    getIt.registerFactory<GetSavedFavoritePokemonsDatasource>(
      () => GetSavedFavoritePokemonsDatasourceImpl(
        firebaseFirestore: getIt.get<FirebaseFirestore>(),
      ),
    );

    getIt.registerFactory<GetSavedFavoritePokemonsRepository>(
      () => GetSavedFavoritePokemonsRepositoryImpl(
        getSavedFavoritePokemonsDatasource:
            getIt.get<GetSavedFavoritePokemonsDatasource>(),
      ),
    );

    getIt.registerFactory<GetSavedFavoritePokemonsUsecase>(
      () => GetSavedFavoritePokemonsUsecaseImpl(
        getSavedFavoritePokemonsRepository:
            getIt.get<GetSavedFavoritePokemonsRepository>(),
      ),
    );
  }
}
