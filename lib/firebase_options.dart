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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAT-mKEgBNS1sH8ecMpDYxZJnrhyDw6UPU',
    appId: '1:162051828729:web:cd41c2e68654bee36eeb28',
    messagingSenderId: '162051828729',
    projectId: 'ihebportfolio',
    authDomain: 'ihebportfolio.firebaseapp.com',
    storageBucket: 'ihebportfolio.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHPjvyO2W1mircf2_aoT-AAPf-MbDJ9zc',
    appId: '1:162051828729:android:fd52a9beead6ee116eeb28',
    messagingSenderId: '162051828729',
    projectId: 'ihebportfolio',
    storageBucket: 'ihebportfolio.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDhFo8vrVfKyVO_89bxBlwuxCsHgKTKUM',
    appId: '1:162051828729:ios:bc6ff22f440ab9706eeb28',
    messagingSenderId: '162051828729',
    projectId: 'ihebportfolio',
    storageBucket: 'ihebportfolio.appspot.com',
    iosClientId: '162051828729-41o9koc7mhc7hi8bfib7n5qdm57b42ki.apps.googleusercontent.com',
    iosBundleId: 'com.example.websiteportfilio',
  );
}
