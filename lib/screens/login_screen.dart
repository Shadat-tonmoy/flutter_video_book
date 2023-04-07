import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:video_book/constants/AppColors.dart';
import 'package:video_book/constants/AppStrings.dart';
import 'package:video_book/customWidgets/LoginOptionButton.dart';

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
                  onPressedCallback: _loginWithGoogleCallback),
              LoginOptionButton(
                  color: AppColors.facebookColor,
                  text: AppStrings.loginWithFacebook,
                  icon: FontAwesomeIcons.facebookSquare,
                  onPressedCallback: _loginWithGoogleCallback),
              LoginOptionButton(
                  color: AppColors.linkedInColor,
                  text: AppStrings.loginWithLinkedIn,
                  icon: FontAwesomeIcons.linkedin,
                  onPressedCallback: _loginWithGoogleCallback)
            ],
          ),
        ),
      ),
    );
  }

  void _loginWithGoogleCallback() {}
}
