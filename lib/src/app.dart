import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_time/src/core/routes/export_routes.dart';
import 'package:study_time/src/core/routes/route_generator.dart';
import 'package:study_time/src/features/domain/usecases/user/sign_out_user_usecase.dart';
import 'package:study_time/src/features/domain/usecases/user/sign_up_user_usecase.dart';
import 'package:study_time/src/features/presenter/cubits/user/user_cubit.dart';
import 'package:study_time/study_time_app_config.dart';

import 'core/get_it/get_it_instance.dart';

Future<Widget> initializeApp() async {
  await StudyTimeAppConfig().configureApp();
  return MultiBlocProvider(
    providers: [
      BlocProvider<UserCubit>(
        create: (_) => UserCubit(
          signUpUserUsecase: getIt.get<SignUpUserUsecase>(),
          signOutUserUsecase: getIt.get<SignOutUserUsecase>(),
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
      title: 'Study Time',
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: StudyTimeNamedRoutes.test,
    );
  }
}
