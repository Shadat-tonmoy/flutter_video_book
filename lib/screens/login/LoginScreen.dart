import 'package:awesome_icons/awesome_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_book/constants/AppColors.dart';
import 'package:video_book/constants/AppStrings.dart';
import 'package:video_book/customWidgets/LoginOptionButton.dart';
import 'package:video_book/helpers/AuthHelper.dart';

import '../../constants/constant_values.dart';
import '../../helpers/UIHelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              LoginOptionButton(
                  color: AppColors.googleColor,
                  text: AppStrings.loginWithGoogle,
                  icon: FontAwesomeIcons.google,
                  onPressedCallback: () => _loginWithGoogleCallback(context)),
              LoginOptionButton(
                  color: AppColors.facebookColor,
                  text: AppStrings.loginWithFacebook,
                  icon: FontAwesomeIcons.facebookSquare,
                  onPressedCallback: _loginWithFacebookCallback),
              LoginOptionButton(
                  color: AppColors.linkedInColor,
                  text: AppStrings.loginWithLinkedIn,
                  icon: FontAwesomeIcons.linkedin,
                  onPressedCallback: _loginWithLinkedInCallback)
            ],
          ),
        ),
      ),
    );
  }

  void _loginWithGoogleCallback(BuildContext context) async {
    FirebaseApp firebaseApp = await AuthHelper.initializeFirebase();

    User? user = await AuthHelper.signInWithGoogle();

    if (user != null) {
      Navigator.pushReplacementNamed(context, ScreenRoutes.homeScreen);
      UIHelper.showToast(AppStrings.signInSuccess);
    } else {
      UIHelper.showToast(AppStrings.signInFailed);
    }
  }

  void _loginWithFacebookCallback() {
    AuthHelper.loginWithFacebook();
  }

  void _loginWithLinkedInCallback() {}
}
