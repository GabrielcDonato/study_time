import 'package:dio/dio.dart';
import 'package:study_time/src/core/dio/pokedex_dio.dart';
import 'package:study_time/src/core/errors/exceptions/export_exceptions.dart';
import 'package:study_time/src/features/data/datasources/get_details_pokemon/get_details_pokemon_datasource.dart';
import 'package:study_time/src/features/data/models/get_details_pokemon/details_pokemon_model.dart';

class GetDetailsPokemonDatasourceImpl implements GetDetailsPokemonDatasource {
  final PokedexDio _dio;

  GetDetailsPokemonDatasourceImpl({
    required PokedexDio dio,
  }) : _dio = dio;

  @override
  Future<DetailsPokemonModel> call({required int pokemonId}) async {
    try {
      final response =
          await _dio.post('https://pokeapi.co/api/v2/pokemon/$pokemonId');

      return DetailsPokemonModel.fromJson(response.data);
    } on DioError catch (exception, stackTrace) {
      throw PokedexExceptions(
          message: exception.toString(), stackTrace: stackTrace);
    } catch (exception, stackTrace) {
      throw PokedexExceptions(
          message: 'Erro ao buscar pokemons', stackTrace: stackTrace);
    }
  }
}
