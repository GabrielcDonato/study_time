final class UserException implements Exception {
  final String message;
  final StackTrace stackTrace;

  UserException({required this.message, required this.stackTrace});
}

//

final class FavoritePokemonsExceptions implements Exception {
  final String message;
  final StackTrace stackTrace;

  FavoritePokemonsExceptions({required this.message, required this.stackTrace});
}

final class GetSavedFavoritePokemonsExceptions implements Exception {
  final String message;
  final StackTrace stackTrace;

  GetSavedFavoritePokemonsExceptions(
      {required this.message, required this.stackTrace});
}

final class GetDetailsPokemonExceptions implements Exception {
  final String message;
  final StackTrace stackTrace;

  GetDetailsPokemonExceptions(
      {required this.message, required this.stackTrace});
}

final class GetAllPokemonExceptions implements Exception {
  final String message;
  final StackTrace stackTrace;

  GetAllPokemonExceptions({required this.message, required this.stackTrace});
}
