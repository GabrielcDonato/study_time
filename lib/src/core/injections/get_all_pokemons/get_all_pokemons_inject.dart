import 'package:flutter_modular/flutter_modular.dart';
import 'package:study_time/src/core/dio/pokedex_dio.dart';
import 'package:study_time/src/features/data/datasources/get_all_pokemons/get_all_pokemons_datasource.dart';
import 'package:study_time/src/features/data/datasources/get_all_pokemons/get_all_pokemons_datasource_impl.dart';
import 'package:study_time/src/features/data/repositories/get_all_pokemons/get_all_pokemons_repository_impl.dart';
import 'package:study_time/src/features/domain/repositories/get_all_pokemons/get_all_pokemons_repository.dart';
import 'package:study_time/src/features/domain/usecases/get_all_pokemons/get_all_pokemons_usecase.dart';
import 'package:study_time/src/features/domain/usecases/get_all_pokemons/get_all_pokemons_usecase_impl.dart';

sealed class GetAllPokemonsInject {
  static void inject(Injector i) {
    i.add<GetAllPokemonsDatasource>(
      () => GetAllPokemonsDatasourceImpl(
        dio: i.get<PokedexDio>(),
      ),
    );

    i.add<GetAllPokemonsRepository>(
      () => GetAllPokemonsRepositoryImpl(
        getAllPokemonsDatasource: i.get<GetAllPokemonsDatasource>(),
      ),
    );

    i.add<GetAllPokemonsUsecase>(
      () => GetAllPokemonsUsecaseImpl(
        getAllPokemonsRepository: i.get<GetAllPokemonsRepository>(),
      ),
    );
  }
}
