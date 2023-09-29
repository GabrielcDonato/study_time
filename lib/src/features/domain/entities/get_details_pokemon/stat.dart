base class StatEntity {
  final String name;
  const StatEntity({
    required this.name,
  });

  @override
  bool operator ==(covariant StatEntity other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
