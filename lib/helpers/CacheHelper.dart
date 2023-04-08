import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_book/constants/constant_values.dart';
import 'package:video_book/models/AuthModels.dart';

class CacheHelper {
  final Future<SharedPreferences> _sharedPref = SharedPreferences.getInstance();

  void cacheSignedInUser(SignedInUser signedInUser) async {
    final pref = await _sharedPref;
    final json = jsonEncode(signedInUser.toJson()).toString();
    print("cacheSignedInUser : json : ${json}");
    pref.setString(Tags.signedInUserKey, json);
  }

  void clearSignedInUser() async {
    final pref = await _sharedPref;
    pref.remove(Tags.signedInUserKey);
  }

  Future<SignedInUser?> getSignedInUser() async {
    final pref = await _sharedPref;
    final json = pref.getString(Tags.signedInUserKey);
    if (json != null && json.isNotEmpty) {
      final signedInUser = SignedInUser.fromJson(jsonDecode(json));
      print("SignedInUser : ${signedInUser}");
      return signedInUser;
    }
    return null;
  }


  void cacheIsSignedIn(bool value) async {
    final pref = await _sharedPref;
    pref.setBool(Tags.isSignedInKey, value);
  }

  void clearIsSignedIn() async {
    final pref = await _sharedPref;
    pref.remove(Tags.isSignedInKey);
  }

  Future<bool> isSignedIn() async {
    final pref = await _sharedPref;
    return pref.getBool(Tags.isSignedInKey) ?? false;
  }
}
