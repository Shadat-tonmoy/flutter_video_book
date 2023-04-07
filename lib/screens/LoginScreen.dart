import 'package:awesome_icons/awesome_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_book/constants/AppColors.dart';
import 'package:video_book/constants/AppStrings.dart';
import 'package:video_book/customWidgets/LoginOptionButton.dart';
import 'package:video_book/helpers/AuthHelper.dart';

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
    // Navigator.pushReplacementNamed(context, ScreenRoutes.homeScreen);
    print("Will start google sign in");
    FirebaseApp firebaseApp = await AuthHelper.initializeFirebase();
    print("Firebase app initialized! ${firebaseApp}");
    User? user = await AuthHelper.signInWithGoogle();
    print("Logged in user : ${user}");

  }

  void _loginWithFacebookCallback() {

  }

  void _loginWithLinkedInCallback() {

  }
}
