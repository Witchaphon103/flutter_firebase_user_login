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
    apiKey: 'AIzaSyAHUjlOeKveww3OIXYZw4_0O8qvn6PpT7s',
    appId: '1:154202104526:web:49c7a06f7a1402767d269f',
    messagingSenderId: '154202104526',
    projectId: 'fir-login-7f707',
    authDomain: 'fir-login-7f707.firebaseapp.com',
    storageBucket: 'fir-login-7f707.firebasestorage.app',
    measurementId: 'G-53HM2CXT44',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPXm299SDyQe7Lz7BoBu6oZ7XLsNwpbTA',
    appId: '1:154202104526:android:73e7a43fb67ea4147d269f',
    messagingSenderId: '154202104526',
    projectId: 'fir-login-7f707',
    storageBucket: 'fir-login-7f707.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDddvZD8t61XTVvLxuSVfcj61PCaMUVeBM',
    appId: '1:154202104526:ios:e476af89e48d901a7d269f',
    messagingSenderId: '154202104526',
    projectId: 'fir-login-7f707',
    storageBucket: 'fir-login-7f707.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebaseAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDddvZD8t61XTVvLxuSVfcj61PCaMUVeBM',
    appId: '1:154202104526:ios:e476af89e48d901a7d269f',
    messagingSenderId: '154202104526',
    projectId: 'fir-login-7f707',
    storageBucket: 'fir-login-7f707.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebaseAuth',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAHUjlOeKveww3OIXYZw4_0O8qvn6PpT7s',
    appId: '1:154202104526:web:2fa7709ecbe48a877d269f',
    messagingSenderId: '154202104526',
    projectId: 'fir-login-7f707',
    authDomain: 'fir-login-7f707.firebaseapp.com',
    storageBucket: 'fir-login-7f707.firebasestorage.app',
    measurementId: 'G-KLT75DKWD5',
  );
}
