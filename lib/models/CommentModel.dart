import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  String commentText;
  String userName;
  String userProfileImageUrl;
  int timeStamp = Timestamp.now().millisecondsSinceEpoch;

  Comment(
      {required this.commentText,
      required this.userName,
      required this.userProfileImageUrl,
      required this.timeStamp});

  Map<String, dynamic> toJson() => {
        'commentText': commentText,
        'userName': userName,
        'userProfileImageUrl': userProfileImageUrl,
        'commentTime': timeStamp
      };

  factory Comment.fromJson(dynamic json) {
    print("Trying to decod : $json");
    return Comment(
        commentText: json['commentText'] as String,
        userName: json["userName"] as String,
        userProfileImageUrl: json["userProfileImageUrl"] as String,
        timeStamp: json["commentTime"] as int);
  }

  @override
  String toString() {
    return "{text : $commentText, userName : $userName, url : $userProfileImageUrl, timeStamp : $timeStamp}";
  }
}
