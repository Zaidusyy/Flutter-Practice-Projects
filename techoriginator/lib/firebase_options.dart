
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
    apiKey: 'AIzaSyBD1SXnl3tWPx7COvovtUgD72iYKfqrY8M',
    appId: '1:520713822132:web:c03cb7900114a6f13ddce1',
    messagingSenderId: '520713822132',
    projectId: 'techoriginator-12ec5',
    authDomain: 'techoriginator-12ec5.firebaseapp.com',
    storageBucket: 'techoriginator-12ec5.firebasestorage.app',
    measurementId: 'G-ZYT6EJ7417',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDv4h893vKzSixWWQ6c8FkAzUT6WTo8xsg',
    appId: '1:520713822132:android:961a7103fd52802a3ddce1',
    messagingSenderId: '520713822132',
    projectId: 'techoriginator-12ec5',
    storageBucket: 'techoriginator-12ec5.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsVHbHxMQehFXbbhwHDGbkAnf5u7ZzyHE',
    appId: '1:520713822132:ios:fff040ef34fb4a353ddce1',
    messagingSenderId: '520713822132',
    projectId: 'techoriginator-12ec5',
    storageBucket: 'techoriginator-12ec5.firebasestorage.app',
    iosBundleId: 'com.example.techoriginator',
  );
}
