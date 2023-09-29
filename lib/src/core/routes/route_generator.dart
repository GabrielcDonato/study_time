import 'package:flutter/material.dart';
import 'package:study_time/src/core/arguments/details_pokemon_argument/details_pokemon_argument.dart';
import 'package:study_time/src/core/arguments/pokemon_argument/pokemon_argument.dart';
import 'package:study_time/src/features/presenter/pages/details_pokemon_page.dart';
import 'package:study_time/src/features/presenter/pages/favorites_pokemons_page.dart';
import 'package:study_time/src/features/presenter/pages/login_page.dart';
import 'package:study_time/src/features/presenter/pages/main_page.dart';
import 'package:study_time/src/features/presenter/pages/register_page.dart';
import 'package:study_time/src/features/presenter/pages/pokemons_page.dart';

import 'app_named_routes.dart';

sealed class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppNamedRoutes.mainPage:
        return MaterialPageRoute(builder: (context) => const MainPage());

      case AppNamedRoutes.loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPage());

      case AppNamedRoutes.registerPage:
        return MaterialPageRoute(builder: (context) => const RegisterPage());

      case AppNamedRoutes.pokemonsPage:
        return MaterialPageRoute(
            builder: (context) => PokemonsPage(
                  argument: args as PokemonArgument,
                ));

      case AppNamedRoutes.detailsPokemonPage:
        return MaterialPageRoute(
          builder: (context) => DetailsPokemonPage(
            arguments: args as DetailsPokemonArgument,
          ),
        );

      case AppNamedRoutes.favoritePokemonsPage:
        return MaterialPageRoute(
            builder: (context) => const FavoritesPokemonsPage());
    }

    return null;
  }
}
