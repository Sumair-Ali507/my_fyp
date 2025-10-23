import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDWDFN7UaQK1oHBTdV-p0evwxYahLhqEn0",
            authDomain: "busmate-54bb3.firebaseapp.com",
            projectId: "busmate-54bb3",
            storageBucket: "busmate-54bb3.firebasestorage.app",
            messagingSenderId: "64129881421",
            appId: "1:64129881421:web:6771b68198644b27cd9304",
            measurementId: "G-KGVQMB2K4D"));
  } else {
    await Firebase.initializeApp();
  }
}
