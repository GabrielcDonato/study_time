import 'package:get_it/get_it.dart';
import 'package:study_time/src/core/dio/pokedex_dio.dart';
import 'package:study_time/src/features/data/datasources/get_all_pokemons/get_all_pokemons_datasource.dart';
import 'package:study_time/src/features/data/datasources/get_all_pokemons/get_all_pokemons_datasource_impl.dart';
import 'package:study_time/src/features/data/repositories/get_all_pokemons/get_all_pokemons_repository_impl.dart';
import 'package:study_time/src/features/domain/repositories/get_all_pokemons/get_all_pokemons_repository.dart';
import 'package:study_time/src/features/domain/usecases/get_all_pokemons/get_all_pokemons_usecase.dart';
import 'package:study_time/src/features/domain/usecases/get_all_pokemons/get_all_pokemons_usecase_impl.dart';

sealed class GetAllPokemonsInject {
  static void inject(GetIt getIt) {
    getIt.registerFactory<GetAllPokemonsDatasource>(
      () => GetAllPokemonsDatasourceImpl(
        dio: getIt.get<PokedexDio>(),
      ),
    );

    getIt.registerFactory<GetAllPokemonsRepository>(
      () => GetAllPokemonsRepositoryImpl(
        getAllPokemonsDatasource: getIt.get<GetAllPokemonsDatasource>(),
      ),
    );

    getIt.registerFactory<GetAllPokemonsUsecase>(
      () => GetAllPokemonsUsecaseImpl(
        getAllPokemonsRepository: getIt.get<GetAllPokemonsRepository>(),
      ),
    );
  }
}
