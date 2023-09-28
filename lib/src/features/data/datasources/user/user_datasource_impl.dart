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
          email: user.email, password: user.password);

      return userCredential.user;
    } on FirebaseAuthException catch (exception, stackTrace) {
      print(exception);
      print(stackTrace);

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
                  'voce se cadastrou no studytime pelo google, por favor utilize ele para entrar',
              stackTrace: stackTrace);
        }
      } else {
        throw UserException(
            message: exception.message!, stackTrace: stackTrace);
      }
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e, s) {
      throw UserException(
        message: 'Deu erro para deslogar',
        stackTrace: s,
      );
    }
  }
}
