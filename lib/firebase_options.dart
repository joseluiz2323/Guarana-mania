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
    apiKey: 'AIzaSyCDGhmQwDzaaz78tnROCkgPPh7-pFgKH4g',
    appId: '1:617652604655:web:9a17e32d589b497c0d151a',
    messagingSenderId: '617652604655',
    projectId: 'guarana-mania-c08e0',
    authDomain: 'guarana-mania-c08e0.firebaseapp.com',
    storageBucket: 'guarana-mania-c08e0.appspot.com',
    measurementId: 'G-0TFMD6T16Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiZ1_VVqNNDz268vUDq2MknClD9n7emtE',
    appId: '1:617652604655:android:af6ddafb270992d50d151a',
    messagingSenderId: '617652604655',
    projectId: 'guarana-mania-c08e0',
    storageBucket: 'guarana-mania-c08e0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgHw-vLBdiBZTe4LOVNyMDy4yiWZnkYNM',
    appId: '1:617652604655:ios:36e27dc8ea042da10d151a',
    messagingSenderId: '617652604655',
    projectId: 'guarana-mania-c08e0',
    storageBucket: 'guarana-mania-c08e0.appspot.com',
    iosClientId:
        '617652604655-7s0h8s5eq4kqo5poun78ih1pbh8rjl7k.apps.googleusercontent.com',
    iosBundleId: 'com.example.guaranaMania',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgHw-vLBdiBZTe4LOVNyMDy4yiWZnkYNM',
    appId: '1:617652604655:ios:36e27dc8ea042da10d151a',
    messagingSenderId: '617652604655',
    projectId: 'guarana-mania-c08e0',
    storageBucket: 'guarana-mania-c08e0.appspot.com',
    iosClientId:
        '617652604655-7s0h8s5eq4kqo5poun78ih1pbh8rjl7k.apps.googleusercontent.com',
    iosBundleId: 'com.example.guaranaMania',
  );
}
