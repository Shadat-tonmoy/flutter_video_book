import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_book/constants/ConstantValues.dart';

import '../constants/AppStrings.dart';

class SignedInUser {
  String userId;
  String displayName;
  String email;
  String profileImageUrl;
  int userType;

  SignedInUser(
      {required this.userId,
      required this.displayName,
      required this.email,
      required this.profileImageUrl,
      required this.userType});

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'displayName': displayName,
        'email': email,
        'profileImageUrl': profileImageUrl,
        'userType': userType
      };

  factory SignedInUser.fromJson(dynamic json) {
    print("Trying to decod : $json");
    return SignedInUser(
        userId: json['userId'] as String,
        displayName: json["displayName"] as String,
        email: json["email"] as String,
        profileImageUrl: json["profileImageUrl"] as String,
        userType: json["userType"] as int);
  }

  String getSignInWithMessage() {
    if (userType == SignedInUserType.loginWithGoogle) {
      return AppStrings.signedInWithGoogle;
    } else if (userType == SignedInUserType.loginWithFacebook) {
      return AppStrings.signedInWithFacebook;
    } else if (userType == SignedInUserType.loginWithLinkedIn) {
      return AppStrings.signedInWithLinkedIn;
    } else {
      return AppStrings.signedInAnonymously;
    }
  }

  IconData getSignInWithIcon() {
    if (userType == SignedInUserType.loginWithGoogle) {
      return FontAwesomeIcons.google;
    } else if (userType == SignedInUserType.loginWithFacebook) {
      return FontAwesomeIcons.facebook;
    } else if (userType == SignedInUserType.loginWithLinkedIn) {
      return FontAwesomeIcons.linkedin;
    } else {
      return FontAwesomeIcons.user;
    }
  }
}
