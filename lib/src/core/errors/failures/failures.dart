abstract interface class Failure {
  final String? message;

  Failure({required this.message});

  @override
  bool operator ==(covariant Failure other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

final class UserFailure extends Failure {
  UserFailure({required super.message});
}

final class GetAllPokemonsFailure extends Failure {
  GetAllPokemonsFailure({required super.message});
}

final class FavoritePokemonsFailure extends Failure {
  FavoritePokemonsFailure({required super.message});
}

final class GetSavedFavoritePokemonsFailure extends Failure {
  GetSavedFavoritePokemonsFailure({required super.message});
}
