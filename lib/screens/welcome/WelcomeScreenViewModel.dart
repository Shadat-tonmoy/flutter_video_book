import 'dart:async';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:video_book/constants/ConstantValues.dart';
import 'package:video_book/helpers/CacheHelper.dart';
import 'package:video_book/models/AuthModels.dart';

class WelcomeScreenViewModel {
  final CacheHelper cacheHelper = CacheHelper();

  Future<bool> isLoggedInUser() async {
    bool isSignedIn = await cacheHelper.isSignedIn();
    SignedInUser? signedInUser = await cacheHelper.getSignedInUser();
    if (isSignedIn) {
      int signedInUserType = signedInUser?.userType ?? -1;
      if (signedInUserType == SignedInUserType.loginWithFacebook) {
        AccessToken? accessToken = await FacebookAuth.instance.accessToken;
        if (accessToken != null) {
          return true;
        } else {
          return false;
        }
      } else {
        return true;
      }
    }
    return false;
  }
}
