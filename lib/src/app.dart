import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_time/src/study_time_app_config.dart';

Future<Widget> initializeApp() async {
  await StudyTimeAppConfig().configureApp();
  return MultiBlocProvider(
    providers: const [
      // BlocProvider<GetAllPokemonsCubit>(
      //   create: (_) => GetAllPokemonsCubit(
      //     getAllPokemonsUsecase: getIt.get<GetAllPokemonsUsecase>(),
      //   ),
      // ),
    ],
    child: const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
