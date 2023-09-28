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
