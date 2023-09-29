import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:study_time/src/features/data/datasources/get_saved_favorite_pokemons/get_saved_favorite_pokemons_datasource.dart';
import 'package:study_time/src/features/data/datasources/get_saved_favorite_pokemons/get_saved_favorite_pokemons_datasource_impl.dart';
import 'package:study_time/src/features/data/repositories/get_saved_favorite_pokemons/get_saved_favorite_pokemons_repository_impl.dart';
import 'package:study_time/src/features/domain/repositories/get_saved_favorite_pokemons/get_saved_favorite_pokemons_repository.dart';
import 'package:study_time/src/features/domain/usecases/get_saved_favorite_pokemons/get_saved_favorite_pokemons_usecase.dart';
import 'package:study_time/src/features/domain/usecases/get_saved_favorite_pokemons/get_saved_favorite_pokemons_usecase_impl.dart';

sealed class GetSavedGetSavedFavoritePokemonsInject {
  static void inject(Injector i) {
    i.add<GetSavedFavoritePokemonsDatasource>(
      () => GetSavedFavoritePokemonsDatasourceImpl(
        firebaseFirestore: i.get<FirebaseFirestore>(),
      ),
    );

    i.add<GetSavedFavoritePokemonsRepository>(
      () => GetSavedFavoritePokemonsRepositoryImpl(
        getSavedFavoritePokemonsDatasource:
            i.get<GetSavedFavoritePokemonsDatasource>(),
      ),
    );

    i.add<GetSavedFavoritePokemonsUsecase>(
      () => GetSavedFavoritePokemonsUsecaseImpl(
        getSavedFavoritePokemonsRepository:
            i.get<GetSavedFavoritePokemonsRepository>(),
      ),
    );
  }
}
