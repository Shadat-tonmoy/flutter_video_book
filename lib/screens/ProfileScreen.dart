import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_book/constants/AppColors.dart';
import 'package:video_book/constants/AppStrings.dart';
import 'package:video_book/constants/constant_values.dart';
import 'package:video_book/helpers/CacheHelper.dart';
import 'package:video_book/helpers/UIHelper.dart';

import '../helpers/AuthHelper.dart';
import '../models/AuthModels.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SignedInUser? signedInUser;

  @override
  void initState() {
    fetchSignedInUser();
    super.initState();
  }

  void fetchSignedInUser() async {
    var user = await _getSignedInUser();
    setState(() {
      signedInUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            signedInUser?.profileImageUrl ?? ""),
                        radius: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(signedInUser?.displayName ?? "",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          Text(signedInUser?.email ?? "")
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        _signOut();
                      },
                      style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                      child: const Text(AppStrings.signOut),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<SignedInUser?> _getSignedInUser() async {
    var signedInUser = CacheHelper().getSignedInUser();
    print("SignedInUser : ${signedInUser}");
    return signedInUser;
  }

  void _signOut() async {
    var result = await AuthHelper.signOut();
    if (result) {
      final cacheHelper = CacheHelper();
      await cacheHelper.clearSignedInUser();
      await cacheHelper.clearIsSignedIn();
      Navigator.pushReplacementNamed(context, ScreenRoutes.loginScreen);
      UIHelper.showToast(AppStrings.signOutSuccess);
    } else {
      UIHelper.showToast(AppStrings.signOutFailed);
    }
  }
}
