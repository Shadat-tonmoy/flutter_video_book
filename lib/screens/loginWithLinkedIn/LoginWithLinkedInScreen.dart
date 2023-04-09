import 'package:flutter/material.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:video_book/screens/loginWithLinkedIn/LoginWithLinkedInViewModel.dart';

import '../../constants/AppStrings.dart';
import '../../models/AuthModels.dart';

class LoginWithLinkedInScreen extends StatelessWidget {
  LoginWithLinkedInScreen({Key? key}) : super(key: key);

  final LoginWithLinkedInViewModel _viewModel = LoginWithLinkedInViewModel();

  @override
  Widget build(BuildContext context) {
    return LinkedInUserWidget(
      appBar: AppBar(
        title: const Text(AppStrings.loginWithLinkedIn),
      ),
      destroySession: _viewModel.logoutUser,
      redirectUrl: _viewModel.redirectUrl,
      clientId: _viewModel.clientId,
      clientSecret: _viewModel.clientSecret,
      projection: _viewModel.projectionArray,
      onError: (final UserFailedAction e) {
        print('Error: ${e.toString()}');
        print('Error: ${e.stackTrace.toString()}');
      },
      onGetUserProfile: (final UserSucceededAction linkedInUser) {
        print('Access token ${linkedInUser.user.token.accessToken}');

        SignedInUser signedInUser = _viewModel.getSignedInUser(linkedInUser);

        Navigator.pop(context, signedInUser);
      },
    );
  }
}
