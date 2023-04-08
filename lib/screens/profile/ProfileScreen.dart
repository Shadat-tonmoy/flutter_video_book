import 'package:flutter/material.dart';
import 'package:video_book/constants/AppStrings.dart';
import 'package:video_book/constants/constant_values.dart';
import 'package:video_book/customWidgets/SignedInUserInfoView.dart';
import 'package:video_book/helpers/UIHelper.dart';
import 'package:video_book/screens/profile/ProfileScreenViewModel.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenViewModel _viewModel = ProfileScreenViewModel();

  @override
  void initState() {
    fetchSignedInUser();
    super.initState();
  }

  void fetchSignedInUser() async {
    await _viewModel.getSignedInUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SignedInUserInfoCard(
              signedInUser: _viewModel.signedInUser,
              singOutListener: () => _signOut())
        ],
      ),
    );
  }

  void _signOut() {
    _viewModel.signOut().then((result) {
      if (result == OperationResult.success) {
        Navigator.pushReplacementNamed(context, ScreenRoutes.loginScreen);
        UIHelper.showToast(AppStrings.signOutSuccess);
      } else {
        UIHelper.showToast(AppStrings.signOutFailed);
      }
    });
  }
}
