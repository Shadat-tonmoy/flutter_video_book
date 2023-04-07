import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_book/constants/constant_values.dart';
import 'package:video_book/helpers/CacheHelper.dart';

import '../helpers/AuthHelper.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      _moveToNextScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }

  void _moveToNextScreen() async {
    var isLoggedIn = await _isLoggedInUser();
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, ScreenRoutes.homeScreen);
    } else {
      Navigator.pushReplacementNamed(context, ScreenRoutes.loginScreen);
    }
  }

  Future<bool> _isLoggedInUser() async {
    FirebaseApp firebaseApp = await AuthHelper.initializeFirebase();
    print("Firebase app initialized! ${firebaseApp}");
    var signedInUser = await AuthHelper.getSignedInUser(true);
    if(signedInUser != null){
      var cacheHelper = CacheHelper();
      cacheHelper.cacheSignedInUser(signedInUser);
    }
    return signedInUser != null;
  }
}
