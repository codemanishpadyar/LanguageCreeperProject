import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'language_creeper/welcome/landing.dart';
import '../firebase_options.dart';
import 'language_creeper/quiz/quiz_java.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCRyBixb_jBW5RrUr-hYFBxykNVQyF6W5o",
        authDomain: "language-creeper.firebaseapp.com",
        databaseURL: "https://language-creeper-default-rtdb.asia-southeast1.firebasedatabase.app",
        projectId: "language-creeper",
        storageBucket: "language-creeper.firebasestorage.app",
        messagingSenderId: "186794938284",
        appId: "1:186794938284:web:2c4046590082488c83b409",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(), // ✅ Fixed incorrect reference to QuizPageJava
    );
  }
}
