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
    apiKey: 'AIzaSyD13GlBchNtHMEkkJMsu6TsuM_mbaVeTf8',
    appId: '1:459742488079:web:9dbee68d8320c7ed1fa57a',
    messagingSenderId: '459742488079',
    projectId: 'musicb-7000a',
    authDomain: 'musicb-7000a.firebaseapp.com',
    storageBucket: 'musicb-7000a.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNIb_KWRCpSgF257tm4SWFhKICXfyB8iM',
    appId: '1:459742488079:android:434d5155f78729f91fa57a',
    messagingSenderId: '459742488079',
    projectId: 'musicb-7000a',
    storageBucket: 'musicb-7000a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCA1VQW3GvE6oCLoiNdSuW1VWKX5exYJfA',
    appId: '1:459742488079:ios:b7633f7776b9823c1fa57a',
    messagingSenderId: '459742488079',
    projectId: 'musicb-7000a',
    storageBucket: 'musicb-7000a.firebasestorage.app',
    iosBundleId: 'com.example.msPlayer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCA1VQW3GvE6oCLoiNdSuW1VWKX5exYJfA',
    appId: '1:459742488079:ios:b7633f7776b9823c1fa57a',
    messagingSenderId: '459742488079',
    projectId: 'musicb-7000a',
    storageBucket: 'musicb-7000a.firebasestorage.app',
    iosBundleId: 'com.example.msPlayer',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD13GlBchNtHMEkkJMsu6TsuM_mbaVeTf8',
    appId: '1:459742488079:web:360c57ae113b9dc11fa57a',
    messagingSenderId: '459742488079',
    projectId: 'musicb-7000a',
    authDomain: 'musicb-7000a.firebaseapp.com',
    storageBucket: 'musicb-7000a.firebasestorage.app',
  );
}
