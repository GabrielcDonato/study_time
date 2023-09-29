import 'package:study_time/src/features/data/models/get_details_pokemon/stat_model.dart';
import 'package:study_time/src/features/domain/entities/get_details_pokemon/stats.dart';

class StatsModel extends StatsEntity {
  StatsModel(
      {required super.baseStat, required super.effort, required super.stat});

  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(
        baseStat: json['base_stat'],
        effort: json['effort'],
        stat: StatModel.fromJson(json['stat']));
  }
}
