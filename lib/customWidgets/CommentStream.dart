import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_book/customWidgets/CommentView.dart';
import 'package:video_book/customWidgets/FetchingCommentView.dart';
import 'package:video_book/models/CommentModel.dart';

import '../constants/ConstantValues.dart';
import 'NoCommentFoundView.dart';

class CommentStream extends StatelessWidget {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final String videoId;

  CommentStream({required this.videoId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: fireStore
          .collection(CommentDBPath.videoDataRoot)
          .doc(videoId)
          .collection(CommentDBPath.commentRoot)
          .orderBy(CommentDBPath.commentTimeRoot, descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        print(
            "Snapshot : ${snapshot.data?.docs.length}, hasData : ${snapshot.hasData}");
        if (snapshot.hasData) {
          final comments = snapshot.data?.docs ?? [];
          if (comments.isEmpty) {
            return const NoCommentFoundView();
          } else {
            return Expanded(
              child: ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final commentData = comments[index].data();
                    Comment commentModel = Comment.fromJson(commentData);
                    return CommentView(comment: commentModel);
                  }),
            );
          }
        } else {
          return const FetchingCommentView();
        }
      },
    );
  }
}
