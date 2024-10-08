import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBuXmvpviWtFsNxRcs8OcxyQnZdYHNOzCc",
            authDomain: "dbcaf-8ca0f.firebaseapp.com",
            projectId: "dbcaf-8ca0f",
            storageBucket: "dbcaf-8ca0f.appspot.com",
            messagingSenderId: "440511725888",
            appId: "1:440511725888:web:f78e4a909198e59e2abaa5",
            measurementId: "G-MQ3YJKX4B5"));
  } else {
    await Firebase.initializeApp();
  }
}
