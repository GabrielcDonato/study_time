import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

base class PokemonEntity {
  final String name;
  final List<String> type;
  final int id;
  final String numPokemon;
  final String height;
  final String weight;

  const PokemonEntity({
    required this.name,
    required this.type,
    required this.id,
    required this.numPokemon,
    required this.height,
    required this.weight,
  });

  String get image =>
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numPokemon.png';

  Color? get baseColor => _color(type: type[0]);

  static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return const Color(0xffAAA67F);
      case 'Fire':
        return const Color(0xffF57D31);
      case 'Water':
        return const Color(0xff6493EB);
      case 'Grass':
        return const Color(0xff74CB48);
      case 'Electric':
        return const Color(0xffF9CF30);
      case 'Ice':
        return const Color(0xff9AD6DF);
      case 'Fighting':
        return const Color(0xffC12239);
      case 'Poison':
        return const Color(0xffA43E9E);
      case 'Ground':
        return const Color(0xffDEC16B);
      case 'Flying':
        return const Color(0xffA891EC);
      case 'Psychic':
        return const Color(0xffFB5584);
      case 'Bug':
        return const Color(0xffA7B723);
      case 'Rock':
        return const Color(0xffB69E31);
      case 'Ghost':
        return const Color(0xff70559B);
      case 'Dark':
        return const Color(0xff75574C);
      case 'Dragon':
        return const Color(0xff7037FF);
      case 'Steel':
        return const Color(0xffB7B9D0);
      case 'Fairy':
        return const Color(0xffE69EAC);
      default:
        return Colors.grey;
    }
  }

  @override
  bool operator ==(covariant PokemonEntity other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        listEquals(other.type, type) &&
        other.id == id &&
        other.numPokemon == numPokemon &&
        other.height == height &&
        other.weight == weight;
  }

  @override
  int get hashCode {
    return Object.hash(
      name,
      id,
      numPokemon,
      height,
      weight,
      Object.hashAll(type),
    );
  }
}
