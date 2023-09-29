import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:study_time/src/app.dart';
import 'package:study_time/src/core/injector/injector.dart';
import 'package:study_time/src/core/routes/export_routes.dart';
import 'package:study_time/src/features/presenter/pages/details_pokemon_page.dart';
import 'package:study_time/src/features/presenter/pages/favorites_pokemons_page.dart';
import 'package:study_time/src/features/presenter/pages/login_page.dart';
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
    Modular.setInitialRoute(
      AppNamedRoutes.loginPage,
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
