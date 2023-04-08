import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:video_book/constants/AppStrings.dart';
import 'package:video_book/constants/constant_values.dart';
import 'package:video_book/customWidgets/ProfileOptionView.dart';
import 'package:video_book/customWidgets/SignedInUserInfoView.dart';
import 'package:video_book/helpers/UIHelper.dart';
import 'package:video_book/screens/profile/ProfileScreenViewModel.dart';

import '../themeOption/AppThemeOptionBottomSheet.dart';

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
              singOutListener: () => _signOut()),
          Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.settings,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  const Divider(color: Colors.grey),
                  ProfileOptionView(
                      title: AppStrings.appTheme,
                      iconData: FontAwesomeIcons.palette,
                      optionClickListener: () => {_showThemeOption()}),
                  ProfileOptionView(
                      title: AppStrings.aboutApp,
                      iconData: FontAwesomeIcons.infoCircle,
                      optionClickListener: () => {})
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showThemeOption() {
    /*showModalBottomSheet(
        context: context,
        builder: (context) => const AppThemeOptionBottomSheet(),
        isScrollControlled: true);*/

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AppThemeOptionBottomSheet();
        });
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
