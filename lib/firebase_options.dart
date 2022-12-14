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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA988gzac_D3HGuih58MPzzSOaEn-9b_PA',
    appId: '1:366658010634:web:19db159b7dfe66234169f3',
    messagingSenderId: '366658010634',
    projectId: 'study-app-2a878',
    authDomain: 'study-app-2a878.firebaseapp.com',
    storageBucket: 'study-app-2a878.appspot.com',
    measurementId: 'G-LEEPJESYE3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhYsSIhZwNBXWmBGBIHrTmoKdIaUH9kUE',
    appId: '1:366658010634:android:47cc937d832f64b24169f3',
    messagingSenderId: '366658010634',
    projectId: 'study-app-2a878',
    storageBucket: 'study-app-2a878.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-jAE_ijatpxxJSb_JQynboKqIuODUaOM',
    appId: '1:366658010634:ios:33aa1c78fadf72994169f3',
    messagingSenderId: '366658010634',
    projectId: 'study-app-2a878',
    storageBucket: 'study-app-2a878.appspot.com',
    iosClientId: '366658010634-dc313a6b125p1615fq9nmj95kuuo09u2.apps.googleusercontent.com',
    iosBundleId: 'com.example.studentApp',
  );
}
