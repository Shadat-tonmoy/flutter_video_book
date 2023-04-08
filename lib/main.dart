import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_book/constants/Styles.dart';
import 'package:video_book/constants/constant_values.dart';
import 'package:video_book/screens/HomeScreen.dart';
import 'package:video_book/screens/LoginScreen.dart';
import 'package:video_book/screens/welcome_screen.dart';

import 'helpers/AuthHelper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  void initFirebase() async {
    FirebaseApp firebaseApp = await AuthHelper.initializeFirebase();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        ScreenRoutes.welcomeScreen: (context) => const WelcomeScreen(),
        ScreenRoutes.loginScreen: (context) => const LoginScreen(),
        ScreenRoutes.homeScreen: (context) => const HomeScreen(),
      },
      theme: AppThemes.getDarkTheme(),
    );
  }
}
