import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

sealed class FirebaseInject {
  static final firebaseAuth = FirebaseAuth.instance;

  static void inject(GetIt getIt) {
    getIt.registerSingleton<FirebaseAuth>(firebaseAuth);
  }
}
