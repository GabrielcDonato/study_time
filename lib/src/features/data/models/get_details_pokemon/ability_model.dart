import 'package:study_time/src/features/domain/entities/get_details_pokemon/abilitiy_entity.dart';

final class AbilityModel extends AbilitiyEntity {
  AbilityModel({required super.name});

  factory AbilityModel.fromJson(Map<String, dynamic> json) {
    return AbilityModel(name: json['name']);
  }
}
