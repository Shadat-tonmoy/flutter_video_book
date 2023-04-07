class SignedInUser {
  String userId;
  String displayName;
  String email;
  String profileImageUrl;

  SignedInUser(
      {required this.userId,
      required this.displayName,
      required this.email,
      required this.profileImageUrl});

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'displayName': displayName,
        'email': email,
        'profileImageUrl': profileImageUrl
      };

  factory SignedInUser.fromJson(dynamic json) {
    print("Trying to decod : $json");
    return SignedInUser(
        userId: json['userId'] as String,
        displayName: json["displayName"] as String,
        email: json["email"] as String,
        profileImageUrl: json["profileImageUrl"] as String);
  }
}
