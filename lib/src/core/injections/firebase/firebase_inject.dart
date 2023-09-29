import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

sealed class FirebaseInject {
  static final firebaseAuth = FirebaseAuth.instance;

  static final firebaseFirestore = FirebaseFirestore.instance;

  static void inject(Injector i) {
    i.addSingleton<FirebaseAuth>(() => firebaseAuth);
    i.addSingleton<FirebaseFirestore>(() => firebaseFirestore);
  }
}
