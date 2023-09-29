import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:study_time/src/core/dio/pokedex_dio.dart';
import 'package:study_time/src/features/data/datasources/get_details_pokemon/get_details_pokemon_datasource.dart';
import 'package:study_time/src/features/data/datasources/get_details_pokemon/get_details_pokemon_datasource_impl.dart';
import 'package:study_time/src/features/data/repositories/get_details_pokemon/get_details_pokemon_repository_impl.dart';
import 'package:study_time/src/features/domain/repositories/get_details_pokemon/get_details_pokemon_repository.dart';
import 'package:study_time/src/features/domain/usecases/get_details_pokemon/get_details_pokemon_usecase.dart';
import 'package:study_time/src/features/domain/usecases/get_details_pokemon/get_details_pokemon_usecase_impl.dart';

sealed class GetDetailsPokemonInject {
  static void inject(Injector i) {
    i.add<GetDetailsPokemonDatasource>(
      () => GetDetailsPokemonDatasourceImpl(
        dio: i.get<PokedexDio>(),
      ),
    );

    i.add<GetDetailsPokemonRepository>(
      () => GetDetailsPokemonRepositoryImpl(
        getDetailsPokemonDatasource: i.get<GetDetailsPokemonDatasource>(),
      ),
    );

    i.add<GetDetailsPokemonUsecase>(
      () => GetDetailsPokemonUsecaseImpl(
        getDetailsPokemonRepository: i.get<GetDetailsPokemonRepository>(),
      ),
    );
  }
}
