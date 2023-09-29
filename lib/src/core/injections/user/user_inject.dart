import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:study_time/src/features/data/datasources/user/user_datasource.dart';
import 'package:study_time/src/features/data/datasources/user/user_datasource_impl.dart';
import 'package:study_time/src/features/data/repositories/user/user_repository_impl.dart';
import 'package:study_time/src/features/domain/repositories/user/user_repository.dart';
import 'package:study_time/src/features/domain/usecases/user/sign_in_user_usecase.dart';
import 'package:study_time/src/features/domain/usecases/user/sign_in_user_usecase_impl.dart';
import 'package:study_time/src/features/domain/usecases/user/sign_out_user_usecase.dart';
import 'package:study_time/src/features/domain/usecases/user/sign_out_user_usecase_impl.dart';
import 'package:study_time/src/features/domain/usecases/user/sign_up_user_usecase.dart';
import 'package:study_time/src/features/domain/usecases/user/sign_up_user_usecase_impl.dart';

sealed class UserInject {
  static void inject(GetIt getIt) {
    getIt.registerFactory<UserDatasource>(
      () => UserDatasourceImpl(
        firebaseAuth: getIt.get<FirebaseAuth>(),
      ),
    );

    getIt.registerFactory<UserRepository>(
      () => UserRepositoryImpl(
        userDatasource: getIt.get<UserDatasource>(),
      ),
    );

    getIt.registerFactory<SignUpUserUsecase>(
      () => SignUpUserUsecaseImpl(
        userRepository: getIt.get<UserRepository>(),
      ),
    );

    getIt.registerFactory<SignInUserUsecase>(
      () => SignInUserUsecaseImpl(
        userRepository: getIt.get<UserRepository>(),
      ),
    );

    getIt.registerFactory<SignOutUserUsecase>(
      () => SignOutUserUsecaseImpl(
        userRepository: getIt.get<UserRepository>(),
      ),
    );
  }
}
