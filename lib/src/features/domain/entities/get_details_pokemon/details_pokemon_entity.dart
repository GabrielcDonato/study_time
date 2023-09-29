import 'package:study_time/src/features/domain/entities/get_details_pokemon/abilitiy_entity.dart';
import 'package:study_time/src/features/domain/entities/get_details_pokemon/stats.dart';

class DetailsPokemonEntity {
  final List<AbilitiyEntity> abilities;
  final List<StatsEntity> stats;

  DetailsPokemonEntity({required this.abilities, required this.stats});
}
