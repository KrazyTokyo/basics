import 'package:flutter/material.dart';
import 'package:basics/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basics',
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/signup': (context) => const SignUp(),
        '/mainhome': (context) => const MainHome()
      },
    );
  }
}
