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
    apiKey: 'AIzaSyARenbL5PPcE7DfPSSX9sXh3Bv_F5VVRco',
    appId: '1:288088513521:web:770e76fe76549194e3c250',
    messagingSenderId: '288088513521',
    projectId: 'fcsmadproject',
    authDomain: 'fcsmadproject.firebaseapp.com',
    storageBucket: 'fcsmadproject.appspot.com',
    measurementId: 'G-EWKZ1ED8N5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTvDyCn-VD8L7koZufrb6AuM-dXnms2v0',
    appId: '1:288088513521:android:5612cbd85e7dc9c2e3c250',
    messagingSenderId: '288088513521',
    projectId: 'fcsmadproject',
    storageBucket: 'fcsmadproject.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4wCr8gh2h9iAhVpRIvbZanOgmp3oE2-o',
    appId: '1:288088513521:ios:19fbed3c330b01dde3c250',
    messagingSenderId: '288088513521',
    projectId: 'fcsmadproject',
    storageBucket: 'fcsmadproject.appspot.com',
    iosClientId: '288088513521-dmm6f3hkoo9lhgnoqq69c9qle22792t0.apps.googleusercontent.com',
    iosBundleId: 'com.example.fcsmadproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4wCr8gh2h9iAhVpRIvbZanOgmp3oE2-o',
    appId: '1:288088513521:ios:19fbed3c330b01dde3c250',
    messagingSenderId: '288088513521',
    projectId: 'fcsmadproject',
    storageBucket: 'fcsmadproject.appspot.com',
    iosClientId: '288088513521-dmm6f3hkoo9lhgnoqq69c9qle22792t0.apps.googleusercontent.com',
    iosBundleId: 'com.example.fcsmadproject',
  );
}