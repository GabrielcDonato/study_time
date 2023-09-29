import 'package:study_time/src/features/domain/entities/get_details_pokemon/stat.dart';

class StatsEntity {
  final int baseStat;
  final int effort;
  final StatEntity stat;

  StatsEntity(
      {required this.baseStat, required this.effort, required this.stat});
}
