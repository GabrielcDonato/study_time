import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_time/src/core/arguments/details_pokemon/details_pokemon_argument.dart';
import 'package:study_time/src/core/colors/app_colors.dart';

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
              preferredSize:
                  Size.fromHeight(MediaQuery.sizeOf(context).height * 0.3),
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
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Text(
                      '#${arguments.numPokemon}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: AppColors.secondaryColor,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('Weight'),
                            Text(arguments.weight),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('Height'),
                            Text('${arguments.height.substring(0, 3)} m'),
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
