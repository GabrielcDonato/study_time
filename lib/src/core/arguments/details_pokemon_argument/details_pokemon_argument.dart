import 'package:flutter/material.dart';

final class DetailsPokemonArgument {
  final String name;
  final String height;
  final String numPokemon;

  final Color color;
  final String weight;
  final String image;

  DetailsPokemonArgument({
    required this.name,
    required this.height,
    required this.numPokemon,
    required this.weight,
    required this.color,
    required this.image,
  });
}
