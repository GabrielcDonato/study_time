import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class StudyTimeAppConfig {
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    // await Injector.init();
  }
}
