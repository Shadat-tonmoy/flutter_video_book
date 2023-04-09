import 'package:awesome_icons/awesome_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:video_book/constants/AppColors.dart';
import 'package:video_book/constants/AppStrings.dart';
import 'package:video_book/customWidgets/LoginOptionButton.dart';
import 'package:video_book/screens/loginWithLinkedIn/LoginWithLinkedInScreen.dart';
import 'package:video_book/helpers/AuthHelper.dart';
import 'package:video_book/models/AuthModels.dart';

import '../../constants/ConstantValues.dart';
import '../../helpers/UIHelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _inProgress,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/app_icon.png"),
                    radius: 50,
                  ),
                ),
                Column(
                  children: [
                    LoginOptionButton(
                        color: AppColors.googleColor,
                        text: AppStrings.loginWithGoogle,
                        icon: FontAwesomeIcons.google,
                        onPressedCallback: () =>
                            _handleLoginWithGoogle(context)),
                    LoginOptionButton(
                        color: AppColors.facebookColor,
                        text: AppStrings.loginWithFacebook,
                        icon: FontAwesomeIcons.facebookSquare,
                        onPressedCallback: _handleLoginWithFacebook),
                    LoginOptionButton(
                        color: AppColors.linkedInColor,
                        text: AppStrings.loginWithLinkedIn,
                        icon: FontAwesomeIcons.linkedin,
                        onPressedCallback: _handleLoginWithLinkedIn),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleLoginWithGoogle(BuildContext context) async {
    _updateProgressStatus(true);
    AuthHelper.initializeFirebase().then((value) {
      AuthHelper.signInWithGoogle().then((user) {
        if (user != null) {
          _moveToHomeScreen();
        } else {
          _updateProgressStatus(false);
          UIHelper.showToast(AppStrings.signInFailed);
        }
      });
    });
  }

  void _handleLoginWithFacebook() {
    _updateProgressStatus(true);
    AuthHelper.loginWithFacebook().then((result) {
      if (result == OperationResult.success) {
        _moveToHomeScreen();
      } else {
        _updateProgressStatus(false);
        UIHelper.showToast(AppStrings.signInFailed);
      }
    });
  }

  void _handleLoginWithLinkedIn() {
    _openLinkedInLoginPage();
  }

  void _moveToHomeScreen() {
    _updateProgressStatus(false);
    UIHelper.showToast(AppStrings.signInSuccess);
    Navigator.pushReplacementNamed(context, ScreenRoutes.homeScreen);
  }

  void _openLinkedInLoginPage() async {
    SignedInUser? signedInUser = await Navigator.push(
      context,
      MaterialPageRoute<SignedInUser>(
        builder: (final BuildContext context) => LoginWithLinkedInScreen(),
        fullscreenDialog: true,
      ),
    );

    if (signedInUser != null) {
      bool result = await AuthHelper.cacheLinkedInUserInfo(signedInUser);
      _moveToHomeScreen();
    }
  }

  void _updateProgressStatus(bool value){
    setState(() {
      _inProgress = value;
    });
  }
}
