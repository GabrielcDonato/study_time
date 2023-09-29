import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCptTnoq78k_v1oUWb5uPY_RvUdtGA-lAE',
    appId: '1:754405868706:android:90864ee043e777fa6983fb',
    messagingSenderId: '754405868706',
    projectId: 'study-time-donato',
    storageBucket: 'study-time-donato.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCg5ze5rw_ZPxUyHtLnxqCMMnE8TQzk2yQ',
    appId: '1:754405868706:ios:b65c449f3f150be76983fb',
    messagingSenderId: '754405868706',
    projectId: 'study-time-donato',
    storageBucket: 'study-time-donato.appspot.com',
    iosClientId:
        '754405868706-s3sceh6hqriq6cki24hnajcqmc756i2n.apps.googleusercontent.com',
    iosBundleId: 'com.gabrieldonato.studyTime',
  );
}
