import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

sealed class FirebaseInject {
  static final firebaseAuth = FirebaseAuth.instance;

  static final firebaseFirestore = FirebaseFirestore.instance;

  static void inject(GetIt getIt) {
    getIt.registerSingleton<FirebaseAuth>(firebaseAuth);
    getIt.registerSingleton<FirebaseFirestore>(firebaseFirestore);
  }
}
