final class UserException implements Exception {
  final String message;
  final StackTrace stackTrace;

  UserException({required this.message, required this.stackTrace});
}

final class PokedexExceptions implements Exception {
  final String message;
  final StackTrace stackTrace;

  PokedexExceptions({required this.message, required this.stackTrace});
}

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
