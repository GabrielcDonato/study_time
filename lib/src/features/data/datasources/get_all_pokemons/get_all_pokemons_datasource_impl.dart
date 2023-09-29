import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:study_time/src/core/dio/pokedex_dio.dart';
import 'package:study_time/src/core/endpoints/endpoints.dart';
import 'package:study_time/src/core/errors/exceptions/exceptions.dart';
import 'package:study_time/src/features/data/datasources/get_all_pokemons/get_all_pokemons_datasource.dart';
import 'package:study_time/src/features/data/models/get_all_pokemons/get_all_pokemons_model.dart';

final class GetAllPokemonsDatasourceImpl implements GetAllPokemonsDatasource {
  final PokedexDio _dio;

  GetAllPokemonsDatasourceImpl({
    required PokedexDio dio,
  }) : _dio = dio;

  @override
  Future<List<PokemonsModel>> call() async {
    try {
      final response = await _dio.get(PokedexEndpoints.getAllPokemons);

      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((pokemon) => PokemonsModel.fromMap(pokemon)).toList();
    } on DioException catch (exception, stackTrace) {
      throw GetAllPokemonExceptions(
          message: exception.toString(), stackTrace: stackTrace);
    } catch (exception, stackTrace) {
      throw GetAllPokemonExceptions(
          message: 'Erro ao buscar pokemons', stackTrace: stackTrace);
    }
  }
}
