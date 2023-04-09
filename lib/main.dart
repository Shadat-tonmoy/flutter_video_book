import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_book/constants/Styles.dart';
import 'package:video_book/constants/ConstantValues.dart';
import 'package:video_book/helpers/CacheHelper.dart';
import 'package:video_book/screens/home/HomeScreen.dart';
import 'package:video_book/screens/login/LoginScreen.dart';
import 'package:video_book/screens/welcome/WelomeScreen.dart';

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
  int themeValue = AppThemes.themeLight;

  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  void initFirebase() async {
    FirebaseApp firebaseApp = await AuthHelper.initializeFirebase();
    int themeFromSettings = await CacheHelper().getAppTheme();
    setState(() {
      themeValue = themeFromSettings;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/",
        routes: {
          ScreenRoutes.welcomeScreen: (context) => WelcomeScreen(),
          ScreenRoutes.loginScreen: (context) => const LoginScreen(),
          ScreenRoutes.homeScreen: (context) => const HomeScreen(),
        },
        theme: AppThemes.getThemeFromSettings(themeValue));
  }
}
