import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_book/constants/ConstantValues.dart';
import 'package:video_book/screens/welcome/WelcomeScreenViewModel.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  final WelcomeScreenViewModel _viewModel = WelcomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      _moveToNextScreen(context);
    });
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/app_icon.png"),
              radius: 80,
            ),
          )
        ]));
  }

  void _moveToNextScreen(BuildContext context) {
    _viewModel.isLoggedInUser().then((isLoggedIn) {
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, ScreenRoutes.homeScreen);
      } else {
        Navigator.pushReplacementNamed(context, ScreenRoutes.loginScreen);
      }
    });
  }
}
