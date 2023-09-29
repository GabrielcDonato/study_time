import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_time/src/features/domain/entities/user/user_entity.dart';
import 'package:study_time/src/features/domain/usecases/user/sign_in_user_usecase.dart';
import 'package:study_time/src/features/domain/usecases/user/sign_out_user_usecase.dart';
import 'package:study_time/src/features/domain/usecases/user/sign_up_user_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final SignUpUserUsecase _signUpUserUsecase;
  final SignOutUserUsecase _signOutUserUsecase;
  final SignInUserUsecase _signInUserUsecase;

  UserCubit({
    required SignUpUserUsecase signUpUserUsecase,
    required SignOutUserUsecase signOutUserUsecase,
    required SignInUserUsecase signInUserUsecase,
  })  : _signUpUserUsecase = signUpUserUsecase,
        _signOutUserUsecase = signOutUserUsecase,
        _signInUserUsecase = signInUserUsecase,
        super(
          const UserInitial(),
        );

  Future<void> registerUser({required UserEntity user}) async {
    emit(
      const UserLoading(),
    );
    final result = await _signUpUserUsecase(user: user);

    result.fold(
      (failure) => emit(
        UserError(message: failure.message ?? ''),
      ),
      (user) => emit(
        UserSuccess(
          user: user!,
        ),
      ),
    );
  }

  Future<void> login({required UserEntity user}) async {
    emit(
      const UserLoading(),
    );
    final result = await _signInUserUsecase(user: user);

    result.fold(
      (failure) => emit(
        UserError(message: failure.message ?? ''),
      ),
      (user) => emit(
        UserSuccess(
          user: user!,
        ),
      ),
    );
  }

  Future<void> logout() async {
    emit(
      const LogoutLoading(),
    );

    final result = await _signOutUserUsecase();

    result.fold(
      (failure) => emit(
        UserError(message: failure.message ?? ''),
      ),
      (logoutDone) => emit(
        const LogoutSuccess(),
      ),
    );
  }
}
