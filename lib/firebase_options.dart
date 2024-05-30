// lib/firebase_options.dart

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyDGT67sBAx6IC663QovlrXVm_eAk5WPRDw",
      authDomain: "skillshare-89495.firebaseapp.com",
      databaseURL: "https://skillshare-89495-default-rtdb.firebaseio.com",
      projectId: "skillshare-89495",
      storageBucket: "skillshare-89495.appspot.com",
      messagingSenderId: "811729916992",
      appId: "1:811729916992:web:5879dacd97c20d3a6dbba5",
      measurementId: "G-K2M739B0ZF"
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyDGT67sBAx6IC663QovlrXVm_eAk5WPRDw",
      authDomain: "skillshare-89495.firebaseapp.com",
      databaseURL: "https://skillshare-89495-default-rtdb.firebaseio.com",
      projectId: "skillshare-89495",
      storageBucket: "skillshare-89495.appspot.com",
      messagingSenderId: "811729916992",
      appId: "1:811729916992:web:5879dacd97c20d3a6dbba5",
      measurementId: "G-K2M739B0ZF"
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyDGT67sBAx6IC663QovlrXVm_eAk5WPRDw",
      authDomain: "skillshare-89495.firebaseapp.com",
      databaseURL: "https://skillshare-89495-default-rtdb.firebaseio.com",
      projectId: "skillshare-89495",
      storageBucket: "skillshare-89495.appspot.com",
      messagingSenderId: "811729916992",
      appId: "1:811729916992:web:5879dacd97c20d3a6dbba5",
      measurementId: "G-K2M739B0ZF"
  );

  static const FirebaseOptions macos = FirebaseOptions(
   apiKey: "AIzaSyDGT67sBAx6IC663QovlrXVm_eAk5WPRDw",
      authDomain: "skillshare-89495.firebaseapp.com",
      databaseURL: "https://skillshare-89495-default-rtdb.firebaseio.com",
      projectId: "skillshare-89495",
      storageBucket: "skillshare-89495.appspot.com",
      messagingSenderId: "811729916992",
      appId: "1:811729916992:web:5879dacd97c20d3a6dbba5",
      measurementId: "G-K2M739B0ZF"
  );
}
