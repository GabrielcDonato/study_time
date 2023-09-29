import 'package:get_it/get_it.dart';
import 'package:study_time/src/core/dio/pokedex_dio.dart';

sealed class PokedexDioInject {
  static void inject(GetIt getIt) {
    getIt.registerSingleton<PokedexDio>(PokedexDio());
  }
}
