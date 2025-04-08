// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAm7nAL3Kq5MG5A2jSq7Q55v3HJummJdY8',
    appId: '1:703490669110:web:e084c924dc46f27bed3697',
    messagingSenderId: '703490669110',
    projectId: 'chatapp-5bdb4',
    authDomain: 'chatapp-5bdb4.firebaseapp.com',
    storageBucket: 'chatapp-5bdb4.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYclkMTy06HSZ2qekxGc6hOMOksbH1Yg8',
    appId: '1:703490669110:android:a2cc81e299a14ddeed3697',
    messagingSenderId: '703490669110',
    projectId: 'chatapp-5bdb4',
    storageBucket: 'chatapp-5bdb4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOsRyMqVXpofAcpqKVveuCheZLfYaJp64',
    appId: '1:703490669110:ios:d8c3bbaa28002b73ed3697',
    messagingSenderId: '703490669110',
    projectId: 'chatapp-5bdb4',
    storageBucket: 'chatapp-5bdb4.firebasestorage.app',
    iosBundleId: 'com.example.minimalChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAOsRyMqVXpofAcpqKVveuCheZLfYaJp64',
    appId: '1:703490669110:ios:d8c3bbaa28002b73ed3697',
    messagingSenderId: '703490669110',
    projectId: 'chatapp-5bdb4',
    storageBucket: 'chatapp-5bdb4.firebasestorage.app',
    iosBundleId: 'com.example.minimalChatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAm7nAL3Kq5MG5A2jSq7Q55v3HJummJdY8',
    appId: '1:703490669110:web:f7ecedfa187cd3ebed3697',
    messagingSenderId: '703490669110',
    projectId: 'chatapp-5bdb4',
    authDomain: 'chatapp-5bdb4.firebaseapp.com',
    storageBucket: 'chatapp-5bdb4.firebasestorage.app',
  );
}
