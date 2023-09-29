import 'package:study_time/src/features/domain/entities/get_details_pokemon/stat.dart';

base class StatsEntity {
  final int baseStat;
  final int effort;
  final StatEntity stat;

  const StatsEntity({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  @override
  bool operator ==(covariant StatsEntity other) {
    if (identical(this, other)) return true;

    return other.baseStat == baseStat &&
        other.effort == effort &&
        other.stat == stat;
  }

  @override
  int get hashCode => baseStat.hashCode ^ effort.hashCode ^ stat.hashCode;
}
