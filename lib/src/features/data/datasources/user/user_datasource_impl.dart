import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_time/src/core/errors/exceptions/exceptions.dart';
import 'package:study_time/src/features/data/datasources/user/user_datasource.dart';
import 'package:study_time/src/features/data/models/user/user_model.dart';

class UserDatasourceImpl implements UserDatasource {
  final FirebaseAuth _firebaseAuth;
  UserDatasourceImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> signUp({required UserModel user}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      return userCredential.user;
    } on FirebaseAuthException catch (exception, stackTrace) {
//email-already-exists
      if (exception.code == 'email-already-in-use') {
        final loginTypes =
            await _firebaseAuth.fetchSignInMethodsForEmail(user.email);

        if (loginTypes.contains('password')) {
          throw UserException(
            message: 'E-mail ja utilizado, por favor escolha outro e-mail',
            stackTrace: stackTrace,
          );
        } else {
          throw UserException(
            message:
                'Voce se cadastrou no App pelo google, por favor utilize ele para entrar',
            stackTrace: stackTrace,
          );
        }
      } else {
        throw UserException(
            message: exception.message!, stackTrace: stackTrace);
      }
    }
  }

  @override
  Future<User?> signIn({required UserModel user}) async {
    try {
      final loginTypes =
          await _firebaseAuth.fetchSignInMethodsForEmail(user.email);

      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      if (loginTypes.contains('password')) {
        final userVerified = userCredential.user?.emailVerified ?? false;

        if (!userVerified) {
          userCredential.user?.sendEmailVerification();
          throw UserException(
            message:
                'Email não confirmado. Por favor, confirme-o em seu email cadastrado.',
            stackTrace: StackTrace.empty,
          );
        }
      } else {
        throw UserException(
          message:
              'O login não pode ser feito por email e senha. Por favor, utilize outro método.',
          stackTrace: StackTrace.empty,
        );
      }
      return userCredential.user;
    } on FirebaseAuthException catch (exception) {
      if (exception.code.contains('user-not-found')) {
        throw UserException(
          message: 'Usuário não existe',
          stackTrace: StackTrace.empty,
        );
      }
      throw UserException(
        message: 'Usuário ou senha inválidos!!!',
        stackTrace: StackTrace.empty,
      );
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (exception, stackTrace) {
      throw UserException(
        message: 'Ocorreu um erro ao deslogar',
        stackTrace: stackTrace,
      );
    }
  }
}
