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
    apiKey: 'AIzaSyAFBUriEr3J2nHakFoHvVpsIZmKKeYzmu4',
    appId: '1:770376045801:web:ef0ff57ca41be77cc20c78',
    messagingSenderId: '770376045801',
    projectId: 'examen-di-1',
    authDomain: 'examen-di-1.firebaseapp.com',
    storageBucket: 'examen-di-1.appspot.com',
    measurementId: 'G-GZCL42MVVH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAoPAuzoOX73ZQEi0LEp5X3lw13fCWPAUo',
    appId: '1:770376045801:android:ec1c0c0b800b267ac20c78',
    messagingSenderId: '770376045801',
    projectId: 'examen-di-1',
    storageBucket: 'examen-di-1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD324xzuyGLATFof-euORTholAhmBJEEO4',
    appId: '1:770376045801:ios:885ae8c7968caf17c20c78',
    messagingSenderId: '770376045801',
    projectId: 'examen-di-1',
    storageBucket: 'examen-di-1.appspot.com',
    iosClientId: '770376045801-17d625cofefp09aa43ovebp4bhl4uavt.apps.googleusercontent.com',
    iosBundleId: 'com.example.examenDin1',
  );
}
