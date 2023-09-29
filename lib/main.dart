import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:study_time/src/app.dart';
import 'package:study_time/src/core/arguments/details_pokemon/details_pokemon_argument.dart';
import 'package:study_time/src/core/arguments/favorites_pokemons_argument/favorites_pokemons_argument.dart';
import 'package:study_time/src/core/arguments/pokemon_argument/pokemon_argument.dart';
import 'package:study_time/src/core/injector/injector.dart';
import 'package:study_time/src/core/routes/export_routes.dart';
import 'package:study_time/src/features/domain/usecases/export_usecases.dart';
import 'package:study_time/src/features/domain/usecases/get_saved_favorite_pokemons/get_saved_favorite_pokemons_usecase.dart';
import 'package:study_time/src/features/presenter/cubits/export_cubits.dart';
import 'package:study_time/src/features/presenter/cubits/get_saved_favorite_pokemons/get_saved_favorite_pokemons_cubit.dart';
import 'package:study_time/src/features/presenter/pages/details_pokemon_page.dart';
import 'package:study_time/src/features/presenter/pages/favorites_pokemons_page.dart';
import 'package:study_time/src/features/presenter/pages/login_page.dart';
import 'package:study_time/src/features/presenter/pages/main_page.dart';
import 'package:study_time/src/features/presenter/pages/pokemons_page.dart';
import 'package:study_time/src/features/presenter/pages/register_page.dart';

void main() async {
  Widget app = await initializeApp();

  return runApp(
    ModularApp(
      module: AppModule(),
      child: app,
    ),
  );
}

class AppModule extends Module {
  @override
  void binds(i) {
    InjectorApp.init(i);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const MainPage(),
    );
    r.child(
      AppNamedRoutes.loginPage,
      child: (context) => const LoginPage(),
    );
    r.child(AppNamedRoutes.registerPage,
        child: (context) => const RegisterPage());
    r.child(
      AppNamedRoutes.pokemonsPage,
      child: (context) => PokemonsPage(
        argument: r.args.data,
      ),
    );
    r.child(
      AppNamedRoutes.detailsPokemonPage,
      child: (context) => DetailsPokemonPage(
        arguments: r.args.data,
      ),
    );
    r.child(
      AppNamedRoutes.favoritePokemonsPage,
      child: (context) => FavoritesPokemonsPage(
        argument: r.args.data,
      ),
    );
  }
}
