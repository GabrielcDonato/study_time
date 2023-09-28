import 'package:study_time/src/core/get_it/get_it_instance.dart';
import 'package:study_time/src/core/injections/firebase/firebase_inject.dart';
import 'package:study_time/src/core/injections/user/user_inject.dart';

sealed class Injector {
  static Future<void> init() async {
    FirebaseInject.inject(getIt);
    UserInject.inject(getIt);
  }
}
