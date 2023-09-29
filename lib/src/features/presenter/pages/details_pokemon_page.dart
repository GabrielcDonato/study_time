import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_time/src/core/arguments/details_pokemon/details_pokemon_argument.dart';

class DetailsPokemonPage extends StatelessWidget {
  final DetailsPokemonArgument arguments;
  const DetailsPokemonPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(250.0),
              child: AppBar(
                backgroundColor: arguments.color,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      arguments.name,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '#${arguments.numPokemon}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          'About',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: arguments.color,
                          ),
                        ),
                        Column(
                          children: [
                            Text(arguments.weight),
                            const Text('Weight'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('${arguments.height.substring(0, 3)} m'),
                            const Text('Height'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 100,
            child: Image.network(
              arguments.image,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
