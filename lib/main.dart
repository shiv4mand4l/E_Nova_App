import 'package:e_nova/firebase_options.dart';
import 'package:e_nova/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  // Ensure native platform channels bind before initialization
  WidgetsFlutterBinding.ensureInitialized();

  // Connect to Firebase project via the options abstraction
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
