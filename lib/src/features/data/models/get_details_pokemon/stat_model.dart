import 'package:study_time/src/features/domain/entities/get_details_pokemon/stat.dart';

class StatModel extends StatEntity {
  StatModel({required super.name});

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(
      name: json['name'],
    );
  }
}
