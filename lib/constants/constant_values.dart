class ScreenRoutes {
  static const String welcomeScreen = "/";
  static const String loginScreen = "/login";
  static const String homeScreen = "/home";
}

class Tags {
  static const String signedInUserKey = "signed_in_user";
  static const String isSignedInKey = "is_signed_in";
}

class Keys {
  static const String youtubeAPIKey = "AIzaSyCHDqJkVGYlhmMwFTfjhXikv3zyFmUxogU";
}

enum OperationResult { none, success, failed, progress }

class CommentDBPath {
  static const String commentRoot = "comments";
  static const String commentTextRoot = "text";
  static const String commentSenderRoot = "sender";
  static const String commentSenderPhotoRoot = "sender_photo_uri";
  static const String commentTimeRoot = "timestamp";
}
