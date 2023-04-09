class ScreenRoutes {
  static const String welcomeScreen = "/";
  static const String loginScreen = "/login";
  static const String homeScreen = "/home";
  static const String aboutAppScreen = "/aboutApp";
}

class Tags {
  static const String signedInUserKey = "signed_in_user";
  static const String isSignedInKey = "is_signed_in";
  static const String appThemeKey = "app_theme";
}

class Keys {
  static const String youtubeAPIKey = "AIzaSyCHDqJkVGYlhmMwFTfjhXikv3zyFmUxogU";
}

enum OperationResult { none, success, failed, progress }

class CommentDBPath {
  static const String videoDataRoot = "video_data";
  static const String commentRoot = "comments";
  static const String commentTextRoot = "text";
  static const String commentSenderRoot = "sender";
  static const String commentSenderPhotoRoot = "sender_photo_uri";
  static const String commentTimeRoot = "commentTime";
}

class Consts {
  static const int userNameLength = 16;
}

class SignedInUserType {
  static const int loginWithGoogle = 1;
  static const int loginWithFacebook = 2;
  static const int loginWithLinkedIn = 3;
}
