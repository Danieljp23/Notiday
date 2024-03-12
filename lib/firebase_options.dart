// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCsYjacVViUJqTPzAgq_wvI0zEnslhkROE',
    appId: '1:1038031173119:web:87079c5388bd3950f1e3ca',
    messagingSenderId: '1038031173119',
    projectId: 'notiday-app',
    authDomain: 'notiday-app.firebaseapp.com',
    databaseURL: 'https://notiday-app-default-rtdb.firebaseio.com',
    storageBucket: 'notiday-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCf8Y2joW2mCP_0-fmEmA-EeROIPu4bB1o',
    appId: '1:1038031173119:android:27cde5b5de495f59f1e3ca',
    messagingSenderId: '1038031173119',
    projectId: 'notiday-app',
    databaseURL: 'https://notiday-app-default-rtdb.firebaseio.com',
    storageBucket: 'notiday-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgnlN5aw039jGsJFUq0l6YeFoyP2fmCa0',
    appId: '1:1038031173119:ios:7a6437692ad44adcf1e3ca',
    messagingSenderId: '1038031173119',
    projectId: 'notiday-app',
    databaseURL: 'https://notiday-app-default-rtdb.firebaseio.com',
    storageBucket: 'notiday-app.appspot.com',
    iosBundleId: 'com.example.notiday',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgnlN5aw039jGsJFUq0l6YeFoyP2fmCa0',
    appId: '1:1038031173119:ios:88f8ddeede65f8fff1e3ca',
    messagingSenderId: '1038031173119',
    projectId: 'notiday-app',
    databaseURL: 'https://notiday-app-default-rtdb.firebaseio.com',
    storageBucket: 'notiday-app.appspot.com',
    iosBundleId: 'com.example.notiday.RunnerTests',
  );
}
