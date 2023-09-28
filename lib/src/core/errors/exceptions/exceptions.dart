final class UserException implements Exception {
  final String message;
  final StackTrace stackTrace;

  UserException({required this.message, required this.stackTrace});
}
