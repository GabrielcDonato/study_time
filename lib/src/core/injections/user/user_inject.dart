import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  static void inject(Injector i) {
    i.add<UserDatasource>(
      () => UserDatasourceImpl(
        firebaseAuth: i.get<FirebaseAuth>(),
      ),
    );

    i.add<UserRepository>(
      () => UserRepositoryImpl(
        userDatasource: i.get<UserDatasource>(),
      ),
    );

    i.add<SignUpUserUsecase>(
      () => SignUpUserUsecaseImpl(
        userRepository: i.get<UserRepository>(),
      ),
    );

    i.add<SignInUserUsecase>(
      () => SignInUserUsecaseImpl(
        userRepository: i.get<UserRepository>(),
      ),
    );

    i.add<SignOutUserUsecase>(
      () => SignOutUserUsecaseImpl(
        userRepository: i.get<UserRepository>(),
      ),
    );
  }
}
