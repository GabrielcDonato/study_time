import 'package:flutter/material.dart';
import 'package:study_time/src/features/presenter/pages/initial_page.dart';

import 'study_time_named_routes.dart';

sealed class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      /// Splash:
      // case '/splash_page':
      //   return MaterialPageRoute(builder: (context) => const SplashPage());

      /// Initial:
      case StudyTimeNamedRoutes.initialPage:
        return MaterialPageRoute(builder: (context) => const InitialPage());

      // case PokedexNamedRoutes.detailsPage:
      //   return MaterialPageRoute(
      //     builder: (context) => DetailsPokemonPage(
      //       arguments: args as DetailsPokemonArgument,
      //     ),
      //   );

      default:
        return MaterialPageRoute(builder: (context) => const InitialPage());
    }
  }
}
