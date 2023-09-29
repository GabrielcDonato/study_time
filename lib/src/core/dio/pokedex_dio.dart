import 'package:dio/io.dart';
import 'package:study_time/src/core/dio/pokedex_interceptor.dart';

final class PokedexDio extends DioForNative {
  PokedexDio() {
    interceptors.addAll([
      PokedexDioInterceptor(),
    ]);
  }
}
