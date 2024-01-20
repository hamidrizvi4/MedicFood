import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBO5rrKEAAxQyz21n00mtN8scBoSRXLEd8",
            authDomain: "fooddruginteraction-a4a52.firebaseapp.com",
            projectId: "fooddruginteraction-a4a52",
            storageBucket: "fooddruginteraction-a4a52.appspot.com",
            messagingSenderId: "810444065213",
            appId: "1:810444065213:web:bdb8559e9c8bffb023aad4",
            measurementId: "G-7B5XM1PJ4M"));
  } else {
    await Firebase.initializeApp();
  }
}
