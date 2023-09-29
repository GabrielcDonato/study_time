import 'package:flutter_modular/flutter_modular.dart';
import 'package:study_time/src/core/dio/pokedex_dio.dart';

sealed class PokedexDioInject {
  static void inject(Injector i) {
    i.addSingleton<PokedexDio>(() => PokedexDio());
  }
}
