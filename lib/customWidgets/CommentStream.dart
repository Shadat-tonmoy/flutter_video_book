import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_book/customWidgets/CommentView.dart';
import 'package:video_book/models/CommentModel.dart';

import '../constants/constant_values.dart';

class CommentStream extends StatelessWidget {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: fireStore
          .collection(CommentDBPath.commentRoot)
          // .orderBy(CommentDBPath.commentTimeRoot, descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        print("Snapshot : ${snapshot.data?.docs.length}");
        if (snapshot.hasData) {
          final comments = snapshot.data?.docs ?? [];
          /*for (var comment in comments) {
            print("Total Comment ${comment.data}");
          }
          List<Widget> commentWidgets = [];
          for (var comment in comments) {
            final commentData = comment.data();
            Comment commentModel = Comment.fromJson(commentData);
            print("Comment : ${commentModel}");
            commentWidgets.add(CommentView(comment: commentModel));
            */ /*var text = comment.data[CommentDBPath.commentTextRoot];
            var sender = message.data[CommentDBPath.commentSenderRoot];
            messageWidgets.add(MessageBubble(text: text, sender: sender));*/ /*
          }*/
          return Expanded(
            child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final commentData = comments[index].data();
                  Comment commentModel = Comment.fromJson(commentData);
                  return CommentView(comment: commentModel);
                }),
          );
        } else
          return Text("No Recent Chats");
      },
    );
  }
}
