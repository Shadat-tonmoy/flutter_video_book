import 'dart:async';

import 'package:video_book/helpers/CacheHelper.dart';

class WelcomeScreenViewModel {

  Future<bool> isLoggedInUser() async {
    return CacheHelper().isSignedIn();
  }
}
