import 'package:study_time/src/features/domain/entities/get_all_pokemons/pokemon_entity.dart';

class PokemonsModel extends PokemonEntity {
  PokemonsModel({
    required super.name,
    required super.type,
    required super.id,
    required super.numPokemon,
    required super.height,
    required super.weight,
  });

  factory PokemonsModel.fromMap(Map<String, dynamic> json) {
    return PokemonsModel(
      name: json['name'],
      id: json['id'],
      numPokemon: json['num'],
      type: (json['type'] as List<dynamic>)
          .map(
            (e) => e as String,
          )
          .toList(),
      height: json['height'],
      weight: json['weight'],
    );
  }
}
