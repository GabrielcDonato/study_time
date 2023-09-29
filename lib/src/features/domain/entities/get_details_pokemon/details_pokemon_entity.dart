import 'package:flutter/foundation.dart';
import 'package:study_time/src/features/domain/entities/get_details_pokemon/abilitiy_entity.dart';
import 'package:study_time/src/features/domain/entities/get_details_pokemon/stats.dart';

base class DetailsPokemonEntity {
  final List<AbilitiyEntity> abilities;
  final List<StatsEntity> stats;

  const DetailsPokemonEntity({required this.abilities, required this.stats});

  @override
  bool operator ==(covariant DetailsPokemonEntity other) {
    if (identical(this, other)) return true;

    return listEquals(other.abilities, abilities) &&
        listEquals(other.stats, stats);
  }

  @override
  int get hashCode {
    return Object.hash(
      Object.hashAll(abilities),
      Object.hashAll(stats),
    );
  }
}
