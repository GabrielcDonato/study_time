import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:study_time/src/core/routes/export_routes.dart';
import 'package:study_time/src/core/routes/route_generator.dart';
import 'package:study_time/src/features/domain/usecases/export_usecases.dart';
import 'package:study_time/app_config.dart';
import 'package:study_time/src/features/domain/usecases/get_saved_favorite_pokemons/get_saved_favorite_pokemons_usecase.dart';
import 'package:study_time/src/features/presenter/cubits/export_cubits.dart';
import 'package:study_time/src/features/presenter/cubits/get_saved_favorite_pokemons/get_saved_favorite_pokemons_cubit.dart';

Future<Widget> initializeApp() async {
  await AppConfig().configureApp();
  return MultiBlocProvider(
    providers: [
      BlocProvider<UserCubit>(
        create: (_) => UserCubit(
          signInUserUsecase: Modular.get<SignInUserUsecase>(),
          signUpUserUsecase: Modular.get<SignUpUserUsecase>(),
          signOutUserUsecase: Modular.get<SignOutUserUsecase>(),
        ),
      ),
      BlocProvider<GetAllPokemonsCubit>(
        create: (_) => GetAllPokemonsCubit(
          getAllPokemonsUsecase: Modular.get<GetAllPokemonsUsecase>(),
        ),
      ),
      BlocProvider<GetDetailsPokemonCubit>(
        create: (_) => GetDetailsPokemonCubit(
          getDetailsPokemonUsecase: Modular.get<GetDetailsPokemonUsecase>(),
        ),
      ),
      BlocProvider<FavoritePokemonsCubit>(
        create: (_) => FavoritePokemonsCubit(
          addFavoritePokemonUsecase: Modular.get<AddFavoritePokemonUsecase>(),
          removeFavoritePokemonUsecase:
              Modular.get<RemoveFavoritePokemonUsecase>(),
        ),
      ),
      BlocProvider<GetSavedFavoritePokemonsCubit>(
        create: (_) => GetSavedFavoritePokemonsCubit(
          getSavedFavoritePokemonsUsecase:
              Modular.get<GetSavedFavoritePokemonsUsecase>(),
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
    return MaterialApp.router(
      title: 'App',
      routerConfig: Modular.routerConfig,
    );
  }
}
