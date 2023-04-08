class Comment {
  String commentText;
  String userName;
  String userProfileImageUrl;

  Comment(
      {required this.commentText,
      required this.userName,
      required this.userProfileImageUrl});

  Map<String, dynamic> toJson() => {
        'commentText': commentText,
        'userName': userName,
        'userProfileImageUrl': userProfileImageUrl
      };

  factory Comment.fromJson(dynamic json) {
    print("Trying to decod : $json");
    return Comment(
        commentText: json['commentText'] as String,
        userName: json["userName"] as String,
        userProfileImageUrl: json["userProfileImageUrl"] as String);
  }

  @override
  String toString() {
    return "{text : $commentText, userName : $userName, url : $userProfileImageUrl}";
  }
}
