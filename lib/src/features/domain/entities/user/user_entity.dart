base class UserEntity {
  final String email;
  final String password;

  UserEntity({required this.email, required this.password});

  @override
  bool operator ==(covariant UserEntity other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
