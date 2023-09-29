import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_time/src/core/routes/export_routes.dart';
import 'package:study_time/src/core/routes/route_generator.dart';
import 'package:study_time/src/features/domain/usecases/export_usecases.dart';
import 'package:study_time/app_config.dart';
import 'package:study_time/src/features/domain/usecases/get_saved_favorite_pokemons/get_saved_favorite_pokemons_usecase.dart';
import 'package:study_time/src/features/presenter/cubits/export_cubits.dart';
import 'package:study_time/src/features/presenter/cubits/get_saved_favorite_pokemons/get_saved_favorite_pokemons_cubit.dart';

import 'core/get_it/get_it_instance.dart';

Future<Widget> initializeApp() async {
  await AppConfig().configureApp();
  return MultiBlocProvider(
    providers: [
      BlocProvider<UserCubit>(
        create: (_) => UserCubit(
          signInUserUsecase: getIt.get<SignInUserUsecase>(),
          signUpUserUsecase: getIt.get<SignUpUserUsecase>(),
          signOutUserUsecase: getIt.get<SignOutUserUsecase>(),
        ),
      ),
      BlocProvider<GetAllPokemonsCubit>(
        create: (_) => GetAllPokemonsCubit(
          getAllPokemonsUsecase: getIt.get<GetAllPokemonsUsecase>(),
        ),
      ),
      BlocProvider<GetDetailsPokemonCubit>(
        create: (_) => GetDetailsPokemonCubit(
          getDetailsPokemonUsecase: getIt.get<GetDetailsPokemonUsecase>(),
        ),
      ),
      BlocProvider<FavoritePokemonsCubit>(
        create: (_) => FavoritePokemonsCubit(
          addFavoritePokemonUsecase: getIt.get<AddFavoritePokemonUsecase>(),
          removeFavoritePokemonUsecase:
              getIt.get<RemoveFavoritePokemonUsecase>(),
        ),
      ),
      BlocProvider<GetSavedFavoritePokemonsCubit>(
        create: (_) => GetSavedFavoritePokemonsCubit(
          getSavedFavoritePokemonsUsecase:
              getIt.get<GetSavedFavoritePokemonsUsecase>(),
        ),
      ),
    ],
    child: const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'App',
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: AppNamedRoutes.mainPage,
    );
  }
}
