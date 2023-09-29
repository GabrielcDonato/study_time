import 'package:study_time/src/features/data/models/get_details_pokemon/ability_model.dart';
import 'package:study_time/src/features/data/models/get_details_pokemon/stats_model.dart';
import 'package:study_time/src/features/domain/entities/get_details_pokemon/details_pokemon_entity.dart';

class DetailsPokemonModel extends DetailsPokemonEntity {
  DetailsPokemonModel({
    required super.abilities,
    required super.stats,
  });

  factory DetailsPokemonModel.fromJson(Map<String, dynamic> json) {
    List<AbilityModel> abilities = List<AbilityModel>.empty(growable: true);
    if (json['abilities'] != null) {
      json['abilities'].forEach((ability) {
        abilities.add(AbilityModel.fromJson(ability));
      });
    }

    List<StatsModel> stats = List<StatsModel>.empty(growable: true);
    if (json['stats'] != null) {
      json['stats'].forEach((stat) {
        stats.add(StatsModel.fromJson(stat));
      });
    }

    return DetailsPokemonModel(
      abilities: abilities,
      stats: stats,
    );
  }
}
