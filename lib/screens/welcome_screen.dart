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
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      _moveToNextScreen(context);
    });
    return Container(
        color: Colors.white,
        child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }

  void _moveToNextScreen(BuildContext context) async {
    var isLoggedIn = await _isLoggedInUser();
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, ScreenRoutes.homeScreen);
    } else {
      Navigator.pushReplacementNamed(context, ScreenRoutes.loginScreen);
    }
  }

  Future<bool> _isLoggedInUser() async {
    return CacheHelper().isSignedIn();
  }
}
