import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_time/src/features/domain/entities/user/user_entity.dart';
import 'package:study_time/src/features/domain/usecases/user/sign_out_user_usecase.dart';
import 'package:study_time/src/features/domain/usecases/user/sign_up_user_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final SignUpUserUsecase _signUpUserUsecase;
  final SignOutUserUsecase _signOutUserUsecase;

  UserCubit({
    required SignUpUserUsecase signUpUserUsecase,
    required SignOutUserUsecase signOutUserUsecase,
  })  : _signUpUserUsecase = signUpUserUsecase,
        _signOutUserUsecase = signOutUserUsecase,
        super(
          UserInitial(),
        );

  Future<void> registerUser({required UserEntity user}) async {
    emit(
      UserLoading(),
    );
    final result = await _signUpUserUsecase(user: user);

    result.fold(
      (failure) => emit(
        UserError(),
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
      LogoutLoading(),
    );

    final result = await _signOutUserUsecase();

    result.fold(
      (failure) => emit(UserError()),
      (logoutDone) => emit(
        LogoutSuccess(),
      ),
    );
  }
}
